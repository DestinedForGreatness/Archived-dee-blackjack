local tables = Config.TABLES

Citizen.CreateThread(function()
    FillAllShoes()
end)

RegisterServerEvent('dee-blackjack:server:startgamesim', function(tableName,bet,numGames)
    print('starting simulation of '..numGames..' games with a bet of '..bet..' on table '..tableName)
    --local count = 0
    --while count < tonumber(numGames) do
        --if not tables[tableName].started then
            for i=1, #tables[tableName].SEATS do
                if tables[tableName].SEATS[i].player ~= nil then
                    tables[tableName].SEATS[i].bets[1] = bet
                end
            end
            StartGame(tableName, tables[tableName])
            -- count = count+1
            -- while tables[tableName].started do

            -- end
        --end
    --end
end)

RegisterServerEvent('dee-blackjack:server:recieveResponse', function(tableName,seat,response)
    tables[tableName].SEATS[tonumber(seat)].response = response
end)

function FillAllShoes()
    for tableName, table in pairs(tables) do
        math.randomseed(os.time())
        RefillShoe(tableName,table)
    end
    print('Done Filling All Shoes')
end

--- @param tableName  string
--- @param table table
function RefillShoe(tableName,table)
    local shoe = {}
    local DECK = Config.CARDS

    for i=1, table.SHOE.TYPE do
        for i=1, #DECK do
            shoe[#shoe+1] = DECK[i]
        end
    end
    math.randomseed(os.time())
    shoe = Shuffle(shoe)
    table.SHOE.cards = shoe
    print('Table Shoe Filled : '..tableName)
end

function Shuffle(deck) --Shuffling using the Fisher-Yates algorithm
    local n = #deck
    for i = n, 2, -1 do
        local j = math.random(i)
        deck[i], deck[j] = deck[j], deck[i]
    end
    return deck
end

--- @param tableName  string
--- @param table table
function StartGame(tableName, table)
    Citizen.CreateThread(function()
        table.started = true
        math.randomseed(os.time())
        if #table.SHOE.cards <= (table.SHOE.TYPE*52)/2 then
            RefillShoe(tableName,table)
        end

        for i=1, #table.SEATS do
            table.SEATS[i].hands = {{}}
            TakeBet(table.SEATS[i].player,table.SEATS[i].bets[#table.SEATS[i].bets])
        end

        table.DEALER.hand = {}

        for r=1, 2 do
            for i=1, #table.SEATS do
                if table.SEATS[i].player ~= nil then
                    table.SEATS[i].hands[1],table.SHOE.cards = DealCard(table.SEATS[i].hands[1],table.SHOE.cards)
                    Wait(1000)
                    print('Player '..table.SEATS[i].player..' hand after dealt card: '..json.encode(table.SEATS[i].hands[1]))
                end
            end
            table.DEALER.hand,table.SHOE.cards = DealCard(table.DEALER.hand,table.SHOE.cards)
            print('Dealer hand after dealt card: '..json.encode(table.DEALER.hand))
        end
        for i=1, #table.SEATS do
            if table.SEATS[i].player ~= nil and CheckForBlackjack(table.SEATS[i].hands[1]) then
                table.SEATS[i].out = true
                print('Woot Player: '..table.SEATS[i].player..' Has Gotten Blackjack')
                PayOut(table.SEATS[i].player,table.SEATS[i].bets[#table.SEATS[i].bets]*2.5)
                table.SEATS[i].bets = {}
            end
        end
        if CheckForBlackjack(table.DEALER.hand) then
            for i=1, #table.SEATS do
                if table.SEATS[i].player ~= nil and not table.SEATS[i].out then
                    print('Sorry Player : '..table.SEATS[i].player..' Dealer Blackjack')
                    table.SEATS[i].bets = {}
                    
                    table.started = false
                end
            end
        end
        if table.started then
            for i=1, #table.SEATS do
                if table.SEATS[i].player ~= nil and not table.SEATS[i].out then
                    print('Dealer Count: '..CountHand({table.DEALER.hand[1]}))
                    table.SHOE.cards = PlayerHandTurn(table.SEATS[i],table.SEATS[i].hands[1],table.SEATS[i].bets[#table.SEATS[i].bets],table.SHOE.cards)
                end
            end
            
            table.SHOE.cards = DealerHandTurn(table.DEALER.hand,table.SHOE.cards)

            for i=1, #table.SEATS do
                if table.SEATS[i].player ~= nil then
                    for h=1, #table.SEATS[i].hands do
                        local hand = table.SEATS[i].hands[h]
                        print(json.encode(hand))
                        print('Player '..table.SEATS[i].player..': '..CountHand(hand))
                    end
                end
            end
            print(json.encode(table.DEALER.hand))
            print('Dealer: '..CountHand(table.DEALER.hand))
            for i=1, #table.SEATS do
                if not table.SEATS[i].out then
                    local hands = table.SEATS[i].hands
                    for h=1, #hands do
                        if (CountHand(hands[h]) <= 21 and CountHand(hands[h]) > CountHand(table.DEALER.hand)) or (CountHand(table.DEALER.hand) > 21 and CountHand(hands[h]) <= 21) then
                            print('Woot Player: '..table.SEATS[i].player..' Has Won')
                            PayOut(table.SEATS[i].player,table.SEATS[i].bets[h]*2)
                        elseif CountHand(hands[h]) == CountHand(table.DEALER.hand) then
                            print('Player: '..table.SEATS[i].player..' Has Pushed')
                            PayOut(table.SEATS[i].player,table.SEATS[i].bets[h])
                        else
                            print('Sorry Player : '..table.SEATS[i].player..' You lost')
                        end
                    end
                    table.SEATS[i].hands = {}
                end
                table.SEATS[i].out = false
            end
        end
        table.started = false
    end)
end

---@param hand array
---@param shoe array
function DealCard(hand,shoe)
    --print(json.encode(shoe))
    hand[#hand+1] = shoe[1]
    local newShoe = {}
    for i=2, #shoe do
        newShoe[i-1] = shoe[i]
    end
    shoe = newShoe
    return hand,shoe
end


---@param playerSeat table
---@param playerHand array
---@param shoe array 
function PlayerHandTurn(playerSeat,playerHand,playerBet,shoe)
    print('Player '..playerSeat.player..' It is your turn')
    print(json.encode(playerHand))
    print(CountHand(playerHand))
    while playerSeat.response == nil do
        --print(playerSeat.response)
        Wait(2000)
    end
    --print(playerSeat.response)
    if playerSeat.response == 'hit' then
        print('Player Hit')
        playerHand,shoe = DealCard(playerHand,shoe)
        playerSeat.response = nil
        if CountHand(playerHand) < 21 then
            shoe = PlayerHandTurn(playerSeat,playerHand,playerBet,shoe)
        elseif CountHand(playerHand) == 21 and #playerHand == 2 then
            playerSeat.out = true
            PayOut(playerSeat.player,playerBet*2)
        else
            print(CountHand(playerHand))
        end

        return shoe
    elseif playerSeat.response == 'stay' then
        print('Player Stood')
        playerSeat.response = nil
        return shoe
    elseif playerSeat.response == 'double' then
        print('Player Doubled Down')
        playerHand,shoe = DealCard(playerHand,shoe)
        playerSeat.response = nil
        playerBet = playerBet*2
        return shoe
    elseif playerSeat.response == 'split' and (playerHand[1].value == playerHand[2].value and #playerHand == 2) then
        print('Player Split')
        playerSeat.hands[#playerSeat.hands+1] = {playerHand[2]}
        playerHand = {playerHand[1]}
        playerHand,shoe = DealCard(playerHand,shoe)
        playerHand,shoe = DealCard(playerSeat.hands[#playerSeat.hands],shoe)
        playerSeat.response = nil
        shoe = PlayerHandTurn(playerSeat,playerHand,playerBet,shoe)
        playerSeat.bets[#playerSeat.bets+1] = playerBet
        shoe = PlayerHandTurn(playerSeat,playerSeat.hands[#playerSeat.hands],playerSeat.bets[#playerSeat.bets+1],shoe)
        return shoe
    end
    playerSeat.response = nil
    print('invalid response')
    shoe = PlayerHandTurn(playerSeat,playerHand,playerBet,shoe)
end

---@param hand array
---@param shoe array
function DealerHandTurn(hand,shoe)
    --print(json.encode(shoe))
    while CountHand(hand) < 17 do
        hand,shoe = DealCard(hand,shoe)
        print(json.encode(hand))
        print(CountHand(hand))
        Wait(2000)
    end
    print(json.encode(shoe))
    return shoe
end

---@param source number
---@param bet number
function TakeBet(source, bet)
    print('Bet of : '..bet..' chips has been taken from player: '..source)
end

---@param source number
---@param bet number
function PayOut(source, bet)
    print('Payout of : '..bet..' chips has been given to player: '..source)
end

--- @param hand array
function CheckForBlackjack(hand)
    local hasAce = false
    local has10 = false
    for i=1, #hand do
        if hand[i].value == 'A' then
            hasAce = true
        elseif hand[i].value == '10' or hand[i].value == 'jack' or hand[i].value == 'queen' or hand[i].value == 'king' then
            has10 = true
        end
    end
    if hasAce and has10 then
        return true
    end
    return false
end

--- @param hand
function CountHand(hand)
    local count = 0
    for i=1, #hand do
        local card = hand[i].value
        if card == 'A' then
            if count+11 <=21 then
                count = count + 11
            else
                count = count + 1
            end
        elseif card == 'king' or card == 'queen' or card == 'jack' then
            count = count + 10
        else
            count = count + tonumber(card)
        end
    end
    return count
end