Config = {}

Config.CARDS = {
        {
            prop = 'vw_prop_vw_club_char_a_a',
            value = 'A',
        },
        {
            prop = 'vw_prop_vw_club_char_02a',
            value = '2',
        },
        {
            prop = 'vw_prop_vw_club_char_03a',
            value = '3',
        },
        {
            prop = 'vw_prop_vw_club_char_04a',
            value = '4',
        },
        {
            prop = 'vw_prop_vw_club_char_05a',
            value = '5',
        },
        {
            prop = 'vw_prop_vw_club_char_06a',
            value = '6',
        },
        {
            prop = 'vw_prop_vw_club_char_07a',
            value = '7',
        },
        {
            prop = 'vw_prop_vw_club_char_08a',
            value = '8',
        },
        {
            prop = 'vw_prop_vw_club_char_09a',
            value = '9',
        },
        {
            prop = 'vw_prop_vw_club_char_10a',
            value = '10',
        },
        {
            prop = 'vw_prop_vw_club_char_j_a',
            value = 'jack',
        },
        {
            prop = 'vw_prop_vw_club_char_q_a',
            value = 'queen',
        },
        {
            prop = 'vw_prop_vw_club_char_k_a',
            value = 'king',
        },
        {
            prop = 'vw_prop_vw_spd_char_a_a',
            value = 'A',
        },
        {
            prop = 'vw_prop_vw_spd_char_02a',
            value = '2',
        },
        {
            prop = 'vw_prop_vw_spd_char_03a',
            value = '3',
        },
        {
            prop = 'vw_prop_vw_spd_char_04a',
            value = '4',
        },
        {
            prop = 'vw_prop_vw_spd_char_05a',
            value = '5',
        },
        {
            prop = 'vw_prop_vw_spd_char_06a',
            value = '6',
        },
        {
            prop = 'vw_prop_vw_spd_char_07a',
            value = '7',
        },
        {
            prop = 'vw_prop_vw_spd_char_08a',
            value = '8',
        },
        {
            prop = 'vw_prop_vw_spd_char_09a',
            value = '9',
        },
        {
            prop = 'vw_prop_vw_spd_char_10a',
            value = '10',
        },
        {
            prop = 'vw_prop_vw_spd_char_j_a',
            value = 'jack',
        },
        {
            prop = 'vw_prop_vw_spd_char_q_a',
            value = 'queen',
        },
        {
            prop = 'vw_prop_vw_spd_char_k_a',
            value = 'king',
        },
        {
            prop = 'vw_prop_vw_dia_char_a_a',
            value = 'A',
        },
        {
            prop = 'vw_prop_vw_dia_char_02a',
            value = '2',
        },
        {
            prop = 'vw_prop_vw_dia_char_03a',
            value = '3',
        },
        {
            prop = 'vw_prop_vw_dia_char_04a',
            value = '4',
        },
        {
            prop = 'vw_prop_vw_dia_char_05a',
            value = '5',
        },
        {
            prop = 'vw_prop_vw_dia_char_06a',
            value = '6',
        },
        {
            prop = 'vw_prop_vw_dia_char_07a',
            value = '7',
        },
        {
            prop = 'vw_prop_vw_dia_char_08a',
            value = '8',
        },
        {
            prop = 'vw_prop_vw_dia_char_09a',
            value = '9',
        },
        {
            prop = 'vw_prop_vw_dia_char_10a',
            value = '10',
        },
        {
            prop = 'vw_prop_vw_dia_char_j_a',
            value = 'jack',
        },
        {
            prop = 'vw_prop_vw_dia_char_q_a',
            value = 'queen',
        },
        {
            prop = 'vw_prop_vw_dia_char_k_a',
            value = 'king',
        },
        {
            prop = 'vw_prop_vw_hrt_char_a_a',
            value = 'A',
        },
        {
            prop = 'vw_prop_vw_hrt_char_02a',
            value = '2',
        },
        {
            prop = 'vw_prop_vw_hrt_char_03a',
            value = '3',
        },
        {
            prop = 'vw_prop_vw_hrt_char_04a',
            value = '4',
        },
        {
            prop = 'vw_prop_vw_hrt_char_05a',
            value = '5',
        },
        {
            prop = 'vw_prop_vw_hrt_char_06a',
            value = '6',
        },
        {
            prop = 'vw_prop_vw_hrt_char_07a',
            value = '7',
        },
        {
            prop = 'vw_prop_vw_hrt_char_08a',
            value = '8',
        },
        {
            prop = 'vw_prop_vw_hrt_char_09a',
            value = '9',
        },
        {
            prop = 'vw_prop_vw_hrt_char_10a',
            value = '10',
        },
        {
            prop = 'vw_prop_vw_hrt_char_j_a',
            value = 'jack',
        },
        {
            prop = 'vw_prop_vw_hrt_char_q_a',
            value = 'queen',
        },
        {
            prop = 'vw_prop_vw_hrt_char_k_a',
            value = 'king',
        },
}

Config.TABLES = {
    ['FirstTable'] = {
        TURNTIME = 5, -- time in seconds
        SHOE = {
            TYPE = 6, -- number of decks,
            cards, -- array of current cards left in the shoe
        },
        TABLE = {
            prop = 'vw_prop_casino_blckjack_01b',
            coords = vector4(897.9996, 6.1664, 78.8528, 328.0834),
        },
        THIRDEYE = {
            LABEL = 'Select Play',
            ICON = 'fas lock',
            PROP = 'hei_prop_dlc_tablet',
        },
        DEALER = {
            ped = 'S_M_Y_Casino_01',
            hand = {}, -- array of dealers current hand
        },
        SEATS = {
            [1] = {
                player = 1, -- source number
                hands = {}, -- array of current hands
                bets = {}, -- number of current bet amount
                response = nil,
                out = false,
            },
            [2] = {
                player = 4, -- source number
                hands = {}, -- array of current hands
                bets = {}, -- number of current bet amount
                response = nil,
                out = false,
            },
            [3] = {
                player = 7, -- source number
                hands = {}, -- array of current hands
                bets = {}, -- number of current bet amount
                response = nil,
                out = false,
            },
            [4] = {
                player = 5, -- source number
                hands = {}, -- array of current hands
                bets = {}, -- number of current bet amount
                response = nil,
                out = false,
            },
        },
        started = false,
        spawned = false
    },
    ['SecondTable'] = {
        TURNTIME = 5, -- time in seconds
        SHOE = {
            TYPE = 6, -- number of decks,
            cards, -- array of current cards left in the shoe
        },
        TABLE = {
            prop = 'vw_prop_casino_blckjack_01b',
            coords = vector4(893.7466, 8.4715, 78.8745, 323.1340),
        },
        THIRDEYE = {
            LABEL = 'Select Play',
            ICON = 'fas lock',
            PROP = 'hei_prop_dlc_tablet',
        },
        DEALER = {
            ped = 'S_M_Y_Casino_01',
            hand = {}, -- array of dealers current hand
        },
        SEATS = {
            [1] = {
                player = 1, -- source number
                hands = {}, -- array of current hands
                bets = {}, -- number of current bet amount
                response = nil,
                out = false,
            },
            [2] = {
                player = 4, -- source number
                hands = {}, -- array of current hands
                bets = {}, -- number of current bet amount
                response = nil,
                out = false,
            },
            [3] = {
                player = 7, -- source number
                hands = {}, -- array of current hands
                bets = {}, -- number of current bet amount
                response = nil,
                out = false,
            },
            [4] = {
                player = 5, -- source number
                hands = {}, -- array of current hands
                bets = {}, -- number of current bet amount
                response = nil,
                out = false,
            },
        },
        started = false,
        spawned = false
    },
    ['ThirdTable'] = {
        TURNTIME = 5, -- time in seconds
        SHOE = {
            TYPE = 6, -- number of decks,
            cards, -- array of current cards left in the shoe
        },
        TABLE = {
            prop = 'vw_prop_casino_blckjack_01b',
            coords = vector4(889.4541, 10.9513, 78.8951, 331.8235),
        },
        THIRDEYE = {
            LABEL = 'Select Play',
            ICON = 'fas lock',
            PROP = 'hei_prop_dlc_tablet',
        },
        DEALER = {
            ped = 'S_M_Y_Casino_01',
            hand = {}, -- array of dealers current hand
        },
        SEATS = {
            [1] = {
                player = 1, -- source number
                hands = {}, -- array of current hands
                bets = {}, -- number of current bet amount
                response = nil,
                out = false,
            },
            [2] = {
                player = 4, -- source number
                hands = {}, -- array of current hands
                bets = {}, -- number of current bet amount
                response = nil,
                out = false,
            },
            [3] = {
                player = 7, -- source number
                hands = {}, -- array of current hands
                bets = {}, -- number of current bet amount
                response = nil,
                out = false,
            },
            [4] = {
                player = 5, -- source number
                hands = {}, -- array of current hands
                bets = {}, -- number of current bet amount
                response = nil,
                out = false,
            },
        },
        started = false,
        spawned = false
    }
}