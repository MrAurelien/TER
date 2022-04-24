Keys.Register("U", "-openvehicule", "Ouvrir son véhicule", function()
	if not IsPedInAnyVehicle(PlayerPedId(), true) then 
		local dict = "anim@mp_player_intmenu@key_fob@"
		RequestAnimDict(dict)
		while not HasAnimDictLoaded(dict) do
			Wait(0)
		end	
		vehicleKeys = CreateObject(GetHashKey("prop_cuff_keys_01"), 0, 0, 0, true, true, true) -- creates object
		AttachEntityToEntity(vehicleKeys, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.11, 0.03, -0.03, 90.0, 0.0, 0.0, true, true, false, true, 1, true) -- object is attached to right hand
		TaskPlayAnim(PlayerPedId(), dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
		StopAnimTask = true
		OpenCloseVehicle()
		Wait(1000)
		DeleteEntity(vehicleKeys)
	end
end)
