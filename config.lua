K = {}
ox_inventory = exports.ox_inventory

-- Jobs that will be alerted
K.Jobs = { 
    'police'
}

-- what dispatch you are using
K.Notify = "op-dispatch" -- supports op-dispatch, core-dispatch, quasar-dispatch and cd_dispatch

-- Here you can choose how hard the skillcheck is. difficulty: 'easy' or 'medium' or 'hard' or table
K.Skillcheck = 'medium'
K.Skillcheck = 'medium'
K.Skillcheck = 'medium'
K.Skillcheck = 'medium'

-- choose what item do you need to start the robbery
K.Robitem = 'WEAPON_CROWBAR'

K.Reward = 'black_money' -- what do you get from the robbery
K.MinAmount = 1 -- the min amount you get from the robbery
K.MaxAmount = 12 -- the max amount you get from the robbery

-- the distance you want to the robbery
K.Distance = 1.3

K.RobbingTime = 29000

-- What icon do you want when you look at the ATM with the target?
K.RobIcon = "fa-solid fa-star" -- You can choose the icons here: https://fontawesome.com/search

-- What models you want for the robbery
K.Models = {
    `prop_atm_03`,
    `prop_fleeca_atm`,
    `prop_atm_01`,
    `prop_atm_02`
}

--- Ox lib lockpick keys
K.Inputs = {'e', 'e', 'e', 'e'} 
