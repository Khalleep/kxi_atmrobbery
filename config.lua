K = {}
ox_inventory = exports.ox_inventory

-- Jobs that will be alerted
K.Jobs = { 
    'police'
}

-- what dispatch you are using
K.Notify = "op-dispatch" -- supports op-dispatch, core-dispatch, quasar-dispatch and cd_dispatch

-- choose what item do you need to start the robbery
K.Robitem = 'WEAPON_CROWBAR'

K.Reward = 'black_money' -- what do you get from the robbery
K.MinAmount = 1 -- the min amount you get from the robbery
K.MaxAmount = 12 -- the max amount you get from the robbery

-- What models you want for the robbery
K.Models = {
    `prop_atm_03`,
    `prop_fleeca_atm`,
    `prop_atm_01`,
    `prop_atm_02`
}

--- Ox lib lockpick keys
K.Inputs = {'e', 'e', 'e', 'e'} 