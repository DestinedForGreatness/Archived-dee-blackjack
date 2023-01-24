local spawnedCards = {}
local spawnedTables = {}
local tables = Config.TABLES

RegisterCommand('testgames', function(_,args)
    if not #args == 3 then
        return print('command only takes three parameters')
    end
    print('starting simulation of '..args[2]..' games with a bet of '..args[1])
    TriggerServerEvent('dee-blackjack:server:startgamesim', args[1], args[2], args[3])
end)

RegisterCommand('testresponse', function(_,args)
    if not #args == 3 then
        return print('command only takes three parameters')
    end
    TriggerServerEvent('dee-blackjack:server:recieveResponse', args[1], args[2], args[3])
end)

RegisterCommand('placetable', function()
    for table,info in pairs(tables) do
        local tableCoords = info.TABLE.coords
        local tableObj = CreateObject(GetHashKey(info.TABLE.prop),tableCoords.x,tableCoords.y,tableCoords.z,1,1,0)
        PlaceObjectOnGroundProperly(tableObj)
        FreezeEntityPosition(tableObj, true)
        SetEntityHeading(tableObj, tableCoords.w)
        info.spawned = true
        spawnedTables[#spawnedTables+1] = tableObj
        local tabletObj = CreateObject(GetHashKey(info.THIRDEYE.PROP),tableCoords.x,tableCoords.y,tableCoords.z,1,1,0)
        local tabletCoords = GetEntityCoords(tabletObj)
        AttachEntityToEntity(tabletObj, tableObj, 0, 0, 0, 1.2, 0, 0, 80, false, false, false, false, 2, false)
        tabletCoords = GetEntityCoords(tabletObj)
        print(tabletCoords)
        spawnedTables[#spawnedTables+1] = tabletObj
    end
end)

RegisterCommand('removetable', function()
    for i=1, #spawnedTables do
        DeleteObject(spawnedTables[i])
    end
end)

RegisterCommand('placecards', function()
    local coords = GetEntityCoords(PlayerPedId())
    local heading = GetEntityHeading(PlayerPedId())
    coords = vector4(coords.x+1,coords.y,coords.z,heading)
    for suit,cards in pairs(Config.CARDS) do
        for card,propHash in pairs(cards) do
            print(coords)
            print('Spawn Card: '..card)
            local cardObject = CreateObject(GetHashKey(propHash),coords.x,coords.y,coords.z, 1, 1, 0)
            PlaceObjectOnGroundProperly(cardObject)
            FreezeEntityPosition(cardObject, true)
            SetEntityHeading(cardObject, coords.w)
            heading = heading + 20
            coords = vector4(coords.x,coords.y+0.2,coords.z,heading)
            table.insert(spawnedCards,cardObject)
        end
    end
end)

RegisterCommand('removecards', function()
    for i=1, #spawnedCards do
        DeleteObject(spawnedCards[i])
    end
end)