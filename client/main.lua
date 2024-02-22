lib.locale()

local function atmrob()
    TriggerServerEvent('khalexi_atmrob')
end

RegisterNetEvent('khalexi_atmrob:robStart')
AddEventHandler('khalexi_atmrob:robStart', function()
    isRobbing = true
end)

RegisterNetEvent('khalexi_atmrob:robEnd')
AddEventHandler('khalexi_atmrob:robEnd', function()
    isRobbing = false
end)

local function main()
    local pos = GetEntityCoords(PlayerPedId())
    local _, dist = lib.getClosestObject(pos, 2.0)

local count = ox_inventory:Search('count', K.Robitem)
if count > 0 then
    local result = lib.skillCheck({K.Skillcheck, K.Skillcheck, K.Skillcheck, K.Skillcheck}, K.Inputs)
            
    if K.Notify == "cd_dispatch" then
        local data = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = K.Jobs,
            coords = data.coords,
            title = '10-15 - ATM Robbery',
            message = ''..data.sex..' robbing an ATM at '..data.street, 
            flash = 0,
            unique_id = data.unique_id,
            sound = 1,
            blip = {
                sprite = 59,
                scale = 1.2,
                colour = 39,
                flashes = false,
                text = '911 - ATM Robbery',
                time = 5,
                sound = 1,
            }
        })
    elseif K.Notify == "quasar-dispatch" then
        local playerData = exports['qs-dispatch']:GetPlayerInfo()
        TriggerServerEvent('qs-dispatch:server:CreateDispatchCall', {
            job = K.Jobs,
            callLocation = playerData.coords,
            callCode = { code = 'ATM Robbery' },
            message = "A "..playerData.sex.. "Is robbing a ATM at: ".. playerData.street_1,
            flashes = false,
            image = image or nil,
            blip = {
                sprite = 488,
                scale = 1.5,
                colour = 1,
                flashes = true,
                text = 'ATM Robbery',
                time = (20 * 1000),
            }
        })
    elseif K.Notify == "core-dispatch" then
        for k, v in pairs(K.Jobs) do
            local coords = GetEntityCoords(PlayerPedId())
            exports['core_dispach']:addMessage("ATM Robbery", {coords}, v, 3000, 11, 5 )
        end
    elseif K.Notify == "op-dispatch" then
        for k,v in pairs(K.Jobs) do
            local job = v -- Jobs that will recive the alert
            local text = "ATM Robbery" -- Main text alert
            local coords = GetEntityCoords(PlayerPedId()) -- Alert coords
            local id = GetPlayerServerId(PlayerId()) -- Player that triggered the alert
            local title = "ATM Robbery" -- Main title alert
            local panic = false -- Allow/Disable panic effect
            TriggerServerEvent('Opto_dispatch:Server:SendAlert', job, title, text, coords, panic, id)
         end
        end

        if result then
            if lib.progressCircle({
                duration = 29000,
                position = 'bottom',
                useWhileDead = false,
                canCancel = true,
                disable = {
                    car = true,
                    move = true,
                },
                anim = {
                    dict = 'weapons@first_person@aim_idle@p_m_zero@submachine_gun@assault_smg@fidgets@b',
                    clip = 'fidget_low_loop',
                    flag = 1
                },
            }) then
                TriggerServerEvent('khalexi_atmrob:payout')
                atmrob()
            else
                ClearPedTasks(cache.ped) 
            end
        else
            lib.notify({type='error', description=locale('failed')})
        end
    else
        lib.notify({type='error', description=locale('noItem'), icon="fa-solid fa-power-off"})
    end
end


CreateThread(function()
    local options = {
        label = locale('atm'),
        icon = K.RobIcon,
        distance = K.Distance,
        onSelect = function()
            main()
        end

    }
    exports.ox_target:addModel(K.Models, options)
end)
