-----------------------
-- I don't wanna have to do this but Script made by J. Manlet for RGRP
----------------------

RegisterServerEvent('notify')
AddEventHandler('notify', function(name, msg)
	TriggerClientEvent('chatMessage', -1, "^1Identification of [ID: " .. name..'] Name:', { 128, 128, 128 }, msg)
end)

-- LEO Events

AddEventHandler("chatMessage", function(source, name, message)
	cm = stringsplit(message, " ")

	if cm[1] == "/hu" then
		CancelEvent()
		TriggerClientEvent("Handsup", source)
	end
	
	if cm[1] == "/unlockleomenu" then
		CancelEvent()
		TriggerClientEvent("unlockmenu", source)
	end
	
	if cm[1] == "/huk" then
		CancelEvent()
		TriggerClientEvent("KneelHU", source)
	end
	
	if cm[1] == "/uncuff" then
		CancelEvent()
		TriggerClientEvent("Handsdown", source)
	end	
end)

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

RegisterServerEvent('cuffGranted')
AddEventHandler('cuffGranted', function(t)
	TriggerClientEvent('getCuffed', t)
end)

RegisterServerEvent('uncuffGranted')
AddEventHandler('uncuffGranted', function(t)
	TriggerClientEvent('getUncuffed', t)
end)

RegisterServerEvent('dragRequest')
AddEventHandler('dragRequest', function(t)
	TriggerClientEvent('toggleDrag', t, source)
end)

RegisterServerEvent('forceEnterAsk')
AddEventHandler('forceEnterAsk', function(t, v)
	TriggerClientEvent('forcedEnteringVeh', t, v)
end)

RegisterServerEvent('confirmUnseat')
AddEventHandler('confirmUnseat', function(t)
	TriggerClientEvent('unseatme', t)
end)
-- LEO Events

--SERVER EVENTS FOR CIV ADVERTS	

RegisterServerEvent("syncad1")
AddEventHandler('syncad1', function(inputText)
TriggerClientEvent('displayad1', -1, inputText)
end)

RegisterServerEvent("syncad2")
AddEventHandler('syncad2', function(inputText)
TriggerClientEvent('displayad2', -1, inputText)
end)

RegisterServerEvent("syncad3")
AddEventHandler('syncad3', function(inputText)
TriggerClientEvent('displayad3', -1, inputText)
end)

RegisterServerEvent("syncad4")
AddEventHandler('syncad4', function(inputText)
TriggerClientEvent('displayad4', -1, inputText)
end)

RegisterServerEvent("syncad5")
AddEventHandler('syncad5', function(inputText)
TriggerClientEvent('displayad5', -1, inputText)
end)

RegisterServerEvent("syncad6")
AddEventHandler('syncad6', function(inputText)
TriggerClientEvent('displayad6', -1, inputText)
end)

RegisterServerEvent("syncad7")
AddEventHandler('syncad7', function(inputText)
TriggerClientEvent('displayad7', -1, inputText)
end)

RegisterServerEvent("syncad8")
AddEventHandler('syncad8', function(inputText)
TriggerClientEvent('displayad8', -1, inputText)
end)

RegisterServerEvent("syncad9")
AddEventHandler('syncad9', function(inputText)
TriggerClientEvent('displayad9', -1, inputText)
end)

RegisterServerEvent("syncad10")
AddEventHandler('syncad10', function(inputText)
TriggerClientEvent('displayad10', -1, inputText)
end)

RegisterServerEvent("syncad11")
AddEventHandler('syncad11', function(inputText)
TriggerClientEvent('displayad11', -1, inputText)
end)

RegisterServerEvent("syncad12")
AddEventHandler('syncad12', function(inputText)
TriggerClientEvent('displayad12', -1, inputText)
end)

RegisterServerEvent("syncad13")
AddEventHandler('syncad13', function(inputText)
TriggerClientEvent('displayad13', -1, inputText)
end)

RegisterServerEvent("syncad14")
AddEventHandler('syncad14', function(inputText)
TriggerClientEvent('displayad14', -1, inputText)
end)

RegisterServerEvent("syncad15")
AddEventHandler('syncad15', function(inputText)
TriggerClientEvent('displayad15', -1, inputText)
end)

RegisterServerEvent("syncad16")
AddEventHandler('syncad16', function(inputText)
TriggerClientEvent('displayad16', -1, inputText)
end)

RegisterServerEvent("syncad17")
AddEventHandler('syncad17', function(inputText)
TriggerClientEvent('displayad17', -1, inputText)
end)

RegisterServerEvent("syncad18")
AddEventHandler('syncad18', function(inputText)
TriggerClientEvent('displayad18', -1, inputText)
end)

RegisterServerEvent("syncad19")
AddEventHandler('syncad19', function(inputText)
TriggerClientEvent('displayad19', -1, inputText)
end)

RegisterServerEvent("syncad20")
AddEventHandler('syncad20', function(inputText)
TriggerClientEvent('displayad20', -1, inputText)
end)

RegisterServerEvent("syncad21")
AddEventHandler('syncad21', function(inputText)
TriggerClientEvent('displayad21', -1, inputText)
end)

RegisterServerEvent("syncad22")
AddEventHandler('syncad22', function(inputText)
TriggerClientEvent('displayad22', -1, inputText)
end)

RegisterServerEvent("SyncAd")
AddEventHandler('SyncAd', function(adtype, inputText)
	TriggerClientEvent('DisplayAd', -1, adtype, inputText)
end)

