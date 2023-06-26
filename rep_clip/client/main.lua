ESX          = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(500)
	end
end)

RegisterNetEvent('rep_magazin:clipcli')
AddEventHandler('rep_magazin:clipcli', function()
  ped = GetPlayerPed(-1)
  if IsPedArmed(ped, 4) then
    hash=GetSelectedPedWeapon(ped)
    if hash~=nil then
      TriggerServerEvent('rep_magazin:remove')
      AddAmmoToPed(GetPlayerPed(-1), hash,250)
      TriggerEvent("YOUR NOTIFY SYSTEM", "#cc0000", "SERVER NAME", 'Clip was used')
    else
      TriggerEvent("YOUR NOTIFY SYSTEM", "#cc0000", "SERVER NAME", 'You dont have a weapon in your hand')
    end
  else
    TriggerEvent("YOUR NOTIFY SYSTEM", "#cc0000", "SERVER NAME", 'Clip cant be used')
  end
end)