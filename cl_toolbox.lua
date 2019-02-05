

_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("SCRP", "Welcome!", 1320)
_menuPool:Add(mainMenu)
function Settings()
	_menuPool:ControlDisablingEnabled(false)
	_menuPool:MouseControlsEnabled(false)
	_menuPool:SetBannerRectangle(NativeUI.CreateRectangle(1320, 0, 100, 50, 255, 63, 63, 255))
end
Settings()

pedsList = {
	'mp_m_freemode_01',
}

menuunlocked = false

RegisterNetEvent("unlockmenu")
AddEventHandler("unlockmenu", function()
	if menuunlocked == true then	
		menuunlocked = false
		ShowNotification('Police Menu ~r~locked~w~!')
	elseif menuunlocked == false then
		menuunlocked = true
		ShowNotification('Police Menu ~g~unlocked~w~!')
		
	end
end)

function AddMenuPolice()
    PoliceMenu = _menuPool:AddSubMenu(mainMenu, "Police Menu", "",true)
	mainMenu.OnMenuChanged = function(menu, newmenu, forward)
        if newmenu == PoliceMenu then
			if not CheckPedRestriction(GetLocalPed(), pedsList) and menuunlocked == false then
				ShowNotification("~r~Do you look like a cop?\nI don't think so!")
				PoliceMenu:GoBack()
			end
        end
    end
	
	PoliceSpikesMenu = _menuPool:AddSubMenu(PoliceMenu, "Spikes", "",true)
	PolicePropsMenu = _menuPool:AddSubMenu(PoliceMenu, "Objects", "",true)
	PoliceActionsMenu = _menuPool:AddSubMenu(PoliceMenu, "Actions", "",true)
	PoliceEmotesMenu = _menuPool:AddSubMenu(PoliceMenu, "Emotes", "",true)
	PoliceGunMenu = _menuPool:AddSubMenu(PoliceMenu, "Loadouts", "",true)
    PoliceVehiclesMenu = _menuPool:AddSubMenu(PoliceMenu, "Marked Vehicles", "",true)
    PoliceUCVehiclesMenu = _menuPool:AddSubMenu(PoliceMenu, "Unmarked Vehicles", "",true)
    PoliceUMVehiclesMenu = _menuPool:AddSubMenu(PoliceMenu, "Undercover Vehicles", "",true)
	local Back = UIMenuItem.New('<<< Back', '')
    PoliceMenu:AddItem(Back)
	PoliceMenu.OnItemSelect = function(Sender, Item, Index)
        if Item == Back then
            PoliceMenu:GoBack()
		end
	end
	
	--Undercover vehicles
	local unmarked1 = UIMenuItem.New('Ford Explorer', '')
    PoliceUMVehiclesMenu:AddItem(unmarked1)
    local unmarked3 = UIMenuItem.New('Toyota Corolla', '')
    PoliceUMVehiclesMenu:AddItem(unmarked3)
	local unmarked4 = UIMenuItem.New('Ford Mustang', '')
    PoliceUMVehiclesMenu:AddItem(unmarked4)
	local unmarked5 = UIMenuItem.New('Ford F250', '')
    PoliceUMVehiclesMenu:AddItem(unmarked5)
	local unmarked6 = UIMenuItem.New('Ford Crown Vic', '')
    PoliceUMVehiclesMenu:AddItem(unmarked6)
	local unmarked8 = UIMenuItem.New('Chevy Tahoe', '')
    PoliceUMVehiclesMenu:AddItem(unmarked8)
	local unmarked9 = UIMenuItem.New('Dodge Charger', '')
    PoliceUMVehiclesMenu:AddItem(unmarked9)
	local Back = UIMenuItem.New('<<< Back', '')
    PoliceUMVehiclesMenu:AddItem(Back)
	
	--Undercover select
	PoliceUMVehiclesMenu.OnItemSelect = function(Sender, Item, Index)
		if Item == unmarked1 then
			SpawnVehicle('unmarked1')
        elseif Item == unmarked3 then
            SpawnVehicle('unmarked3')
		elseif Item == unmarked4 then
            SpawnVehicle('unmarked4')
		elseif Item == unmarked5 then
            SpawnVehicle('unmarked5')
        elseif Item == unmarked6 then
            SpawnVehicle('unmarked6')
        elseif Item == unmarked8 then
            SpawnVehicle('unmarked8')
        elseif Item == unmarked9 then
            SpawnVehicle('unmarked9')
		elseif Item == Back then
			PoliceUMVehiclesMenu:GoBack()
		 end
    end
	
	--Marked vehicles
	local police3 = UIMenuItem.New('2009 Dodge Charger', '')
    PoliceVehiclesMenu:AddItem(police3)
	local sheriff2 = UIMenuItem.New('Ford Explorer', '')
    PoliceVehiclesMenu:AddItem(sheriff2)
    local police2 = UIMenuItem.New('2016 Dodge Charger', '')
	PoliceVehiclesMenu:AddItem(police2)
	local unmarked7 = UIMenuItem.New('Ford Taurus', '')
	PoliceVehiclesMenu:AddItem(unmarked7)
	local tah = UIMenuItem.New('Chevy Tahoe', '')
	PoliceVehiclesMenu:AddItem(tah)
	local silverado = UIMenuItem.New('Chevy Silverado', '')
	PoliceVehiclesMenu:AddItem(silverado)
	local Back = UIMenuItem.New('<<< Back', '')
    PoliceVehiclesMenu:AddItem(Back)
	
	-- Marked select
	PoliceVehiclesMenu.OnItemSelect = function(Sender, Item, Index)
		if Item == police3 then
			SpawnVehicle('police3')
		elseif Item == sheriff2 then
			SpawnVehicle('sheriff2')
		elseif Item == unmarked7 then
			SpawnVehicle('unmarked7')
		elseif Item == police2 then
			SpawnVehicle('police2')
		elseif Item == tah then
			SpawnVehicle('tah')
		elseif Item == silverado then
			SpawnVehicle('silverado')
		elseif Item == Back then
            PoliceVehiclesMenu:GoBack()
        end
    end

	--Unmarked vehicles
	local fbi = UIMenuItem.New('Dodge Charger', '')
    PoliceUCVehiclesMenu:AddItem(fbi)
	local exp = UIMenuItem.New('Ford Explorer', '')
    PoliceUCVehiclesMenu:AddItem(exp)
	local Back = UIMenuItem.New('<<< Back', '')
    PoliceUCVehiclesMenu:AddItem(Back)
	
	-- Unmarked select
	PoliceUCVehiclesMenu.OnItemSelect = function(Sender, Item, Index)
		if Item == fbi then
			SpawnVehicle('fbi')
		elseif Item == exp then
			SpawnVehicle('exp')
		elseif Item == Back then
            PoliceUCVehiclesMenu:GoBack()
        end
    end
	
	--Spikes
	local SpawnSpike = UIMenuItem.New('Deploy Spike Stripes', '')
    PoliceSpikesMenu:AddItem(SpawnSpike)
	local RemoveSpike = UIMenuItem.New('Remove Spike Strips', '')
    PoliceSpikesMenu:AddItem(RemoveSpike)
	local Back = UIMenuItem.New('<<< Back', '')
    PoliceSpikesMenu:AddItem(Back)
	
	-- Spikes select
	PoliceSpikesMenu.OnItemSelect = function(Sender, Item, Index)
        if Item == SpawnSpike then
			SetSpikesOnGround()
        elseif Item == RemoveSpike then
			DeleteOBJ('P_ld_stinger_s')
		elseif Item == Back then
            PoliceSpikesMenu:GoBack()
        end
    end
	
	-- Props:
    local PB = UIMenuItem.New('Police Barrier', '')
    PolicePropsMenu:AddItem(PB)
    local WB = UIMenuItem.New('Red Barrier', '')
    PolicePropsMenu:AddItem(WB)
    local WBA = UIMenuItem.New('Red Barrier (Arrow)', '')
    PolicePropsMenu:AddItem(WBA)
	local RC = UIMenuItem.New('Traffic Cone', '')
    PolicePropsMenu:AddItem(RC)
	local CS = UIMenuItem.New('Coroner Stretcher', '')
    PolicePropsMenu:AddItem(CS)
	local CD = UIMenuItem.New('Channelizer Drum', '')
    PolicePropsMenu:AddItem(CD)
    local RO = UIMenuItem.New('Remove close Objects', '')
    PolicePropsMenu:AddItem(RO)
	local Back = UIMenuItem.New('<<< Back', '')
    PolicePropsMenu:AddItem(Back)
	
	-- Props select
	PolicePropsMenu.OnItemSelect = function(Sender, Item, Index)
        if Item == WB then
			SpawnObject('prop_mp_barrier_02b')
        elseif Item == PB then
            SpawnObject('prop_barrier_work05')
        elseif Item == WBA then
            SpawnObject('prop_mp_arrow_barrier_01')
        elseif Item == CD then
            SpawnObject('prop_barrier_wat_03a')
        elseif Item == RC then
            SpawnObject('prop_roadcone01a')
        elseif Item == CS then
            SpawnObject('prop_ld_binbag_01')
        elseif Item == RO then
            DeleteOBJ('prop_mp_barrier_02b')
            DeleteOBJ('prop_barrier_work05')
            DeleteOBJ('prop_mp_arrow_barrier_01')
            DeleteOBJ('prop_barrier_wat_03a')
            DeleteOBJ('prop_roadcone01a')
            DeleteOBJ('prop_ld_binbag_01')
		elseif Item == Back then
            PolicePropsMenu:GoBack()
        end
    end
	
	-- Actions:
	local cuff = UIMenuItem.New('Cuff', '')
    PoliceActionsMenu:AddItem(cuff)
    local uncuff = UIMenuItem.New('Uncuff', '')
    PoliceActionsMenu:AddItem(uncuff)
    local grab = UIMenuItem.New('Grab', '')
    PoliceActionsMenu:AddItem(grab)
	local chrouch = UIMenuItem.New('Crouch', '')
    PoliceActionsMenu:AddItem(chrouch)
	local Back = UIMenuItem.New('<<< Back', '')
    PoliceActionsMenu:AddItem(Back)
	
	-- Actions select
	PoliceActionsMenu.OnItemSelect = function(Sender, Item, Index)
        if Item == cuff then
			TriggerEvent('cuff')
        elseif Item == uncuff then
            TriggerEvent('uncuff')
        elseif Item == grab then
            DragPlayer()
        elseif Item == crouch then
            crouchtoggle = true
		elseif Item == Back then
            PoliceActionsMenu:GoBack()
        end
    end
	
	-- Emotes
	local traffic = UIMenuItem.New('Traffic Control', '')
    PoliceEmotesMenu:AddItem(traffic)
    local clip = UIMenuItem.New('Clipboard', '')
    PoliceEmotesMenu:AddItem(clip)
	local note = UIMenuItem.New('Notepad', '')
    PoliceEmotesMenu:AddItem(note)
	local stance = UIMenuItem.New('Idle/Stance', '')
    PoliceEmotesMenu:AddItem(stance)
	local holster = UIMenuItem.New('Hand on holster', '')
    PoliceEmotesMenu:AddItem(holster)
	local radio = UIMenuItem.New('Hand on Radio', '')
    PoliceEmotesMenu:AddItem(radio)
	local radiogun = UIMenuItem.New('Hand on radio and point gun', '')
    PoliceEmotesMenu:AddItem(radiogun)
	local cancel = UIMenuItem.New('Cancel Emote', '')
    PoliceEmotesMenu:AddItem(cancel)
	local Back = UIMenuItem.New('<<< Back', '')
    PoliceEmotesMenu:AddItem(Back)
	
	-- Emotes select
	PoliceEmotesMenu.OnItemSelect = function(Sender, Item, Index)
        if Item == traffic then
			TriggerEvent('Traffic')
        elseif Item == clip then
            TriggerEvent('Notes')
		elseif Item == note then
            TriggerEvent('Citation')
		elseif Item == stance then
            TriggerEvent('Stance')
        elseif Item == holster then
            TriggerEvent('Holster')
        elseif Item == radio then
            TriggerEvent('Radio')
        elseif Item == radiogun then
            TriggerEvent('RadioGunPoint')
		elseif Item == cancel then
            TriggerEvent('cancelEmote')
		elseif Item == Back then
            PoliceEmotesMenu:GoBack()
        end
    end
	
	-- Gun Menu
	local remall = UIMenuItem.New('Clear Wepons', '')
    PoliceGunMenu:AddItem(remall)
    local sasp = UIMenuItem.New('LSSD Loadout', '')
    PoliceGunMenu:AddItem(sasp)
    local swat = UIMenuItem.New('SWAT Loadout', '')
    PoliceGunMenu:AddItem(swat)
	local Back = UIMenuItem.New('<<< Back', '')
    PoliceGunMenu:AddItem(Back)
	
	local myPed = PlayerPedId()
	local localPed = PlayerId()
	
	-- Gun select
	carbine = false
	PoliceGunMenu.OnItemSelect = function(Sender, Item, Index)
        if Item == remall then
			RemoveAllPedWeapons(GetPlayerPed(-1), true)
        elseif Item == sasp then
            giveWeapon("weapon_combatpistol")
              weaponComponent("weapon_combatpistol", "COMPONENET_COMBATPISTOL_CLIP_02")
              weaponComponent("weapon_combatpistol", "COMPONENT_AT_PI_FLSH")
            giveWeapon("weapon_tazer")
            giveWeapon("weapon_carbinerifle")
              weaponComponent("weapon_carbinerifle", "COMPONENT_AT_AR_FLSH")
              weaponComponent("weapon_carbinerifle", "COMPONENT_AT_AR_AFGRIP")
              weaponComponent("weapon_carbinerifle", "COMPONENT_AT_SCOPE_MEDIUM")
              weaponComponent("weapon_carbinerifle", "COMPONENT_CARBINERIFLE_CLIP_03")
            giveWeapon("weapon_pumpshotgun")
              weaponComponent("weapon_pumpshotgun", "COMPONENT_AT_AR_FLSH")
            giveWeapon("weapon_stungun")
            giveWeapon("weapon_nightstick")
            giveWeapon("weapon_flashlight")
		elseif Item == swat then
           giveWeapon("weapon_combatpistol")
              weaponComponent("weapon_combatpistol", "COMPONENET_COMBATPISTOL_CLIP_02")
              weaponComponent("weapon_combatpistol", "COMPONENT_AT_PI_FLSH")
           giveWeapon("weapon_specialcarbine")
              weaponComponent("weapon_specialcarbine", "COMPONENT_SPECIALCARBINE_CLIP_03")
              weaponComponent("weapon_specialcarbine", "COMPONENT_AT_AR_FLSH")
              weaponComponent("weapon_specialcarbine", "COMPONENT_AT_AR_AFGRIP")
              weaponComponent("weapon_specialcarbine", "COMPONENT_AT_SCOPE_MEDIUM")
           giveWeapon("weapon_assaultshotgun")
              weaponComponent("weapon_assaultshotgun", "COMPONENT_ASSAULTSHOTGUN_CLIP_02")
              weaponComponent("weapon_assaultshotgun", "COMPONENT_AT_AR_FLSH")
              weaponComponent("weapon_assaultshotgun", "COMPONENT_AT_AR_AFGRIP")
           giveWeapon("weapon_flare")
           giveWeapon("weapon_pumpshotgun")
              weaponComponent("weapon_pumpshotgun", "COMPONENT_AT_AR_FLSH")
           giveWeapon("weapon_flashlight")
		elseif Item == Back then
            PoliceGunMenu:GoBack()
        end
    end
	
	Settings()
end

function AddMenuCiv()
	CivMenu = _menuPool:AddSubMenu(mainMenu, "Civillian Menu", "",true)
	--Sub menus
	CivActionsMenu = _menuPool:AddSubMenu(CivMenu, "Actions", "",true)
	CivEmotesMenu = _menuPool:AddSubMenu(CivMenu, "Emotes", "",true)
	local showID = UIMenuItem.New('Show ID', '')
    CivMenu:AddItem(showID)
    CivAdvertsMenu = _menuPool:AddSubMenu(CivMenu, "Adverts", "",true)
	local Back = UIMenuItem.New('<<< Back', '')
    CivMenu:AddItem(Back)
	CivMenu.OnItemSelect = function(Sender, Item, Index)
        if Item == Back then
            CivMenu:GoBack()
		end
		if Item == showID then
			idShow()
		end
	end
	
	-- Civ Actions
	local DropWeapon = UIMenuItem.New('Drop Weapon', '')
    CivActionsMenu:AddItem(DropWeapon)
	local toggcrouch = UIMenuItem.New('Toggle Crouch', '')
    CivActionsMenu:AddItem(toggcrouch)
	local handsUp = UIMenuItem.New('Put hands up', '')
    CivActionsMenu:AddItem(handsUp)
	local handsUpk = UIMenuItem.New('Kneel down', '')
    CivActionsMenu:AddItem(handsUpk)
	
	CivActionsMenu.OnItemSelect = function(Sender, Item, Index)
        if Item == DropWeapon then
			dropweap()
        elseif Item == toggcrouch then
			crouchtoggle = true
		elseif Item == handsUp then
            TriggerEvent('Handsup')
		elseif Item == handsUpk then
            TriggerEvent('KneelHU')
		elseif Item == Back then
            CivActionsMenu:GoBack()
        end
    end
	
	-- Civ Emotes
	local smoke = UIMenuItem.New('Smoke', '')
    CivEmotesMenu:AddItem(smoke)
	local Party = UIMenuItem.New('Party', '')
    CivEmotesMenu:AddItem(Party)
	local Pushups = UIMenuItem.New('Pushups', '')
    CivEmotesMenu:AddItem(Pushups)
	local Situps = UIMenuItem.New('Situps', '')
		CivEmotesMenu:AddItem(Situps)
	local Weld = UIMenuItem.New('Weld', '')
    CivEmotesMenu:AddItem(Weld)
	local Phone = UIMenuItem.New('Phone', '')
    CivEmotesMenu:AddItem(Phone)
	local Injured = UIMenuItem.New('Injured', '')
    CivEmotesMenu:AddItem(Injured)
	local Weed = UIMenuItem.New('Weed', '')
    CivEmotesMenu:AddItem(Weed)
	local Coffee = UIMenuItem.New('Coffee', '')
    CivEmotesMenu:AddItem(Coffee)
	local Photo = UIMenuItem.New('Photo', '')
    CivEmotesMenu:AddItem(Photo)
	local Binoculars = UIMenuItem.New('Binoculars', '')
    CivEmotesMenu:AddItem(Binoculars)
	local Drink = UIMenuItem.New('Drink', '')
    CivEmotesMenu:AddItem(Drink)
	local Film = UIMenuItem.New('Film', '')
    CivEmotesMenu:AddItem(Film)
	local Weights = UIMenuItem.New('Weights', '')
    CivEmotesMenu:AddItem(Weights)
	local Flex = UIMenuItem.New('Flex', '')
    CivEmotesMenu:AddItem(Flex)
	local cancel = UIMenuItem.New('Cancel Emote', '')
    CivEmotesMenu:AddItem(cancel)
	local Back = UIMenuItem.New('<<< Back', '')
    CivEmotesMenu:AddItem(Back)
	
	-- Emotes select
	CivEmotesMenu.OnItemSelect = function(Sender, Item, Index)
        if Item == smoke then
			TriggerEvent('Smoke')
        elseif Item == Party then
            TriggerEvent('Party')
		elseif Item == Pushups then
            TriggerEvent('Pushups')
		elseif Item == Situps then
            TriggerEvent('Situps')
		elseif Item == Weld then
            TriggerEvent('Weld')
		elseif Item == Phone then
            TriggerEvent('Phone')
        elseif Item == Injured then
            TriggerEvent('Injured')
        elseif Item == Weed then
            TriggerEvent('Weed')
        elseif Item == Coffee then
            TriggerEvent('Coffee')
        elseif Item == Photo then
            TriggerEvent('Photo')
        elseif Item == Binoculars then
            TriggerEvent('Binoculars')
        elseif Item == Drink then
            TriggerEvent('Drink')
        elseif Item == Film then
            TriggerEvent('Film')
        elseif Item == Weights then
            TriggerEvent('Weights')
        elseif Item == Flex then
            TriggerEvent('Flex')
		elseif Item == cancel then
            TriggerEvent('cancelEmote')
		elseif Item == Back then
            CivEmotesMenu:GoBack()
        end
    end
	
	-- Civ Adverts
	local shop = UIMenuItem.New('24/7', '')
    CivAdvertsMenu:AddItem(shop)
	local Ammunation = UIMenuItem.New('Ammunation', '')
    CivAdvertsMenu:AddItem(Ammunation)
	local News = UIMenuItem.New('Weazel News', '')
    CivAdvertsMenu:AddItem(News)
	local Unicorn = UIMenuItem.New('Vanilla Unicorn', '')
    CivAdvertsMenu:AddItem(Unicorn)
	local taxi = UIMenuItem.New('DownTown Cab CO.', '')
    CivAdvertsMenu:AddItem(taxi)
	local traffic = UIMenuItem.New('LS Traffic', '')
    CivAdvertsMenu:AddItem(traffic)
	local customs = UIMenuItem.New('LS Customs', '')
    CivAdvertsMenu:AddItem(customs)
	local ace = UIMenuItem.New('Ace Liquor', '')
    CivAdvertsMenu:AddItem(ace)
	local ligas = UIMenuItem.New('Limited Gasoline', '')
    CivAdvertsMenu:AddItem(ligas)
	local postal = UIMenuItem.New('Go Postal', '')
    CivAdvertsMenu:AddItem(postal)
	local auto = UIMenuItem.New('Facebook', '')
    CivAdvertsMenu:AddItem(auto)
	local vango = UIMenuItem.New("Vangelico's", '')
    CivAdvertsMenu:AddItem(vango)
	local bell = UIMenuItem.New('Cluckin Bell', '')
    CivAdvertsMenu:AddItem(bell)
	local Bugstars = UIMenuItem.New('Bugstars', '')
    CivAdvertsMenu:AddItem(Bugstars)
	local bank = UIMenuItem.New('Fleeca Bank', '')
    CivAdvertsMenu:AddItem(bank)
	local uber = UIMenuItem.New('Uber', '')
    CivAdvertsMenu:AddItem(uber)
	local mors = UIMenuItem.New('Mors Mutual Insurance', '')
    CivAdvertsMenu:AddItem(mors)
	local PostOp = UIMenuItem.New('PostOp', '')
    CivAdvertsMenu:AddItem(PostOp)
	local exotic = UIMenuItem.New('Auto Exotic', '')
    CivAdvertsMenu:AddItem(exotic)
	local lsWP = UIMenuItem.New('LS Water & Power', '')
    CivAdvertsMenu:AddItem(lsWP)
	local dyn = UIMenuItem.New('Dynasty 8', '')
    CivAdvertsMenu:AddItem(dyn)
	local Back = UIMenuItem.New('<<< Back', '')
    CivAdvertsMenu:AddItem(Back)
	
	-- Adverts select
	CivAdvertsMenu.OnItemSelect = function(Sender, Item, Index)
        if Item == shop then
			CivAdvertsMenu:Visible(false)
			TriggerEvent('ad1')
        elseif Item == Ammunation then
			CivAdvertsMenu:Visible(false)
            TriggerEvent('ad2')
		elseif Item == News then
			CivAdvertsMenu:Visible(false)
            TriggerEvent('ad3')
		elseif Item == Unicorn then
			CivAdvertsMenu:Visible(false)
            TriggerEvent('ad4')
		elseif Item == taxi then
			CivAdvertsMenu:Visible(false)
            TriggerEvent('ad5')
		elseif Item == traffic then
			CivAdvertsMenu:Visible(false)
            TriggerEvent('ad6')
        elseif Item == customs then
			CivAdvertsMenu:Visible(false)
            TriggerEvent('ad7')
        elseif Item == ace then
			CivAdvertsMenu:Visible(false)
            TriggerEvent('ad8')
        elseif Item == ligas then
			CivAdvertsMenu:Visible(false)
            TriggerEvent('ad9')
        elseif Item == postal then
			CivAdvertsMenu:Visible(false)
            TriggerEvent('ad10')
        elseif Item == auto then
			CivAdvertsMenu:Visible(false)
            TriggerEvent('ad11')
        elseif Item == vango then
			CivAdvertsMenu:Visible(false)
            TriggerEvent('ad12')
        elseif Item == bell then
			CivAdvertsMenu:Visible(false)
            TriggerEvent('ad13')
        elseif Item == Bugstars then
			CivAdvertsMenu:Visible(false)
            TriggerEvent('ad14')
        elseif Item == bank then
			CivAdvertsMenu:Visible(false)
            TriggerEvent('ad15')
        elseif Item == uber then
			CivAdvertsMenu:Visible(false)
            TriggerEvent('ad22')
		elseif Item == mors then
			CivAdvertsMenu:Visible(false)
            TriggerEvent('ad17')
        elseif Item == PostOp then
			CivAdvertsMenu:Visible(false)
            TriggerEvent('ad18')
        elseif Item == exotic then
			CivAdvertsMenu:Visible(false)
            TriggerEvent('ad19')
        elseif Item == lsWP then
			CivAdvertsMenu:Visible(false)
            TriggerEvent('ad20')
        elseif Item == dyn then
			CivAdvertsMenu:Visible(false)
            TriggerEvent('ad21')
		elseif Item == Back then
            CivAdvertsMenu:GoBack()
        end
    end
	
	Settings()
end

AddMenuPolice(mainMenu)
AddMenuCiv()
_menuPool:RefreshIndex()

Citizen.CreateThread(function()
	handup = false
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
		if IsControlJustPressed(1, 244) and _menuPool:IsAnyMenuOpen() then
			_menuPool:CloseAllMenus()
		elseif IsControlJustPressed(1, 244) then
            mainMenu:Visible(not mainMenu:Visible())
        end
	end
end)

function idShow()
	local TextEntry = 'First and Lastname:'
	local MaxStringLenght	= 30
	CivMenu:Visible(false)
	
	AddTextEntry('FMMC_KEY_TIP1', TextEntry) --Sets the Text above the typing field in the black square
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght) --Actually calls the Keyboard Input
	blockinput = true --Blocks new input while typing if **blockinput** is used

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do --While typing is not aborted and not finished, this loop waits
		Citizen.Wait(0)
	end
		
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult() --Gets the result of the typing
		Citizen.Wait(500) --Little Time Delay, so the Keyboard won't open again if you press enter to finish the typing
		blockinput = false --This unblocks new Input when typing is done
		CivMenu:Visible(true)
		TriggerServerEvent('notify', GetPlayerServerId(PlayerId()), result)
	else
		Citizen.Wait(500)
		blockinput = false 
	end
end

-- Civ Emotes Start  --

RegisterNetEvent('Smoke')
AddEventHandler('Smoke', function()

local emotePlaying = IsPedActiveInScenario(GetPlayerPed(-1))
local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SMOKING", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )
--]]
RegisterNetEvent('Party')
AddEventHandler('Party', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_PARTYING", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Drink')
AddEventHandler('Drink', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_DRINKING", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Pushups')
AddEventHandler('Pushups', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_PUSH_UPS", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Phone')
AddEventHandler('Phone', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_STAND_MOBILE", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Injured')
AddEventHandler('Injured', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SUNBATHE_BACK", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Weed')
AddEventHandler('Weed', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SMOKING_POT", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Coffee')
AddEventHandler('Coffee', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_AA_COFFEE", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Photo')
AddEventHandler('Photo', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_PAPARAZZI", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Binoculars')
AddEventHandler('Binoculars', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_BINOCULARS", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Situps')
AddEventHandler('Situps', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SIT_UPS", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Film')
AddEventHandler('Film', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_MOBILE_FILM_SHOCKING", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Weights')
AddEventHandler('Weights', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Flex')
AddEventHandler('Flex', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_MUSCLE_FLEX", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Weld')
AddEventHandler('Weld', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_WELDING", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

-- Civ Emotes End --

-- ADVERTISMENTS
RegisterNetEvent("ad1")
AddEventHandler("ad1",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
			if input == true then
				HideHudAndRadarThisFrame()
				if UpdateOnscreenKeyboard() == 3 then
					input = false
				elseif UpdateOnscreenKeyboard() == 1 then
					local inputText = GetOnscreenKeyboardResult()
					if string.len(inputText) > 0 then
						TriggerServerEvent('syncad1', inputText)
						input = false
						local url = 'http://bcsdrp.net/images/fivem/247.png'
						local name = '24/7'
						TriggerServerEvent('DiscordBot:ToDiscord', 'chat', 'Advert Log', '*'..name.. ' Advert by:* '.. GetPlayerName(PlayerId()) .. ' [ID: ' .. GetPlayerServerId(PlayerId()) ..']**\n' .. inputText .. '**', url, true)

					else
						DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
				end
			elseif UpdateOnscreenKeyboard() == 2 then
				input = false
				end
			end
			 Citizen.Wait(0)
		end


end)
end)

RegisterNetEvent('displayad1')
AddEventHandler('displayad1',function(inputText)
SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "247", true, 1, "~y~24/7 Store~s~", "Phone Notification");
DrawNotification(false, true);

end)

--
RegisterNetEvent("ad2")
AddEventHandler("ad2",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad2', inputText)
		input = false
		local url = 'http://bcsdrp.net/images/fivem/Ammunation.png'
		local name = 'Ammunation'
		TriggerServerEvent('DiscordBot:ToDiscord', 'chat', 'Advert Log', '*'..name.. ' Advert by:* '.. GetPlayerName(PlayerId()) .. ' [ID: ' .. GetPlayerServerId(PlayerId()) ..']**\n' .. inputText .. '**', url, true)

		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad2')
AddEventHandler('displayad2',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_AMMUNATION", "CHAR_AMMUNATION", true, 1, "~y~Ammunation~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad3")
AddEventHandler("ad3",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad3', inputText)
		input = false
		local url = 'http://bcsdrp.net/images/fivem/News.png'
		local name = 'Weazel News'
		TriggerServerEvent('DiscordBot:ToDiscord', 'chat', 'Advert Log', '*'..name.. ' Advert by:* '.. GetPlayerName(PlayerId()) .. ' [ID: ' .. GetPlayerServerId(PlayerId()) ..']**\n' .. inputText .. '**', url, true)

		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad3')
AddEventHandler('displayad3',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "NEWS", true, 1, "~y~Weazel News~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad4")
AddEventHandler("ad4",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad4', inputText)
		input = false
		local url = 'http://bcsdrp.net/images/fivem/Vanilla.png'
		local name = 'Vanilla Unicorn'
		TriggerServerEvent('DiscordBot:ToDiscord', 'chat', 'Advert Log', '*'..name.. ' Advert by:* '.. GetPlayerName(PlayerId()) .. ' [ID: ' .. GetPlayerServerId(PlayerId()) ..']**\n' .. inputText .. '**', url, true)

		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad4')
AddEventHandler('displayad4',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_MP_STRIPCLUB_PR", "CHAR_MP_STRIPCLUB_PR", true, 1, "~y~Vanilla Unicorn~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad5")
AddEventHandler("ad5",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad5', inputText)
		input = false
		local url = 'http://bcsdrp.net/images/fivem/taxi.png'
		local name = 'Downtown Cab Co.'
		TriggerServerEvent('DiscordBot:ToDiscord', 'chat', 'Advert Log', '*'..name.. ' Advert by:* '.. GetPlayerName(PlayerId()) .. ' [ID: ' .. GetPlayerServerId(PlayerId()) ..']**\n' .. inputText .. '**', url, true)

		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad5')
AddEventHandler('displayad5',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_TAXI", "CHAR_TAXI", true, 1, "~y~Downtown Cab Co.~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad6")
AddEventHandler("ad6",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad6', inputText)
		input = false
		local url = 'http://bcsdrp.net/images/fivem/traffic.png'
		local name = 'Los Santos Traffic Information'
		TriggerServerEvent('DiscordBot:ToDiscord', 'chat', 'Advert Log', '*'..name.. ' Advert by:* '.. GetPlayerName(PlayerId()) .. ' [ID: ' .. GetPlayerServerId(PlayerId()) ..']**\n' .. inputText .. '**', url, true)

		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad6')
AddEventHandler('displayad6',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_LS_TOURIST_BOARD", "CHAR_LS_TOURIST_BOARD", true, 1, "~y~Los Santos Traffic Info~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad7")
AddEventHandler("ad7",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad7', inputText)
		input = false
		local url = 'http://bcsdrp.net/images/fivem/customs.png'
		local name = 'Los Santos Customs'
		TriggerServerEvent('DiscordBot:ToDiscord', 'chat', 'Advert Log', '*'..name.. ' Advert by:* '.. GetPlayerName(PlayerId()) .. ' [ID: ' .. GetPlayerServerId(PlayerId()) ..']**\n' .. inputText .. '**', url, true)

		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad7')
AddEventHandler('displayad7',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_LS_CUSTOMS", "CHAR_LS_CUSTOMS", true, 1, "~y~Los Santos Customs~s~", "Phone Notification");
DrawNotification(false, true);

end)

--
RegisterNetEvent("ad8")
AddEventHandler("ad8",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad8', inputText)
		input = false
		local url = 'http://bcsdrp.net/images/fivem/ACE.png'
		local name = 'Ace Liquor'
		TriggerServerEvent('DiscordBot:ToDiscord', 'chat', 'Advert Log', '*'..name.. ' Advert by:* '.. GetPlayerName(PlayerId()) .. ' [ID: ' .. GetPlayerServerId(PlayerId()) ..']**\n' .. inputText .. '**', url, true)

		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad8')
AddEventHandler('displayad8',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "ACE", true, 1, "~y~Ace Liquor~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad9")
AddEventHandler("ad9",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad9', inputText)
		input = false
		local url = 'http://bcsdrp.net/images/fivem/LTD.png'
		local name = 'Limited Gasoline'
		TriggerServerEvent('DiscordBot:ToDiscord', 'chat', 'Advert Log', '*'..name.. ' Advert by:* '.. GetPlayerName(PlayerId()) .. ' [ID: ' .. GetPlayerServerId(PlayerId()) ..']**\n' .. inputText .. '**', url, true)

		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad9')
AddEventHandler('displayad9',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "LTD", true, 1, "~y~Limited Gasoline~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad10")
AddEventHandler("ad10",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad10', inputText)
		input = false
		local url = 'http://bcsdrp.net/images/fivem/POSTAL.png'
		local name = 'GoPostal'
		TriggerServerEvent('DiscordBot:ToDiscord', 'chat', 'Advert Log', '*'..name.. ' Advert by:* '.. GetPlayerName(PlayerId()) .. ' [ID: ' .. GetPlayerServerId(PlayerId()) ..']**\n' .. inputText .. '**', url, true)

		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad10')
AddEventHandler('displayad10',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "POSTAL", true, 1, "~y~GoPostal~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad11")
AddEventHandler("ad11",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad11', inputText)
		input = false
		local url = 'http://bcsdrp.net/images/fivem/facebook.png'
		local name = 'Facebook'
		TriggerServerEvent('DiscordBot:ToDiscord', 'chat', 'Advert Log', '*'..name.. ' Advert by:* '.. GetPlayerName(PlayerId()) .. ' [ID: ' .. GetPlayerServerId(PlayerId()) ..']**\n' .. inputText .. '**', url, true)

		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad11')
AddEventHandler('displayad11',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FACEBOOK", "CHAR_FACEBOOK", true, 1, "~y~Facebook~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad12")
AddEventHandler("ad12",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad12', inputText)
		input = false
		local url = 'http://bcsdrp.net/images/fivem/VAN.png'
		local name = 'Vangelico'
		TriggerServerEvent('DiscordBot:ToDiscord', 'chat', 'Advert Log', '*'..name.. ' Advert by:* '.. GetPlayerName(PlayerId()) .. ' [ID: ' .. GetPlayerServerId(PlayerId()) ..']**\n' .. inputText .. '**', url, true)

		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad12')
AddEventHandler('displayad12',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "VAN", true, 1, "~y~Vangelico~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad13")
AddEventHandler("ad13",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad13', inputText)
		input = false
		local url = 'http://bcsdrp.net/images/fivem/BELL.png'
		local name = "Cluckin' Bell"
		TriggerServerEvent('DiscordBot:ToDiscord', 'chat', 'Advert Log', '*'..name.. ' Advert by:* '.. GetPlayerName(PlayerId()) .. ' [ID: ' .. GetPlayerServerId(PlayerId()) ..']**\n' .. inputText .. '**', url, true)

		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad13')
AddEventHandler('displayad13',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "BELL", true, 1, "~y~Cluckin' Bell~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad14")
AddEventHandler("ad14",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad14', inputText)
		input = false
		local url = 'http://bcsdrp.net/images/fivem/BUG.png'
		local name = "Bugstars"
		TriggerServerEvent('DiscordBot:ToDiscord', 'chat', 'Advert Log', '*'..name.. ' Advert by:* '.. GetPlayerName(PlayerId()) .. ' [ID: ' .. GetPlayerServerId(PlayerId()) ..']**\n' .. inputText .. '**', url, true)

		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad14')
AddEventHandler('displayad14',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "BUG", true, 1, "~y~Bugstars~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad15")
AddEventHandler("ad15",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad15', inputText)
		input = false
		local url = 'http://bcsdrp.net/images/fivem/fleeca.png'
		local name = "Fleeca Bank"
		TriggerServerEvent('DiscordBot:ToDiscord', 'chat', 'Advert Log', '*'..name.. ' Advert by:* '.. GetPlayerName(PlayerId()) .. ' [ID: ' .. GetPlayerServerId(PlayerId()) ..']**\n' .. inputText .. '**', url, true)

		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad15')
AddEventHandler('displayad15',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_BANK_FLEECA", "CHAR_BANK_FLEECA", true, 1, "~y~Fleeca Bank~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad16")
AddEventHandler("ad16",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad16', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad16')
AddEventHandler('displayad16',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "NA", true, 1, "~y~Echo Sechs~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad17")
AddEventHandler("ad17",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad17', inputText)
		input = false
		local url = 'http://bcsdrp.net/images/fivem/mmi.png'
		local name = "Mors Mutual Insurance"
		TriggerServerEvent('DiscordBot:ToDiscord', 'chat', 'Advert Log', '*'..name.. ' Advert by:* '.. GetPlayerName(PlayerId()) .. ' [ID: ' .. GetPlayerServerId(PlayerId()) ..']**\n' .. inputText .. '**', url, true)

		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad17')
AddEventHandler('displayad17',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_MP_MORS_MUTUAL", "CHAR_MP_MORS_MUTUAL", true, 1, "~y~Mors Mutual Insurance~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad18")
AddEventHandler("ad18",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad18', inputText)
		input = false
		local url = 'http://bcsdrp.net/images/fivem/OP.png'
		local name = "PostOP"
		TriggerServerEvent('DiscordBot:ToDiscord', 'chat', 'Advert Log', '*'..name.. ' Advert by:* '.. GetPlayerName(PlayerId()) .. ' [ID: ' .. GetPlayerServerId(PlayerId()) ..']**\n' .. inputText .. '**', url, true)

		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad18')
AddEventHandler('displayad18',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "OP", true, 1, "~y~PostOP~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad19")
AddEventHandler("ad19",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad19', inputText)
		input = false
		local url = 'http://bcsdrp.net/images/fivem/EXOTIC.png'
		local name = "Auto Exotic"
		TriggerServerEvent('DiscordBot:ToDiscord', 'chat', 'Advert Log', '*'..name.. ' Advert by:* '.. GetPlayerName(PlayerId()) .. ' [ID: ' .. GetPlayerServerId(PlayerId()) ..']**\n' .. inputText .. '**', url, true)

		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad19')
AddEventHandler('displayad19',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "EXOTIC", true, 1, "~y~Auto Exotic~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad20")
AddEventHandler("ad20",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad20', inputText)
		input = false
		local url = 'http://bcsdrp.net/images/fivem/LSWP.png'
		local name = "Los Santos Water and Power"
		TriggerServerEvent('DiscordBot:ToDiscord', 'chat', 'Advert Log', '*'..name.. ' Advert by:* '.. GetPlayerName(PlayerId()) .. ' [ID: ' .. GetPlayerServerId(PlayerId()) ..']**\n' .. inputText .. '**', url, true)

		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad20')
AddEventHandler('displayad20',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "LSWP", true, 1, "~y~Los Santos Water and Power~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
--
RegisterNetEvent("ad21")
AddEventHandler("ad21",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad21', inputText)
		input = false
		local url = 'http://bcsdrp.net/images/fivem/D8.png'
		local name = "Dynasty 8"
		TriggerServerEvent('DiscordBot:ToDiscord', 'chat', 'Advert Log', '*'..name.. ' Advert by:* '.. GetPlayerName(PlayerId()) .. ' [ID: ' .. GetPlayerServerId(PlayerId()) ..']**\n' .. inputText .. '**', url, true)

		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad21')
AddEventHandler('displayad21',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "D8", true, 1, "~y~Dynasty 8~s~", "Phone Notification");
DrawNotification(false, true);

end)

RegisterNetEvent("ad22")
AddEventHandler("ad22",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad22', inputText)
		input = false
		local url = 'http://bcsdrp.net/images/fivem/UBER.png'
		local name = "UBER"
		TriggerServerEvent('DiscordBot:ToDiscord', 'chat', 'Advert Log', '*'..name.. ' Advert by:* '.. GetPlayerName(PlayerId()) .. ' [ID: ' .. GetPlayerServerId(PlayerId()) ..']**\n' .. inputText .. '**', url, true)

		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad22')
AddEventHandler('displayad22',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "UBER", true, 1, "~y~Uber~s~", "Phone Notification");
DrawNotification(false, true);

end)

-- END OF ADVERTISMENTS

function dropweap()
    local ped = PlayerPedId()
            local wep = GetSelectedPedWeapon(ped)
            SetPedDropsWeaponsWhenDead(ped, true)
            RequestAnimDict("mp_weapon_drop")
            if DoesEntityExist(ped) and not IsEntityDead(ped) and not IsPedInAnyVehicle(ped, true) and not IsPauseMenuActive() and IsPedArmed(ped, 7) then -- INPUT_DROP_WEAPON (F7)
            TaskPlayAnim(ped, "mp_weapon_drop", "drop_bh", 8.0, 2.0, -1, 0, 2.0, 0, 0, 0 )
            SetPedDropsInventoryWeapon(ped, wep, 0, 2.0, 0, -1)
            SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
			ShowNotification("~w~You dropped your weapon.")
        end
end

RegisterNetEvent("Handsup")
AddEventHandler("Handsup", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		if not IsEntityPlayingAnim(lPed, "mp_arresting", "idle", 3) then
			RequestAnimDict("random@mugging3")
			while not HasAnimDictLoaded("random@mugging3") do
				Citizen.Wait(100)
			end
			
			if IsEntityPlayingAnim(lPed, "random@mugging3", "handsup_standing_base", 3) then
				ClearPedSecondaryTask(lPed)
				SetEnableHandcuffs(lPed, false)
				SetCurrentPedWeapon(lPed, GetHashKey("WEAPON_UNARMED"), true)
			else
				TaskPlayAnim(lPed, "random@mugging3", "handsup_standing_base", 8.0, -8, -1, 49, 0, 0, 0, 0)
				SetEnableHandcuffs(lPed, true)
				SetCurrentPedWeapon(lPed, GetHashKey("WEAPON_UNARMED"), true)
			end
		end
	end
end)

RegisterNetEvent("Handsdown")
AddEventHandler("Handsdown", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		if IsEntityPlayingAnim(lPed, "mp_arresting", "idle", 3) then
			ClearPedSecondaryTask(lPed)
			SetEnableHandcuffs(lPed, false)
			SetCurrentPedWeapon(lPed, GetHashKey("WEAPON_UNARMED"), true)
			handcuff = false
		end
	end
end)



--------------- Kneel with hands up ----------------

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 

RegisterNetEvent( 'KneelHU' )
AddEventHandler( 'KneelHU', function()
    local player = GetPlayerPed( -1 )
	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
        loadAnimDict( "random@arrests" )
		loadAnimDict( "random@arrests@busted" )
		if ( IsEntityPlayingAnim( player, "random@arrests@busted", "idle_a", 3 ) ) then 
			TaskPlayAnim( player, "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (3000)
            TaskPlayAnim( player, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
        else
            TaskPlayAnim( player, "random@arrests", "idle_2_hands_up", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (4000)
            TaskPlayAnim( player, "random@arrests", "kneeling_arrest_idle", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (500)
			TaskPlayAnim( player, "random@arrests@busted", "enter", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (1000)
			TaskPlayAnim( player, "random@arrests@busted", "idle_a", 8.0, 1.0, -1, 9, 0, 0, 0, 0 )
        end     
    end
end )

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests@busted", "idle_a", 3) then
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
			DisableControlAction(0,21,true)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if ishandcuff and not IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "mp_arresting", "idle", 3) then
			Citizen.Wait(3000)
			Citizen.Trace("BACKUP CUFFING TRIGGERED")
			TaskPlayAnim(GetPlayerPed(PlayerId()), "mp_arresting", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
		end

		if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "mp_arresting", "idle", 3) then
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
			SetPedPathCanUseLadders(GetPlayerPed(PlayerId()), false)
			if IsPedInAnyVehicle(GetPlayerPed(PlayerId()), false) then
				DisableControlAction(0, 59, true)
			end
		end

		if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@mugging3", "handsup_standing_base", 3) then
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
			if IsPedInAnyVehicle(GetPlayerPed(PlayerId()), false) then
				DisableControlAction(0, 59, true)
			end
		end
	end
end)

function giveWeapon(weaponHash)
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(weaponHash), 999, false)
    end

    -- Find at hashes https://wiki.fivem.net/wiki/Weapon_Components
    function weaponComponent(weaponHash, component)
        if HasPedGotWeapon(PlayerPedId(), GetHashKey(weaponHash), false) then
            GiveWeaponComponentToPed(PlayerPedId(), GetHashKey(weaponHash), GetHashKey(component))
         end
    end

function SpawnVehicle(veh)
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 4.0, 0.5))
    if veh == nil then veh = "adder" end
    vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 10000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
        end
        CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId()), 1, 0)
    end)
end

function SpawnObject(objectname)
    local Player = GetPlayerPed(-1)
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, 0.5))
    local heading = GetEntityHeading(Player)
   
    RequestModel(objectname)

    while not HasModelLoaded(objectname) do
	    Citizen.Wait(1)
    end

	local obj = CreateObject(GetHashKey(objectname), x, y, z, true, true, true)
	PlaceObjectOnGroundProperly(obj)
	SetEntityHeading(obj, heading+180)
	FreezeEntityPosition(obj, true)

end

function DeleteOBJ(theobject)
    local object = GetHashKey(theobject)
    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), true))
    if DoesObjectOfTypeExistAtCoords(x, y, z, 2.5, object, true) then
        local obj = GetClosestObjectOfType(x, y, z, 2.5, object, false, false, false)
        DeleteObject(obj)
    end
end

local crouched = false

Citizen.CreateThread( function()
    while true do 
        Citizen.Wait( 1 )

        local ped = GetPlayerPed( -1 )

        if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
            DisableControlAction( 0, 36, true ) -- INPUT_DUCK  

            if ( not IsPauseMenuActive() ) then 
                if ( IsDisabledControlJustPressed( 0, 36 ) or crouchtoggle == true ) then 
                    RequestAnimSet( "move_ped_crouched" )

                    while ( not HasAnimSetLoaded( "move_ped_crouched" ) ) do 
                        Citizen.Wait( 100 )
                    end 

                    if ( crouched == true ) then 
                        ResetPedMovementClipset( ped, 0 )
                        crouched = false 
                    elseif ( crouched == false ) then
                        SetPedMovementClipset( ped, "move_ped_crouched", 0.25 )
                        crouched = true 
                    end 
					crouchtoggle = false
                end
            end 
        end 
    end
end )

function CheckPedRestriction(ped, PedList)
	for i = 1, #PedList do
		if GetHashKey(PedList[i]) == GetEntityModel(ped) then
			return true
		end
	end
    return false
end

function GetLocalPed()
    return GetPlayerPed(PlayerId())
end

function GetPlayers()
    local players = {}

    for i = 0, 31 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

function GetClosestPlayer()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)

	for index,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = Vdist(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"])
			if(closestDistance == -1 or closestDistance > distance) then
				closestPlayer = value
				closestDistance = distance
			end
		end
	end

	return closestPlayer, closestDistance
end

local isHandcuffed = false

local drag = false
local playerStillDragged = false
local officerDrag = -1

RegisterNetEvent('cuff')
AddEventHandler('cuff',function()
	local t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 3) then
		TriggerServerEvent("cuffGranted", GetPlayerServerId(t))
	else
    	ShowNotification("There is no nearby player to cuff!")
	end
end)

RegisterNetEvent('uncuff')
AddEventHandler('uncuff',function()
	local t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 3) then
		TriggerServerEvent("uncuffGranted", GetPlayerServerId(t))
	else
    	ShowNotification("There is no nearby player to uncuff!")
	end
end)

RegisterNetEvent('getCuffed')
AddEventHandler('getCuffed', function()
	local ped = GetPlayerPed(-1)
	RequestAnimDict('mp_arresting')
	while not HasAnimDictLoaded('mp_arresting') do
		Citizen.Wait(100)
	end
	
	TaskPlayAnim(ped, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
	SetEnableHandcuffs(ped, true)
	SetCurrentPedWeapon(ped, GetHashKey('WEAPON_UNARMED'), true)
	DisablePlayerFiring(ped, true)
	
	isHandcuffed = true
end)

RegisterNetEvent('getUncuffed')
AddEventHandler('getUncuffed', function()
	local ped = GetPlayerPed(-1)

	ClearPedSecondaryTask(ped)
	SetEnableHandcuffs(ped, false)
	DisablePlayerFiring(ped, false)
	SetCurrentPedWeapon(ped, GetHashKey('WEAPON_UNARMED'), true)
	FreezeEntityPosition(ped, false)
	
	isHandcuffed = false
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
		
		if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "mp_arresting", "idle", 3) then
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
			if IsPedInAnyVehicle(GetPlayerPed(PlayerId()), false) then
				DisableControlAction(0, 59, true)
			end
		end

		if drag then
			local ped = GetPlayerPed(GetPlayerFromServerId(officerDrag))
			local myped = GetPlayerPed(-1)
			SetEnableHandcuffs(ped, true)
			DisablePlayerFiring(ped, true)
			SetCurrentPedWeapon(ped, GetHashKey('WEAPON_UNARMED'), true)
			AttachEntityToEntity(myped, ped, 4103, 11816, 0.48, 0.00, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
			playerStillDragged = true

			local myPed = PlayerPedId(-1)

			while(IsPedBeingStunned(myPed, 0)) do
				ClearPedTasksImmediately(myPed)
			end
		else
			if(playerStillDragged) then
				DetachEntity(GetPlayerPed(-1), true, false)
				SetEnableHandcuffs(ped, false)
				DisablePlayerFiring(ped, false)
				playerStillDragged = false
			end
		end
		
end
end)

function DragPlayer()
	local t, distance = GetClosestPlayer()
	
	if(distance ~= -1 and distance < 3) then
		TriggerServerEvent("dragRequest", GetPlayerServerId(t))
	else
    	ShowNotification("There is no nearby player to drag!")
	end
end

RegisterNetEvent('toggleDrag')
AddEventHandler('toggleDrag', function(t)

		drag = not drag
		officerDrag = t
end)

Citizen.CreateThread(function()
	while true do
		if drag then
			local ped = GetPlayerPed(GetPlayerFromServerId(playerPedDragged))
			plyPos = GetEntityCoords(ped,  true)
			SetEntityCoords(ped, plyPos.x, plyPos.y, plyPos.z)
		end
		Citizen.Wait(1000)
	end
end)

--Spikes
function SetSpikesOnGround()
	local Player = GetPlayerPed(-1)
	local heading = GetEntityHeading(Player)
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.5, 0.5))

    spike = GetHashKey("P_ld_stinger_s")

    RequestModel(spike)
    while not HasModelLoaded(spike) do
      Citizen.Wait(1)
    end

    local object = CreateObject(spike, x, y, z, true, true, true) -- x+1
    PlaceObjectOnGroundProperly(object)
	SetEntityHeading(object, heading)
	FreezeEntityPosition(object, true)
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsIn(ped, false)
    local vehCoord = GetEntityCoords(veh)
    if IsPedInAnyVehicle(ped, false) then
      if DoesObjectOfTypeExistAtCoords(vehCoord["x"], vehCoord["y"], vehCoord["z"], 0.9, GetHashKey("P_ld_stinger_s"), true) then
         SetVehicleTyreBurst(veh, 0, true, 1000.0)
         SetVehicleTyreBurst(veh, 1, true, 1000.0)
         SetVehicleTyreBurst(veh, 2, true, 1000.0)
         SetVehicleTyreBurst(veh, 3, true, 1000.0)
         SetVehicleTyreBurst(veh, 4, true, 1000.0)
         SetVehicleTyreBurst(veh, 5, true, 1000.0)
         SetVehicleTyreBurst(veh, 6, true, 1000.0)
         SetVehicleTyreBurst(veh, 7, true, 1000.0)
         RemoveSpike()
       end
     end
   end
end)

function RemoveSpike()
   local ped = GetPlayerPed(-1)
   local veh = GetVehiclePedIsIn(ped, false)
   local vehCoord = GetEntityCoords(veh)
   if DoesObjectOfTypeExistAtCoords(vehCoord["x"], vehCoord["y"], vehCoord["z"], 0.9, GetHashKey("P_ld_stinger_s"), true) then
      spike = GetClosestObjectOfType(vehCoord["x"], vehCoord["y"], vehCoord["z"], 0.9, GetHashKey("P_ld_stinger_s"), false, false, false)
      SetEntityAsMissionEntity(spike, true, true)
      DeleteObject(spike)
   end
end

 --Notifications
function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

-- Emote Cancel Functions

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_DRINKING") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_PARTYING") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_PUSH_UPS") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_STAND_MOBILE") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_SUNBATHE_BACK") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING_POT") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_AA_COFFEE") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_PAPARAZZI") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_BINOCULARS") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_SIT_UPS") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_MOBILE_FILM_SHOCKING") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_MUSCLE_FLEX") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_COP_IDLES") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_GUARD_STAND") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "CODE_HUMAN_MEDIC_TIME_OF_DEATH") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasdwks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_CLIPBOARD") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_WELDING") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_CAR_PARK_ATTENDANT") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "CODE_HUMAN_MEDIC_KNEEL") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

-- Emote Cancel Functions

--[LEO Animations Start]

-- Hand on Radio Start

RegisterNetEvent('Radio')
AddEventHandler('Radio', function()

local ped = GetPlayerPed( -1 )
    
if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 

Citizen.CreateThread( function()
	RequestAnimDict( "random@arrests" )
	   while ( not HasAnimDictLoaded( "random@arrests" ) ) do 
                Citizen.Wait( 100 )
            end
				if IsEntityPlayingAnim(ped, "random@arrests", "generic_radio_chatter", 3) then
				ClearPedSecondaryTask(ped)
				SetCurrentPedWeapon(ped, GetHashKey("GENERIC_RADIO_CHATTER"), true)
				else
				TaskPlayAnim(ped, "random@arrests", "generic_radio_chatter", 8.0, 2.5, -1, 49, 0, 0, 0, 0 )
				SetCurrentPedWeapon(ped, GetHashKey("GENERIC_RADIO_CHATTER"), true)
            end 
        end )
    end 
end )

-- Hand on Radio End

-- Hand on Radio W/ Gun Start

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

RegisterNetEvent( 'RadioGunPoint' )
AddEventHandler( 'RadioGunPoint', function()
	local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped )) then
        loadAnimDict( "random@arrests" )
        if ( IsEntityPlayingAnim( ped, "random@arrests", "radio_chatter", 3 ) ) then
				ClearPedSecondaryTask(ped)
				SetEnableHandcuffs(ped, false)
				SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
        else
				TaskPlayAnim(ped, "random@arrests", "radio_chatter", 8.0, 2.5, -1, 49, 0, 0, 0, 0 )
				SetCurrentPedWeapon(ped, GetHashKey("WEAPON_PISTOL"), true)
        end    
    end
end )
 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests", "radio_chatter", 3) then
            DisableControlAction(0, 21, true)
			DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
    end
end)

-- Hand on Radio W/ Gun End

-- LEO Stance Start

RegisterNetEvent('Stance')
AddEventHandler('Stance', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_COP_IDLES", 0, true);
	Citizen.Wait(15000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

-- LEO Stance End

-- Investigate Start

RegisterNetEvent('Investigate')
AddEventHandler('Investigate', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_GUARD_STAND", 0, true);
	Citizen.Wait(15000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

-- Investigate End

-- Holster Start

RegisterNetEvent( 'Holster' )
AddEventHandler( 'Holster', function()
	local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped )) then
        loadAnimDict( "move_m@intimidation@cop@unarmed" )
        if ( IsEntityPlayingAnim( ped, "move_m@intimidation@cop@unarmed", "idle", 3 ) ) then
				ClearPedSecondaryTask(ped)
				SetEnableHandcuffs(ped, false)
				SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
        else
				TaskPlayAnim(ped, "move_m@intimidation@cop@unarmed", "idle", 8.0, 2.5, -1, 49, 0, 0, 0, 0 )
				SetEnableHandcuffs(ped, true)
				SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
        end    
    end
end )
 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "move_m@intimidation@cop@unarmed", "idle", 3) then
            DisableControlAction(0, 21, true)
			DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
	end
end)

-- Holster End

-- Citation Start


RegisterNetEvent('Citation')
AddEventHandler('Citation', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "CODE_HUMAN_MEDIC_TIME_OF_DEATH", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

-- Citation End

-- Take Notes Start


RegisterNetEvent('Notes')
AddEventHandler('Notes', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_CLIPBOARD", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

-- Take Notes End


RegisterNetEvent( 'cancelEmote' )
AddEventHandler( 'cancelEmote', function()
	local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped )) then
	    ClearPedSecondaryTask(ped)
        SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)  
    end
end )

-- Direct Traffic Start


RegisterNetEvent('Traffic')
AddEventHandler('Traffic', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_CAR_PARK_ATTENDANT", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

-- Direct Traffic End

