; === Set iniFile Path ===
#Include "activate\Modules\LoadData.ahk"
#Include "activate\Activate_Macro v2.ahk"

DirCreate "images"
DirCreate "images\donators"
try {
	FileInstall "settings.ini", "settings.ini", 0
	FileInstall "images\discordbackground.png", "images\discordbackground.png", 0
	FileInstall "images\TopDonators.png", "images\TopDonators.png", 0
	FileInstall "images\youtubebackground.png", "images\youtubebackground.png", 0
	FileInstall "images\donators\Maf_sinn.png", "images\donators\May.png", 0
	} catch {
}
iniFile := A_ScriptDir . "\settings.ini"  ; This will store settings in settings.ini
; === Load settings from ini ===
LoadData()

versionNumber := 1566

; === Load GUI ===
if (MacroState = 1) {
	LoadGuiActive()
	} else {
	LoadGuiSettings()
}

; === End Auto-execute Section ===
return

; === Gui ===
LoadGuiSettings(*) {
	global
	try {
		Hotkey(startKey, StartMacro, "Off")
		Hotkey(resetKey, ResetMacro, "Off")
		Hotkey(stopKey, StopMacro, "Off")
	}
	Hotkey(settingsKey, SettingsReturn, "Off")
	if (IsSet(myGui1)) {
		myGui1.Destroy()
	}
	myGui := Gui()
	myGui.OnEvent("Close", GuiClose)
	myGui.BackColor := "1F1F1F"
	myGui.SetFont("s11 cFFFFFF")
	Tab := GUIObjTab2MainTab := myGui.Add("Tab2", "x10 y10 w550 h530 vMainTab", ["Seeds", "Eggs/Gear", "Events/Crafting", "Donate", "Wait", "Misc Settings", "Info"])
	
	Tab.UseTab("Seeds")
	
	; === Hotkeys Section ===
	myGui.SetFont("s13 cFF4C4C Bold")
	myGui.Add("GroupBox", "x20 y50 w375 h90 Center", "Hotkeys")
	myGui.SetFont("s9 cFFFFFF norm")
	myGui.Add("Text", "x40 y80", "Start Key:")
	GUIObjStartKeyEdit := myGui.Add("Edit", "vStartKeyEdit limit1 w60 c00000", startKey)
	myGui.Add("Text", "x120 y80", "Stop Key:")
	GUIObjStopKeyEdit := myGui.Add("Edit", "vStopKeyEdit limit1 w60 c00000", stopKey)
	
	myGui.Add("Text", "x200 y80", "Reset Key:")
	GUIObjResetKeyEdit := myGui.Add("Edit", "vResetKeyEdit limit1 w60 c00000", resetKey)
	myGui.Add("Text", "x280 y80", "Settings Key:")
	GUIObjSettingsKeyEdit := myGui.Add("Edit", "vSettingsKeyEdit limit1 w60 c00000", settingsKey)
	
	; === Reverse Shop Order ===
	myGui.SetFont("s9 cFFFFFF norm")
	GUIObjReverseOrderCheck := myGui.Add("Checkbox", "x30 y440 vReverseOrderCheck Checked" . ReverseOrder, "Reverse Buy Order")
	
	; === SEEDS -------------- ===
	myGui.SetFont("s13 cFF4C4C Bold")
	GUIObjSeedsBox := myGui.Add("GroupBox", "x20 y150 w450 h280 Hidden Center", "Seeds")
	; === Carrot ===
	myGui.SetFont("s7 cFFFFFF norm")
	GUIObjCarrotCheck := myGui.Add("Checkbox", "x30 y180 vCarrotCheck Hidden Checked" . Carrot, "Carrot Seed")
	
	; === Strawberry ===
	GUIObjStrawberryCheck := myGui.Add("Checkbox", "x30 y200 vStrawberryCheck Hidden Checked" . Strawberry, "Strawberry Seed")
	
	; === Blueberry ===
	GUIObjBlueberryCheck := myGui.Add("Checkbox", "x30 y220 vBlueberryCheck Hidden Checked" . Blueberry, "Blueberry Seed")
	
	; === Orange ===
	GUIObjOrangeCheck := myGui.Add("Checkbox", "x30 y240 vOrangeCheck Hidden Checked" . Orange, "Orange Tulip Seed")
	
	; === Tomato ===
	GUIObjTomatoCheck := myGui.Add("Checkbox", "x30 y260 vTomatoCheck Hidden Checked" . Tomato, "Tomato Seed")
	; === Corn ===
	GUIObjCornCheck := myGui.Add("Checkbox", "x30 y280 vCornCheck Hidden Checked" . Corn, "Corn Seed")
	
	; === Daffodil ===
	GUIObjDaffodilCheck := myGui.Add("Checkbox", "x30 y300 vDaffodilCheck Hidden Checked" . Daffodil, "Daffodil Seed")
	
	; === Watermelon ===
	GUIObjWatermelonCheck := myGui.Add("Checkbox", "x30 y320 vWatermelonCheck Hidden Checked" . Watermelon, "Watermelon Seed")
	
	; === Pumpkin ===
	GUIObjPumpkinCheck := myGui.Add("Checkbox", "x30 y340 vPumpkinCheck Hidden Checked" . Pumpkin, "Pumpkin Seed")
	
	; === Apple ===
	GUIObjAppleCheck := myGui.Add("Checkbox", "x30 y360 vAppleCheck Hidden Checked" . Apple, "Apple Seed")
	
	
	; === Bamboo ===
	GUIObjBambooCheck := myGui.Add("Checkbox", "x30 y380 vBambooCheck Hidden Checked" . Bamboo, "Bamboo Seed")
	
	; === Coconut ===
	GUIObjCoconutCheck := myGui.Add("Checkbox", "x30 y400 vCoconutCheck Hidden Checked" . Coconut, "Coconut Seed")
	
	; === Cactus ===
	GUIObjCactusCheck := myGui.Add("Checkbox", "x190 y180 vCactusCheck Hidden Checked" . Cactus, "Cactus Seed")
	
	; === Dragon ===
	GUIObjDragonCheck := myGui.Add("Checkbox", "x190 y200 vDragonCheck Hidden Checked" . Dragon, "Dragon Seed")
	
	; === Mango ===
	GUIObjMangoCheck := myGui.Add("Checkbox", "x190 y220 vMangoCheck Hidden Checked" . Mango, "Mango Seed")
	
	; === Grape ===
	GUIObjGrapeCheck := myGui.Add("Checkbox", "x190 y240 vGrapeCheck Hidden Checked" . Grape, "Grape Seed")
	
	; === Mushroom ===
	GUIObjMushroomCheck := myGui.Add("Checkbox", "x190 y260 vMushroomCheck Hidden Checked" . Mushroom, "Mushroom Seed")
	
	; === Pepper ===
	GUIObjPepperCheck := myGui.Add("Checkbox", "x190 y280 vPepperCheck Hidden Checked" . Pepper, "Pepper Seed")
	
	; === Cacao ===
	GUIObjCacaoCheck := myGui.Add("Checkbox", "x190 y300 vCacaoCheck Hidden Checked" . Cacao, "Cacao Seed")
	
	; === Beanstalk ===
	GUIObjBeanstalkCheck := myGui.Add("Checkbox", "x190 y320 vBeanstalkCheck Hidden Checked" . Beanstalk, "Beanstalk Seed")
	
	GUIObjEmberLilyCheck := myGui.Add("Checkbox", "x190 y340 vEmberLilyCheck Hidden Checked" . EmberLily, "Ember Lily Seed")
	GUIObjSugarAppleCheck := myGui.Add("Checkbox", "x190 y360 vSugarAppleCheck Hidden Checked" . SugarApple, "Sugar Apple Seed")
	GUIObjBurningBudCheck := myGui.Add("Checkbox", "x190 y380 vBurningBudCheck Hidden Checked" . BurningBud, "Burning Bud Seed")
	GUIObjGiantPineconeCheck := myGui.Add("Checkbox", "x190 y400 vGiantPineconeCheck Hidden Checked" . GiantPinecone, "GiantPinecone Seed")
	
	; === Cauliflower ===
	GUIObjCauliflowerCheck := myGui.Add("Checkbox", "x350 y180 Hidden vCauliflowerCheck Checked" . Cauliflower, "Cauliflower Seed")
	
	; === Rafflesia ===
	GUIObjRafflesiaCheck := myGui.Add("Checkbox", "x350 y200 Hidden vRafflesiaCheck Checked" . Rafflesia, "Rafflesia Seed")
	
	; === Greem Apple ===
	GUIObjGreenAppleCheck := myGui.Add("Checkbox", "x350 y220 Hidden vGreenAppleCheck Checked" . GreenApple, "GreenApple Seed")
	
	; === Avocado ===
	GUIObjAvocadoCheck := myGui.Add("Checkbox", "x350 y240 Hidden vAvocadoCheck Checked" . Avocado, "Avocado Seed")
	
	; === Banana ===
	GUIObjBananaCheck := myGui.Add("Checkbox", "x350 y260 Hidden vBananaCheck Checked" . Banana, "Banana Seed")
	
	; === Pineapple ===
	GUIObjPineappleCheck := myGui.Add("Checkbox", "x350 y280 Hidden vPineappleCheck Checked" . Pineapple, "Pineapple Seed")
	
	; === Kiwi ===
	GUIObjKiwiCheck := myGui.Add("Checkbox", "x350 y300 Hidden vKiwiCheck Checked" . Kiwi, "Kiwi Seed")
	
	
	; === Bell Pepper ===
	GUIObjBellPepperCheck := myGui.Add("Checkbox", "x350 y320 Hidden vBellPepperCheck Checked" . BellPepper, "BellPepper Seed")
	
	; === Prickly Pear ===
	GUIObjPricklyPearCheck := myGui.Add("Checkbox", "x350 y340 Hidden vPricklyPearCheck Checked" . PricklyPear, "PricklyPear Seed")
	
	; === Loquat ===
	GUIObjLoquatCheck := myGui.Add("Checkbox", "x350 y360 Hidden vLoquatCheck Checked" . Loquat, "Loquat Seed")
	
	; === Feijoa ===
	GUIObjFeijoaCheck := myGui.Add("Checkbox", "x350 y380 Hidden vFeijoaCheck Checked" . Feijoa, "Feijoa Seed")
	
	; === Pitcher ===
	GUIObjPitcherCheck := myGui.Add("Checkbox", "x350 y400 Hidden vPitcherCheck Checked" . Pitcher, "Pitcher Seed")
	
	
	; === TRAVELING MERCHANTS ===
	GUIObjSkyActiveCheck := myGui.Add("Checkbox", "x30 y180 vSkyActiveCheck Hidden Checked" . SkyActive, "Sky shop")
	GUIObjSkyOpt1Check := myGui.Add("Checkbox", "x30 y200 vSkyOpt1Check Hidden Checked" . SkyOpt1, "Slot 1: Starcaller")
	GUIObjSkyOpt2Check := myGui.Add("Checkbox", "x30 y220 vSkyOpt2Check Hidden Checked" . SkyOpt2, "Slot 2: Night Staff")
	GUIObjSkyOpt3Check := myGui.Add("Checkbox", "x30 y240 vSkyOpt3Check Hidden Checked" . SkyOpt3, "Slot 3: Cloudtouched spray")
	GUIObjSummerTravelActiveCheck := myGui.Add("Checkbox", "x30 y260 vSummerTravelActiveCheck Hidden Checked" . SummerTravelActive, "Summer shop, configure in seeds tab")
	GUIObjGnomeActiveCheck := myGui.Add("Checkbox", "x290 y180 vGnomeActiveCheck Hidden Checked" . GnomeActive, "Gnome Shop")
	GUIObjGnomeOpt1Check := myGui.Add("Checkbox", "x290 y200 vGnomeOpt1Check Hidden Checked" . GnomeOpt1, "Slot 1: Common Gnome")
	GUIObjGnomeOpt2Check := myGui.Add("Checkbox", "x290 y220 vGnomeOpt2Check Hidden Checked" . GnomeOpt2, "Slot 2: Farmer Gnome")
	GUIObjGnomeOpt3Check := myGui.Add("Checkbox", "x290 y240 vGnomeOpt3Check Hidden Checked" . GnomeOpt3, "Slot 3: Classic Gnome")
	GUIObjGnomeOpt4Check := myGui.Add("Checkbox", "x290 y260 vGnomeOpt4Check Hidden Checked" . GnomeOpt4, "Slot 4: Iconic Gnome")
	GUIObjHoneyActiveCheck := myGui.Add("Checkbox", "x290 y300 vHoneyActiveCheck Hidden Checked" . HoneyActive, "Honey Shop")
	GUIObjTravelFlowerSeedCheck := myGui.Add("Checkbox", "x290 y320 vTravelFlowerSeedCheck Hidden Checked" . TravelFlowerSeed, "Flower Seed")
	GUIObjTravelHoneySprinklerCheck := myGui.Add("Checkbox", "x290 y340 vTravelHoneySprinklerCheck Hidden Checked" . TravelHoneySprinkler, "Honey Sprinkler")
	GUIObjTravelBeeEggCheck := myGui.Add("Checkbox", "x290 y360 vTravelBeeEggCheck Hidden Checked" . TravelBeeEgg, "Bee Egg")
	GUIObjTravelHoneyCrateCheck := myGui.Add("Checkbox", "x290 y380 vTravelHoneyCrateCheck Hidden Checked" . TravelHoneyCrate, "Honey Crate")
	GUIObjTravelCrafterCrateCheck := myGui.Add("Checkbox", "x290 y400 vTravelCrafterCrateCheck Hidden Checked" . TravelCrafterCrate, "Crafter Crate")
	myGui.SetFont("s13 c1030FF Bold")
	GUIObjSkyBox := myGui.Add("GroupBox", "x20 y150 w250 h280 Hidden Center", "Sky")
	GUIObjGnomeBox := myGui.Add("GroupBox", "x280 y150 w250 h280 Hidden Center", "Gnome")
	
	
	
	; === Styling Buttons ===
	myGui.SetFont("s13 c000000 Bold")
	GUIObjButtonTravel := myGui.Add("Button", "x415 y50 w110 h90  Background5865F2", "Traveling Merchants")
	GUIObjButtonTravel.OnEvent("Click", EnableSpecialTab.Bind(1))
	myGui.SetFont("s22 cFFFFFF Bold")
	GUIObjButtonSave := myGui.Add("Button", "x60 y480 w220 h50  Background5865F2", "Save")
	GUIObjButtonSave.OnEvent("Click", SaveSettings)
	GUIObjButtonLoad := myGui.Add("Button", "x290 y480 w220 h50  Background5865F2", "Open Macro")
	GUIObjButtonLoad.OnEvent("Click", LoadMacro)
	
	GUIObjSeedsCheck := myGui.Add("Checkbox", "x190 y430 vSeedsCheck Checked" . SeedsValue, "Seeds")
	GUIObjGearsCheck := myGui.Add("Checkbox", "x310 y430 vGearsCheck Checked" . GearsValue, "Gears")
	
	Tab.UseTab("Events/Crafting")
	myGui.SetFont("s22 cFFFFFF Bold")
	GUIObjButtonLeftEvent := myGui.Add("Button", "x22 y500 w30 h30  Background5865F2", "←")
	GUIObjButtonLeftEvent.OnEvent("Click", PageChange.Bind(0, "Event"))
	GUIObjButtonRightEvent := myGui.Add("Button", "x518 y500 w30 h30  Background5865F2", "→")
	GUIObjButtonRightEvent.OnEvent("Click", PageChange.Bind(1, "Event"))
	GUIObjButtonCraft := myGui.Add("Button", "x60 y500 w450 h30  Background5865F2", "Switch to crafting")
	GUIObjButtonCraft.OnEvent("Click", EnableSpecialTab.Bind(0))
	
	myGui.SetFont("s12 cFFFFFF norm")
	GUIObjCraftAText := myGui.Add("Text", "x30 y80 Hidden", "Event crafts:")
	GUIObjCraftAOption := myGui.Add("DropDownList", "x30 y100 vCraftAOption  Hidden Choose1", ["None", "Horsetail", "Lingonberry", "Amber Spine", "Grand Volcania", "Peace Lily", "Aloe Vera", "Guanabana"])
	GUIObjCraftAOption.Text := CraftTargetA
	GUIObjCraftBText := myGui.Add("Text", "x300 y80 Hidden", "Normal crafts:")
	GUIObjCraftBOption := myGui.Add("DropDownList", "x300 y100 vCraftBOption Hidden Choose1", ["None", "Lightning", "Reclaimer", "Tropical Sprinkler", "Berry Sprinkler", "Spice Sprinkler", "Sweet Sprinkler", "Flower Sprinkler", "Stalk Sprinkler", "Choc Spray", "Chilled Spray", "Shocked Spray", "Anti Bee", "Small Toy", "Small Treat","Pack Bee"])
	GUIObjCraftBOption.Text := CraftTargetB
	GUIObjCraftInstantCheck := myGui.Add("Checkbox", "x30 y140 Hidden vCraftInstantCheck Checked" . CraftInstant, "Craft on first cycle. Warning, may cause robux popups!`nIf disabled, it waits a full craft time.")
	GUIObjCraftInfoText := myGui.Add("Text", "x30 y200 Hidden", "Put stackable items in slot 3, 4, 5 for event, 6, 7, 8 for normal. `nDon't skip slots, it only checks 2 slots for a craft that needs 2 stackables.`nNon-stackable items will be found with searching.`nRemove favorited items in advance.`nRemove dragon peppers if crafting Tropical Sprinklers")
	GUIObjMakeHoneyCheck := myGui.Add("Checkbox", "x30 y320 Hidden vMakeHoneyCheck Checked" . MakeHoney, "Convert Pollinated fruit into honey.")
	myGui.SetFont("s13 c884488 Bold")
	GUIObjCraftBox := myGui.Add("GroupBox", "x20 y50 w525 h440 Hidden Center", "Crafting")
	myGui.SetFont("s13 cFF4C4C Bold")
	GUIObjTwiBloodBox := myGui.Add("GroupBox", "x20 y50 w255 h440 Hidden Center", "Twilight/Blood Items")
	
	myGui.SetFont("s13 cFFFF00 Bold")
	GUIObjBeeBox := myGui.Add("GroupBox", "x290 y50 w255 h440 Hidden Center", "Bee Items")
	
	myGui.SetFont("s13 c1030FF Bold")
	GUIObjSumBox := myGui.Add("GroupBox", "x20 y50 w255 h440 Hidden Center", "Summer Items")
	
	myGui.SetFont("s13 c4600A4 Bold")
	GUIObjPrehistBox := myGui.Add("GroupBox", "x290 y50 w255 h440 Hidden Center", "Dino Items")
	
	myGui.SetFont("s13 cFFFFFF Bold")
	GUIObjZenBox := myGui.Add("GroupBox", "x20 y50 w255 h440 Hidden Center", "Zen Items")
	
	myGui.SetFont("s9 cFFFFFF norm")
	GUIObjForceNightCheck := myGui.Add("Checkbox", "x20 y40 Hidden vForceNightCheck Checked" . ForceNight, "Force Moon shop")
	GUIObjForceBeeCheck := myGui.Add("Checkbox", "x390 y40 Hidden vForceBeeCheck Checked" . ForceBee, "Force Bee shop")
	GUIObjForceSummerCheck := myGui.Add("Checkbox", "x20 y40 Hidden vForceSummerCheck Checked" . ForceSummer, "Force Summer shop")
	GUIObjForcePrehistCheck:= myGui.Add("Checkbox", "x390 y40 Hidden vForcePrehistCheck Checked" . ForcePrehist, "Force Prehistoric shop")
	GUIObjForceZenCheck := myGui.Add("Checkbox", "x20 y40 Hidden vForceZenCheck Checked" . ForceZen, "Force Zen shop")
	
	GUIObjIgnoreWeatherCheck := myGui.Add("Checkbox", "x195 y40 vIgnoreWeatherCheck Checked" . IgnoreWeather, "Ignore Weather Requirement")
	
	
	GUIObjZenEventShop := map()
	PosX := 40
	PosY := 80
	For k, ItemName in ZenList {
		TempNameSpaceless := StrReplace(ItemName," ")
		GUIObjZenEventShop[ItemName] := myGui.Add("Checkbox", "x" . PosX . " y" . PosY . " Hidden v" . TempNameSpaceless . "Check Checked" . %TempNameSpaceless%, ItemName)
		PosY += 30
	}
	GUIObjPrehistShopCheck := myGui.Add("Checkbox", "x310 y80 Hidden vPrehistShopCheck Checked" . PrehistShop, "Buy Prehist Shop")
	GUIObjPrehistCraftOption := myGui.Add("DropDownList", "x310 y110 vPrehistCraftOption  Hidden Choose1", ["None", "Amber Spray", "Ancient Seed", "Dino Crate", "Archaeologist Crate", "Dino Egg", "Primal Egg"])
	GUIObjPrehistCraftOption.text := PrehistCraft
	GUIObjDinoEggCheck := myGui.Add("Checkbox", "x310 y140 Hidden vDinoEggCheck Checked" . DinoEgg, "Dino Egg")
	GUIObjDinoPetText := myGui.Add("Text", "x310 y170 Hidden", "Sacrifice pet:")
	GUIObjDinoPetEdit := myGui.Add("Edit", "vDinoPetEdit w60 c000000", DinoPet)
	GUIObjPrehistInstantCraftCheck := myGui.Add("Checkbox", "x310 y230 Hidden vPrehistInstantCraftCheck Checked" . PrehistInstantCraft, "Craft first cycle")
	GUIObjDinoCraftText := myGui.Add("Text", "x310 y260 Hidden", "Uses slot 9 and 0.`nRemove favorited pets for sacrifice!")
	
	GUIObjSummerShopCheck := myGui.Add("Checkbox", "x40 y80 Hidden vSummerShopCheck Checked" . SummerShop, "Buy Summer Shop")
	GUIObjSummerSeedCheck:= myGui.Add("Checkbox", "x40 y110 Hidden vSummerSeedCheck Checked" . SummerSeed, "Summer Seed")
	GUIObjDelphiniumCheck := myGui.Add("Checkbox", "x40 y140 Hidden vDelphiniumCheck Checked" . Delphinium, "Delphinium Seed")
	GUIObjLilyValleyCheck := myGui.Add("Checkbox", "x40 y170 Hidden vLilyValleyCheck Checked" . LilyValley, "Lily of the Valley")
	GUIObjTravelerCheck := myGui.Add("Checkbox", "x40 y200 Hidden vTravelerCheck Checked" . Traveler, "Traveler Seed")
	GUIObjSprayBurntCheck := myGui.Add("Checkbox", "x40 y230 Hidden vSprayBurntCheck Checked" . SprayBurnt, "Burnt Spray")
	GUIObjOasisCrateCheck := myGui.Add("Checkbox", "x40 y260 Hidden vOasisCrateCheck Checked" . OasisCrate, "Oasis Crate")
	GUIObjOasisEggCheck := myGui.Add("Checkbox", "x40 y290 Hidden vOasisEggCheck Checked" . OasisEgg, "Oasis Egg")
	GUIObjHamsterCheck := myGui.Add("Checkbox", "x40 y320 Hidden vHamsterCheck Checked" . Hamster, "Hamster")
	
	GUIObjTwibloodCheck := myGui.Add("Checkbox", "x40 y80 Hidden vTwibloodCheck Checked" . Twiblood, "Buy Twilight/Bloodmoon Shop")
	GUIObjBloodCrateCheck := myGui.Add("Checkbox", "x40 y110 Hidden vBloodCrateCheck Checked" . BloodCrate, "Blood Crate")
	GUIObjTwilightCrateCheck := myGui.Add("Checkbox", "x40 y140 Hidden vTwilightCrateCheck Checked" . TwilightCrate, "Twilight Crate")
	GUIObjNightEggCheck := myGui.Add("Checkbox", "x40 y170 Hidden vNightEggCheck Checked" . NightEgg, "Night Egg")
	GUIObjNightSeedCheck := myGui.Add("Checkbox", "x40 y200 Hidden vNightSeedCheck Checked" . NightSeed, "Night Seed")
	GUIObjStarCallerCheck := myGui.Add("Checkbox", "x40 y230 Hidden vStarCallerCheck Checked" . StarCaller, "Star Caller")
	GUIObjMoonMelonCheck := myGui.Add("Checkbox", "x40 y260 Hidden vMoonMelonCheck Checked" . MoonMelon, "Moon Melon")
	GUIObjBloodBananaCheck := myGui.Add("Checkbox", "x40 y290 Hidden vBloodBananaCheck Checked" . BloodBanana, "Blood Banana")
	GUIObjMoonMangoCheck := myGui.Add("Checkbox", "x40 y320 Hidden vMoonMangoCheck Checked" . MoonMango, "Moon Mango")
	GUIObjCelestiberryCheck := myGui.Add("Checkbox", "x40 y350 Hidden vCelestiberryCheck Checked" . Celestiberry, "Celestiberry")
	GUIObjMoonCatCheck := myGui.Add("Checkbox", "x40 y380 Hidden vMoonCatCheck Checked" . MoonCat, "Moon Cat")
	GUIObjBloodHedgeCheck := myGui.Add("Checkbox", "x40 y410 Hidden vBloodHedgeCheck Checked" . BloodHedge, "Blood Hedge")
	GUIObjBloodKiwiCheck := myGui.Add("Checkbox", "x40 y440 Hidden vBloodKiwiCheck Checked" . BloodKiwi, "Blood Kiwi")
	GUIObjBloodOwlCheck := myGui.Add("Checkbox", "x40 y470 Hidden vBloodOwlCheck Checked" . BloodOwl, "Blood Owl")
	
	GUIObjBeeShopCheck := myGui.Add("Checkbox", "x310 y80 Hidden vBeeShopCheck Checked" . BeeShop, "Buy Bee Shop")
	GUIObjFlowerSeedCheck := myGui.Add("Checkbox", "x310 y100 Hidden vFlowerSeedCheck Checked" . FlowerSeed, "Flower Seed")
	GUIObjLavenderCheck := myGui.Add("Checkbox", "x310 y120 Hidden vLavenderCheck Checked" . Lavender, "Lavender Seed")
	GUIObjNectarshadeCheck := myGui.Add("Checkbox", "x310 y140 Hidden vNectarshadeCheck Checked" . Nectarshade, "Nectarshade Seed")
	GUIObjNectarineCheck := myGui.Add("Checkbox", "x310 y160 Hidden vNectarineCheck Checked" . Nectarine, "Nectarine")
	GUIObjHiveFruitCheck := myGui.Add("Checkbox", "x310 y180 Hidden vHiveFruitCheck Checked" . HiveFruit, "Hive Fruit")
	GUIObjPollenGunCheck := myGui.Add("Checkbox", "x310 y200 Hidden vPollenGunCheck Checked" . PollenGun, "Pollen Gun")
	GUIObjNectarStaffCheck := myGui.Add("Checkbox", "x310 y220 Hidden vNectarStaffCheck Checked" . NectarStaff, "Nectar Staff")
	GUIObjHoneySprinklerCheck := myGui.Add("Checkbox", "x310 y240 Hidden vHoneySprinklerCheck Checked" . HoneySprinkler, "Honey Sprinkler")
	GUIObjBeeEggCheck := myGui.Add("Checkbox", "x310 y260 Hidden vBeeEggCheck Checked" . BeeEgg, "Bee Egg")
	GUIObjBeeCrateCheck := myGui.Add("Checkbox", "x310 y280 Hidden vBeeCrateCheck Checked" . BeeCrate, "Bee Crate")
	GUIObjHoneyCombCheck := myGui.Add("Checkbox", "x310 y300 Hidden vHoneyCombCheck Checked" . HoneyComb, "Honey Comb")
	GUIObjBeeChairCheck := myGui.Add("Checkbox", "x310 y320 Hidden vBeeChairCheck Checked" . BeeChair, "Bee Chair")
	GUIObjHoneyTorchCheck := myGui.Add("Checkbox", "x310 y340 Hidden vHoneyTorchCheck Checked" . HoneyTorch, "Honey Torch")
	GUIObjHoneyWalkwayCheck := myGui.Add("Checkbox", "x310 y360 Hidden vHoneyWalkwayCheck Checked" . HoneyWalkway, "Honey Walkway")
	
	Tab.UseTab("Eggs/Gear")
	; === Eggs -------------- ===
	myGui.SetFont("s13 cFF4C4C Bold")
	myGui.Add("GroupBox", "x20 y50 w250 h270 Center", "Eggs")
	myGui.SetFont("s13 cFFFFFF norm")
	GUIObjBuyAllEggsCheck := myGui.Add("Checkbox", "x50 y80 vBuyAllEggsCheck Checked" . BuyAllEggsValue, "Buy Eggs")
	GUIObjCommonEggCheck := myGui.Add("Checkbox", "x50 y100 vCommonEggCheck Checked" . CommonEgg, "Common Eggs")
	GUIObjUncommonEggCheck := myGui.Add("Checkbox", "x50 y120 vUncommonEggCheck Checked" . UncommonEgg, "Uncommon Eggs")
	GUIObjRareEggCheck := myGui.Add("Checkbox", "x50 y140 vRareEggCheck Checked" . RareEgg, "Rare Eggs")
	GUIObjLegEggCheck := myGui.Add("Checkbox", "x50 y160 vLegEggCheck Checked" . LegEgg, "Legendary Eggs")
	GUIObjMythEggCheck := myGui.Add("Checkbox", "x50 y180 vMythEggCheck Checked" . MythEgg, "Mythical Eggs")
	GUIObjBugEggCheck := myGui.Add("Checkbox", "x50 y200 vBugEggCheck Checked" . BugEgg, "Bug Eggs")
	GUIObjSummerCommonEggCheck := myGui.Add("Checkbox", "x50 y220 vSummerCommonEggCheck Checked" . SummerCommonEgg, "Summer Common Eggs")
	GUIObjSummerRareEggCheck := myGui.Add("Checkbox", "x50 y240 vSummerRareEggCheck Checked" . SummerRareEgg, "Summer Rare Eggs")
	GUIObjParadiseEggCheck := myGui.Add("Checkbox", "x50 y260 vParadiseEggCheck Checked" . ParadiseEgg, "Paradise Eggs")
	GUIObjBeeEggEggCheck := myGui.Add("Checkbox", "x50 y280 vBeeEggEggCheck Checked" . BeeEggEgg, "Bee Eggs")
	
	
	; === GEARS -------------- ===
	myGui.SetFont("s13 cFF4C4C Bold")
	GUIObjGearsBox := myGui.Add("GroupBox", "x300 y50 w195 h280 Hidden Center", "Gears")
	
	; === GEARS -------------- ===
	myGui.SetFont("s13 cFF4C4C Bold")
	GUIObjGearsBox := myGui.Add("GroupBox", "x300 y50 w195 h280 Hidden Center", "Gears")
	
	; === Gear Checkboxes ===
	myGui.SetFont("s7 cFFFFFF norm")
	GUIObjWateringCheck := myGui.Add("Checkbox", "x310 y80 vWateringCheck Checked" . Watering, "Watering")
	GUIObjTrowelCheck := myGui.Add("Checkbox", "x310 y100 vTrowelCheck Checked" . Trowel, "Trowel")
	GUIObjRecallCheck := myGui.Add("Checkbox", "x310 y120 vRecallCheck Checked" . Recall, "Recall")
	GUIObjBasicCheck := myGui.Add("Checkbox", "x310 y140 vBasicCheck Checked" . Basic, "Basic")
	GUIObjAdvancedCheck := myGui.Add("Checkbox", "x310 y160 vAdvancedCheck Checked" . Advanced, "Advanced")
	GUIObjMediumToyCheck := myGui.Add("Checkbox", "x310 y180 vMediumToyCheck Checked" . MediumToy, "MediumToy")
	GUIObjMediumTreatCheck := myGui.Add("Checkbox", "x310 y200 vMediumTreatCheck Checked" . MediumTreat, "MediumTreat")
	GUIObjGodlyCheck := myGui.Add("Checkbox", "x310 y220 vGodlyCheck Checked" . Godly, "Godly")
	GUIObjMagnifyCheck := myGui.Add("Checkbox", "x310 y240 vMagnifyCheck Checked" . Magnify, "Magnify")
	GUIObjMirrorCheck := myGui.Add("Checkbox", "x310 y260 vMirrorCheck Checked" . Mirror, "Mirror")
	GUIObjMasterCheck := myGui.Add("Checkbox", "x310 y280 vMasterCheck Checked" . Master, "Master")
	GUIObjCleansingCheck := myGui.Add("Checkbox", "x310 y300 vCleansingCheck Checked" . Cleansing, "Cleansing")
	GUIObjFavoriteCheck := myGui.Add("Checkbox", "x400 y80 vFavoriteCheck Checked" . Favorite, "Favorite")
	GUIObjHarvestCheck := myGui.Add("Checkbox", "x400 y100 vHarvestCheck Checked" . Harvest, "Harvest")
	GUIObjFriendshipCheck := myGui.Add("Checkbox", "x400 y120 vFriendshipCheck Checked" . Friendship, "Friendship")
	GUIObjLevelupLollyCheck := myGui.Add("Checkbox", "x400 y140 vLevelupLollyCheck Checked" . LevelupLolly, "Levelup Lolly")
	
	; --- Donate Tab ---
	Tab.UseTab("Donate")
	myGui.SetFont("s13 cWhite", "Bold")
	
	; First Row
	GUIObjButton100Robux := myGui.Add("Button", "x50  y50 w110 h30", "100 Robux")
	GUIObjButton100Robux.OnEvent("Click", Donate100)
	GUIObjButton250Robux := myGui.Add("Button", "x170 y50 w110 h30", "250 Robux")
	GUIObjButton250Robux.OnEvent("Click", Donate250)
	GUIObjButton500Robux := myGui.Add("Button", "x290 y50 w110 h30", "500 Robux")
	GUIObjButton500Robux.OnEvent("Click", Donate500)
	GUIObjButton1000Robux := myGui.Add("Button", "x410 y50 w110 h30", "1000 Robux")
	GUIObjButton1000Robux.OnEvent("Click", Donate1000)
	
	; Second Row
	GUIObjButton2500Robux := myGui.Add("Button", "x110 y90 w110 h30", "2500 Robux")
	GUIObjButton2500Robux.OnEvent("Click", Donate2500)
	GUIObjButton5000Robux := myGui.Add("Button", "x230 y90 w110 h30", "5000 Robux")
	GUIObjButton5000Robux.OnEvent("Click", Donate5000)
	GUIObjButton10000Robux := myGui.Add("Button", "x350 y90 w110 h30", "10000 Robux")
	GUIObjButton10000Robux.OnEvent("Click", Donate10000)
	
	myGui.SetFont("s15 cWhite", "Bold")
	myGui.Add("Text", "x80 y130 w460 +Center", "Top Donators:")
	
	; Row 1
	GUIObjA_ScriptDirDonatorOne := myGui.Add("Pic", "x100 y168 w32 h32", A_ScriptDir . "\images\donators\kcavgs.png"), DonatorOne := GUIObjA_ScriptDirDonatorOne.hwnd
	myGui.SetFont("s9 cWhite", "Segoe UI")
	myGui.Add("Picture", "x150 y168 w32 h32")
	myGui.Add("Text", "x190 y180 w220 h32", "kcavgs")
	myGui.Add("Text", "x330 y180 w80  h32 +Right", "750")
	
	; Row 2
	GUIObjA_ScriptDirDonatorTwo := myGui.Add("Pic", "x100 y212 w32 h32", A_ScriptDir . "\images\donators\Maf_sinn.png"), DonatorTwo := GUIObjA_ScriptDirDonatorTwo.hwnd
	myGui.Add("Picture", "x150 y212 w32 h32")
	myGui.Add("Text", "x190 y220 w220 h32", "Maf_sinn")
	myGui.Add("Text", "x330 y220 w80  h32 +Right", "100")
	
	; Row 3
	GUIObjA_ScriptDirDonatorThree := myGui.Add("Pic", "x100 y252 w32 h32", A_ScriptDir . "\images\donators\XolkooTH.png"), DonatorThree := GUIObjA_ScriptDirDonatorThree.hwnd
	myGui.Add("Picture", "x150 y252 w32 h32")
	myGui.Add("Text", "x190 y260 w220 h32", "XolkooTH")
	myGui.Add("Text", "x330 y260 w80  h32 +Right", "100")
	
	; Row 4
	myGui.Add("Picture", "x150 y292 w32 h32")
	myGui.Add("Text", "x190 y300 w220 h32", "Na")
	myGui.Add("Text", "x330 y300 w80  h32 +Right", "0")
	
	; Row 5
	myGui.Add("Picture", "x150 y328 w32 h32")
	myGui.Add("Text", "x190 y340 w220 h32", "Na")
	myGui.Add("Text", "x330 y340 w80  h32 +Right", "0")
	
	; Row 6
	myGui.Add("Picture", "x150 y368 w32 h32")
	myGui.Add("Text", "x190 y380 w220 h32", "Na")
	myGui.Add("Text", "x330 y380 w80  h32 +Right", "0")
	
	; Row 7
	myGui.Add("Picture", "x150 y420 w32 h32")
	myGui.Add("Text", "x190 y420 w220 h32", "NA")
	myGui.Add("Text", "x330 y420 w80  h32 +Right", "0")
	
	; Row 8
	myGui.Add("Picture", "x150 y460 w32 h32")
	myGui.Add("Text", "x190 y460 w220 h32", "NA")
	myGui.Add("Text", "x330 y460 w80  h32 +Right", "0")
	
	
	Tab.UseTab("Misc Settings")
	
	myGui.SetFont("s13 c000000 Bold")
	GUIObjEssentialButton:= myGui.Add("Button", "x30 y80 w245 h50 Hidden Background5865F2", "Essential Settings")
	GUIObjEssentialButton.OnEvent("Click", SettingsMenuSwap.Bind(1))
	GUIObjSpeedButton:= myGui.Add("Button", "x30 y150 w245 h50 Hidden Background5865F2", "Speed Settings")
	GUIObjSpeedButton.OnEvent("Click", SettingsMenuSwap.Bind(2))
	GUIObjPreferenceButton:= myGui.Add("Button", "x295 y80 w245 h50 Hidden Background5865F2", "Preference Settings")
	GUIObjPreferenceButton.OnEvent("Click", SettingsMenuSwap.Bind(3))
	GUIObjAdvancedButton:= myGui.Add("Button", "x295 y150 w245 h50 Hidden Background5865F2", "Advanced Settings")
	GUIObjAdvancedButton.OnEvent("Click", SettingsMenuSwap.Bind(4))
	GUIObjBackButton:= myGui.Add("Button", "x30 y430 w510 h50 Hidden Background5865F2", "Back to menu")
	GUIObjBackButton.OnEvent("Click", SettingsMenuSwap.Bind(0))
	myGui.SetFont("s13 cFFFFFF Bold")
	GUIObjSettingsBox := myGui.Add("GroupBox", "x20 y50 w530 h450", "Settings Menu")
	myGui.SetFont("s9 cFFFFFF Bold")
	;essential
	GUIObjBackpackText := myGui.Add("Text", "x30 y80 Hidden", "Backpack Key:")
	GUIObjInventoryKeyEdit := myGui.Add("Edit", "vInventoryKeyEdit Hidden w60 c000000", inventoryKey)
	GUIObjUIText := myGui.Add("Text", "x200 y80 Hidden", "UI Selection Key:")
	GUIObjInterfaceButtonEdit := myGui.Add("Edit", "vInterfaceButtonEdit Hidden w60 c000000", InterfaceButton)
	;speed
	GUIObjSlowModeCheck := myGui.Add("Checkbox", "x30 y80 Hidden vSlowModeCheck Checked" . SlowMode, "Slow Mode (set key/mouse delay low first!)")
	GUIObjMouseDelayText := myGui.Add("Text", "x30 y110 Hidden", "Mouse Delay")
	GUIObjMouseDelayEdit := myGui.Add("Edit", "vMouseDelayEdit Hidden Number w60 c000000", MouseDelay)
	GUIObjKeyDelayText := myGui.Add("Text", "x130 y110 Hidden", "Key Delay")
	GUIObjKeyDelayEdit := myGui.Add("Edit", "vKeyDelayEdit Hidden Number w60 c000000", KeyDelay)
	GUIObjGlobalDelayText := myGui.Add("Text", "x230 y110 Hidden", "Global Delay")
	GUIObjGlobalDelayEdit := myGui.Add("Edit", "vGlobalDelayEdit Hidden Number w60 c000000", GlobalDelay)
	;preferences
	GUIObjBuyCapText := myGui.Add("Text", "x30 y80 Hidden", "Buy limit")
	GUIObjBuyCapEdit := myGui.Add("Edit", "vBuyCapEdit Hidden Number w60 c000000", BuyCap)
	GUIObjAltBuyCheck := myGui.Add("Checkbox", "x30 y130 Hidden vAltBuyCheck Checked" . AltBuy, "Alt Buy method (Beta)")
	GUIObjAutoAlignCheck := myGui.Add("Checkbox", "x30 y180 Hidden vAutoAlignCheck Checked" . AutoAlign, "Auto Alignment (Requires UI selection key)")
	GUIObjAutoAlignRecalText := myGui.Add("Text", "x320 y160 Hidden", "Realign Cycle #")
	GUIObjAutoAlignRecalEdit := myGui.Add("Edit", "vAutoAlignRecalEdit Hidden w60 c000000", AutoAlignRecal)
	GUIObjZoomLevelText := myGui.Add("Text", "x420 y160 Hidden", "Zoom level")
	GUIObjZoomLevelEdit := myGui.Add("Edit", "vZoomLevelEdit Hidden w60 c000000", ZoomLevel)
	GUIObjWrenchActiveCheck := myGui.Add("Checkbox", "x30 y210 Hidden vWrenchActiveCheck Checked" . WrenchActive, "Use Wrench to teleport. Use slot (2-9):")
	GUIObjWrenchSlotEdit := myGui.Add("Edit", "x268 y210 Hidden vWrenchSlotEdit Number w60 c000000", WrenchSlot)
	GUIObjFailCountLimitText := myGui.Add("Text", "x30 y240 Hidden", "Max Failures")
	GUIObjFailCountLimitEdit := myGui.Add("Edit", "vFailCountLimitEdit Hidden w60 c000000", FailCountLimit)
	GUIObjClassicShopInitCheck := myGui.Add("Checkbox", "x30 y290 Hidden vClassicShopInitCheck Checked" . ClassicShopInit, "Original shop calibration")
	;advanced
	GUIObjIgnoreErrorsCheck := myGui.Add("Checkbox", "x30 y80 Hidden vIgnoreErrorsCheck Checked" . IgnoreErrors, "Ignore errors related to detecting shops. Use at own risk!")
	GUIObjMovementFactorText := myGui.Add("Text", "x30 y110 Hidden", "Movement change. 1 increases walk distance by 1%, -1 decreases walk distance by 1%.`nAccepts decimals (such as 1.5).")
	GUIObjMovementFactorEdit := myGui.Add("Edit", "vMovementFactorEdit Hidden w60 c000000", MovementFactor)
	GUIObjUIInitModeCheck := myGui.Add("Checkbox", "x30 y180 Hidden vUIInitModeCheck Checked" . UIInitMode, "UI Initialization Mode")
	GUIObjDebugModeCheck := myGui.Add("Checkbox", "x30 y210 Hidden vDebugModeCheck Checked" . DebugMode, "Debug Mode! Do not activate unless told!")
	
	
	Tab.UseTab("Info")
	
	; === Credits Section ===
	myGui.SetFont("s10 cFFFFFF Bold")
	myGui.Add("GroupBox", "x20 y50 w530 h100", "Credits,")
	myGui.SetFont("s13 cFFFFFF Bold")
	myGui.Add("Text", "x30 y75", "Created By: MayMay")
	myGui.SetFont("s8 cFFFFFF Bold")
	myGui.Add("Text", "x30 y100", "Help By Jimmy And Ab")
	myGui.SetFont("s11 cFFFFFF Bold")
	myGui.Add("Text", "x35 y115", "If you need any help, join my Discord ---->")
	
	; === Help Section ===
	
	; Set bold white font
	myGui.SetFont("s9 cFFFFFF Bold")
	
	; Set larger bold white font (20% bigger)
	myGui.SetFont("s11 cFFFFFF Bold")
	
	; === YouTube Button with Stroke Text ===
	GUIObjA_ScriptDirimagesyoutubebackgroundpngPicYT := myGui.Add("Pic", "x350 y70 w120 h30  0xE", A_ScriptDir . "\images\youtubebackground.png"), PicYT := GUIObjA_ScriptDirimagesyoutubebackgroundpngPicYT.hwnd
	
	; Simulated text stroke (black outline)
	Loop 8 {
		OffsetX := [0,1,1,1,0,-1,-1,-1][A_Index]
		OffsetY := [-1,-1,0,1,1,1,0,-1][A_Index]
		myGui.SetFont("s13 c000000 bold")
		myGui.Add("Text", "x" 350+OffsetX " y" 73+OffsetY " w120 h30 Center BackgroundTrans", "Open YouTube")
	}
	
	; Main text (white foreground)
	myGui.SetFont("s13 cFFFFFF bold")
	GUIObjTextOpenYouTube := myGui.Add("Text", "x350 y73 w120 h30 Center BackgroundTrans", "Open YouTube")
	GUIObjTextOpenYouTube.OnEvent("Click", OpenWebsite)
	
	; === Discord Button with Stroke Text ===
	GUIObjA_ScriptDirimagesdiscordbackgroundpngPicDC := myGui.Add("Pic", "x350 y110 w120 h30  0xE", A_ScriptDir . "\images\discordbackground.png"), PicDC := GUIObjA_ScriptDirimagesdiscordbackgroundpngPicDC.hwnd
	
	; Simulated text stroke (black outline)
	Loop 8 {
		OffsetX := [0,1,1,1,0,-1,-1,-1][A_Index]
		OffsetY := [-1,-1,0,1,1,1,0,-1][A_Index]
		myGui.SetFont("s13 c000000 bold")
		myGui.Add("Text", "x" 350+OffsetX " y" 113+OffsetY " w120 h30 Center BackgroundTrans", "Open Discord")
	}
	
	; Main text (white foreground)
	myGui.SetFont("s13 cFFFFFF bold")
	GUIObjTextOpenDiscord := myGui.Add("Text", "x350 y113 w120 h30 Center BackgroundTrans", "Open Discord")
	GUIObjTextOpenDiscord.OnEvent("Click", OpenDiscord)
	
	
	
	
	
	; === WAIT TIMES ===
	
	Tab.UseTab("Wait")
	
	; Seeds Section
	myGui.SetFont("s13 cFF4C4C Bold")
	myGui.Add("GroupBox", "x30 y50 w250 h80 Center", "Alter Wait Time")
	myGui.SetFont("s12 cFFFFFF")
	myGui.Add("Text", "x45 y70", "Alter Wait Time by (in seconds):")
	myGui.Add("Text", "x285 y85", "Default is -1")
	GUIObjEditTimerAdjustmentInputEdit := myGui.Add("Edit", "x110 y95 w100 vTimerAdjustmentInputEdit c000000", TimerAdjustment)
	GUIObjEditTimerAdjustmentUD := myGui.Add("UpDown", "vTimerAdjustmentInput Range-300-10000", TimerAdjustment)
	
	
	myGui.SetFont("s20 cFFFFFF Bold")
	myGui.Add("Text", "x30 y455", "Join my discord server if you need help")
	
	; Set visibility of seeds and events to page 1
	SeedCurrentPage := 2
	EventCurrentPage := 1
	SettingsPage := 0
	TravelEnabled := 0
	CraftEnabled := 0
	SeedPage(2)
	EventPage(1)
	SettingsMenuSwap(0)
	
	
	myGui.Title := "Macro Settings"
	myGui.Show("w570 h550")
}
; === Open Website ===
OpenWebsite(*)
{
	global
Run("")
	return
}
; === Open Discord ===
OpenDiscord(*)
{
	global
	Run("https://discord.gg/qFMyhT3xFy")
	return
}
; === Save Settings ===
SaveSettings(*)
{
	global
	oSaved := myGui.Submit("0")
	SaveData := map()
	for VarName, VarVal in oSaved.OwnProps() {
		SaveData[VarName] := VarVal
	}
	; === COMPLEX ===
	
	
	SettingCategoryList := ["Settings","Crafting","PrehistShop","TimerAdjustment"]
	ListList := [SettingsList, CraftingList, PrehistShopList,  TimerAdjustmentList]
	for k, SettingCategory in SettingCategoryList {
		for ka, SettingName in ListList[k] {
			SettingNameTemp := StrReplace(StrReplace(StrReplace(StrReplace(SettingName,"Edit"),"Check"),"Option"),"Input")
			IniWrite(SaveData[SettingName], iniFile, SettingCategory, SettingNameTemp)
		}
	}
	; === SIMPLE ===
	SettingCategoryList := ["Seeds","SummerSeeds","Gear","travel","ForceEvent","Twiblood","BeeShop","SumShop","IgnoreWeather","Eggs","Gears/Seeds","ZenShop"]
	ListList := [SeedList, SummerSeedList, GearList, TravelList, ForceEventList, TwibloodList, BeeShopList, SumShopList, IgnoreWeatherList, EggsList, GearsSeedsList, ZenList]
	for k, SettingCategory in SettingCategoryList {
		for ka, SettingName in ListList[k] {
			SettingName := StrReplace(SettingName," ")
			SettingNameTemp := SettingName . "Check"
			IniWrite(SaveData[SettingNameTemp], iniFile, SettingCategory, SettingName)
		}
	}
	return
}
; === Close Script ===
CloseScript:
ExitApp()
return

; === Load Button ===
LoadMacro(A_GuiEvent := "", GuiCtrlObj := "", Info := "", *)
{
	global
	SaveSettings()
	MacroState := 1
	IniWrite(MacroState, iniFile, "Settings", "MacroState")
	LoadGuiActive()
	return
}

Donate100(A_GuiEvent := "", GuiCtrlObj := "", Info := "", *)
{
	global
    Run("https://0/1233344338/100")
	return
}

Donate250(A_GuiEvent := "", GuiCtrlObj := "", Info := "", *)
{
	global
    Run("")
	return
}

Donate500(A_GuiEvent := "", GuiCtrlObj := "", Info := "", *)
{
	global
    Run("https://0/1233422254/500")
	return
}

Donate1000(A_GuiEvent := "", GuiCtrlObj := "", Info := "", *)
{
	global
    Run("https://0/1232959223/1000")
	return
}

Donate2500(A_GuiEvent := "", GuiCtrlObj := "", Info := "", *)
{
	global
    Run("https://0/1233142940/2500")
	return
}

Donate5000(A_GuiEvent := "", GuiCtrlObj := "", Info := "", *)
{
	global
    Run("https://0/1233083165/5000")
	return
}

Donate10000(A_GuiEvent := "", GuiCtrlObj := "", Info := "", *)
{
	global
    Run("https://0/1232566215/10000")
	return
	
	
	; === Handle GUI Close ===
}
GuiClose(*)
{
	global
    msgResult := MsgBox("Are you sure you want to exit the macro?", "Exit Macro", 4)
    if (msgResult = "Yes")
    {
        ExitApp()
	}
    ; If No, do nothing and keep the GUI open
	return
}

SeedPage(SeedPageNr){
	global
	HideAllSeedGear()
	Switch SeedPageNr {
		case 1:
		;always active
		GUIObjSeedsBox.Visible := 1
		GUIObjGearsBox.Visible := 1
		
		GUIObjCauliflowerCheck.Visible := 1
		GUIObjRafflesiaCheck.Visible := 1
		GUIObjGreenAppleCheck.Visible := 1
		GUIObjAvocadoCheck.Visible := 1
		GUIObjBananaCheck.Visible := 1
		GUIObjPineappleCheck.Visible := 1
		GUIObjKiwiCheck.Visible := 1
		GUIObjBellPepperCheck.Visible := 1
		GUIObjPricklyPearCheck.Visible := 1
		GUIObjLoquatCheck.Visible := 1
		GUIObjFeijoaCheck.Visible := 1
		GUIObjPitcherCheck.Visible := 1
		
		GUIObjCarrotCheck.Visible := 1
		GUIObjStrawberryCheck.Visible := 1
		GUIObjBlueberryCheck.Visible := 1
		GUIObjTomatoCheck.Visible := 1
		GUIObjWatermelonCheck.Visible := 1
		GUIObjSeedsBox.Visible := 1
		GUIObjGearsBox.Visible := 1
		GUIObjSugarAppleCheck.Visible := 1
		GUIObjOrangeCheck.Visible := 1
		GUIObjCornCheck.Visible := 1
		GUIObjDaffodilCheck.Visible := 1
		GUIObjPumpkinCheck.Visible := 1
		GUIObjAppleCheck.Visible := 1
		GUIObjBambooCheck.Visible := 1
		GUIObjCoconutCheck.Visible := 1
		GUIObjCactusCheck.Visible := 1
		GUIObjDragonCheck.Visible := 1
		GUIObjMangoCheck.Visible := 1
		GUIObjGrapeCheck.Visible := 1
		GUIObjMushroomCheck.Visible := 1
		GUIObjPepperCheck.Visible := 1
		GUIObjCacaoCheck.Visible := 1
		GUIObjBeanstalkCheck.Visible := 1
		GUIObjEmberLilyCheck.Visible := 1
		GUIObjBurningBudCheck.Visible := 1
		GUIObjGiantPineconeCheck.Visible := 1
		SeedCurrentPage := 1
		case 2:
		;always active
		GUIObjCarrotCheck.Visible := 1
		GUIObjStrawberryCheck.Visible := 1
		GUIObjBlueberryCheck.Visible := 1
		GUIObjTomatoCheck.Visible := 1
		GUIObjWatermelonCheck.Visible := 1
		GUIObjSeedsBox.Visible := 1
		GUIObjGearsBox.Visible := 1
		GUIObjSugarAppleCheck.Visible := 1
		GUIObjOrangeCheck.Visible := 1
		GUIObjCornCheck.Visible := 1
		GUIObjDaffodilCheck.Visible := 1
		GUIObjPumpkinCheck.Visible := 1
		GUIObjAppleCheck.Visible := 1
		GUIObjBambooCheck.Visible := 1
		GUIObjCoconutCheck.Visible := 1
		GUIObjCactusCheck.Visible := 1
		GUIObjDragonCheck.Visible := 1
		GUIObjMangoCheck.Visible := 1
		GUIObjGrapeCheck.Visible := 1
		GUIObjMushroomCheck.Visible := 1
		GUIObjPepperCheck.Visible := 1
		GUIObjCacaoCheck.Visible := 1
		GUIObjBeanstalkCheck.Visible := 1
		GUIObjEmberLilyCheck.Visible := 1
		GUIObjBurningBudCheck.Visible := 1
		GUIObjGiantPineconeCheck.Visible := 1
		
		GUIObjCauliflowerCheck.Visible := 1
		GUIObjRafflesiaCheck.Visible := 1
		GUIObjGreenAppleCheck.Visible := 1
		GUIObjAvocadoCheck.Visible := 1
		GUIObjBananaCheck.Visible := 1
		GUIObjPineappleCheck.Visible := 1
		GUIObjKiwiCheck.Visible := 1
		GUIObjBellPepperCheck.Visible := 1
		GUIObjPricklyPearCheck.Visible := 1
		GUIObjLoquatCheck.Visible := 1
		GUIObjFeijoaCheck.Visible := 1
		GUIObjPitcherCheck.Visible := 1
		
		SeedCurrentPage := 2
		default:
	}
}
EventPage(EventPageNr){
	global
	HideAllEvent()
	
	Switch EventPageNr {
		case 1:
		;page 1 (Zen and Galactic)
		GUIObjZenBox.Visible := 1
		GUIObjForceZenCheck.Visible := 1
		for k, GUIName in GUIObjZenEventShop {
			GUIName.Visible := 1
		}
		
		case 2:
		;page 2 (Summer and Prehistoric)
		GUIObjForcePrehistCheck.Visible := 1
		GUIObjPrehistShopCheck.Visible := 1
		GUIObjPrehistCraftOption.Visible := 1
		GUIObjPrehistInstantCraftCheck.Visible := 1
		GUIObjDinoEggCheck.Visible := 1
		GUIObjDinoPetText.Visible := 1
		GUIObjDinoPetEdit.Visible := 1
		GUIObjDinoCraftText.Visible := 1
		GUIObjPrehistBox.Visible := 1
		
		GUIObjForceSummerCheck.Visible := 1
		GUIObjSummerShopCheck.Visible := 1
		GUIObjSummerSeedCheck.Visible := 1
		GUIObjDelphiniumCheck.Visible := 1
		GUIObjLilyValleyCheck.Visible := 1
		GUIObjTravelerCheck.Visible := 1
		GUIObjSprayBurntCheck.Visible := 1
		GUIObjOasisCrateCheck.Visible := 1
		GUIObjOasisEggCheck.Visible := 1
		GUIObjHamsterCheck.Visible := 1
		GUIObjSumBox.Visible := 1
		EventCurrentPage := 2
		case 1:
		;page 2 (Bee and twilight)
		GUIObjForceNightCheck.Visible := 1
		GUIObjForceBeeCheck.Visible := 1
		GUIObjTwibloodCheck.Visible := 1
		GUIObjBloodCrateCheck.Visible := 1
		GUIObjTwilightCrateCheck.Visible := 1
		GUIObjNightEggCheck.Visible := 1
		GUIObjNightSeedCheck.Visible := 1
		GUIObjStarCallerCheck.Visible := 1
		GUIObjMoonMelonCheck.Visible := 1
		GUIObjBloodBananaCheck.Visible := 1
		GUIObjMoonMangoCheck.Visible := 1
		GUIObjCelestiberryCheck.Visible := 1
		GUIObjMoonCatCheck.Visible := 1
		GUIObjBloodHedgeCheck.Visible := 1
		GUIObjBloodKiwiCheck.Visible := 1
		GUIObjBloodOwlCheck.Visible := 1
		GUIObjBeeShopCheck.Visible := 1
		GUIObjFlowerSeedCheck.Visible := 1
		GUIObjLavenderCheck.Visible := 1
		GUIObjNectarshadeCheck.Visible := 1
		GUIObjNectarineCheck.Visible := 1
		GUIObjHiveFruitCheck.Visible := 1
		GUIObjPollenGunCheck.Visible := 1
		GUIObjNectarStaffCheck.Visible := 1
		GUIObjHoneySprinklerCheck.Visible := 1
		GUIObjBeeEggCheck.Visible := 1
		GUIObjBeeCrateCheck.Visible := 1
		GUIObjHoneyCombCheck.Visible := 1
		GUIObjBeeChairCheck.Visible := 1
		GUIObjHoneyTorchCheck.Visible := 1
		GUIObjHoneyWalkwayCheck.Visible := 1
		GUIObjBeeBox.Visible := 1
		GUIObjTwiBloodBox.Visible := 1
		EventCurrentPage := 3
		
		default:
		
	}
	return
}
HideAllSeedGear(*)
{
	global
	;always active
	GUIObjCarrotCheck.Visible := 0
	GUIObjStrawberryCheck.Visible := 0
	GUIObjBlueberryCheck.Visible := 0
	GUIObjTomatoCheck.Visible := 0
	GUIObjWatermelonCheck.Visible := 0
	GUIObjSeedsBox.Visible := 0
	GUIObjGearsBox.Visible := 0
	GUIObjSugarAppleCheck.Visible := 0
	;summer plants (pg 1)
	GUIObjCauliflowerCheck.Visible := 0
	GUIObjRafflesiaCheck.Visible := 0
	GUIObjGreenAppleCheck.Visible := 0
	GUIObjAvocadoCheck.Visible := 0
	GUIObjBananaCheck.Visible := 0
	GUIObjPineappleCheck.Visible := 0
	GUIObjKiwiCheck.Visible := 0
	GUIObjBellPepperCheck.Visible := 0
	GUIObjPricklyPearCheck.Visible := 0
	GUIObjLoquatCheck.Visible := 0
	GUIObjFeijoaCheck.Visible := 0
	GUIObjPitcherCheck.Visible := 0
	; Normal plants (pg 2)
	GUIObjOrangeCheck.Visible := 0
	GUIObjCornCheck.Visible := 0
	GUIObjDaffodilCheck.Visible := 0
	GUIObjPumpkinCheck.Visible := 0
	GUIObjAppleCheck.Visible := 0
	GUIObjBambooCheck.Visible := 0
	GUIObjCoconutCheck.Visible := 0
	GUIObjCactusCheck.Visible := 0
	GUIObjDragonCheck.Visible := 0
	GUIObjMangoCheck.Visible := 0
	GUIObjGrapeCheck.Visible := 0
	GUIObjMushroomCheck.Visible := 0
	GUIObjPepperCheck.Visible := 0
	GUIObjCacaoCheck.Visible := 0
	GUIObjBeanstalkCheck.Visible := 0
	GUIObjEmberLilyCheck.Visible := 0
	GUIObjBurningBudCheck.Visible := 0
	GUIObjGiantPineconeCheck.Visible := 0
}
HideAllEvent(*)
{
	global
	GUIObjZenBox.Visible := 0
	GUIObjForceZenCheck.Visible := 0
	for k, GUIName in GUIObjZenEventShop {
		GUIName.Visible := 0
	}
	
	;page 1 (Summer and Prehistoric)
	GUIObjForcePrehistCheck.Visible := 0
	GUIObjPrehistShopCheck.Visible := 0
	GUIObjPrehistCraftOption.Visible := 0
	GUIObjDinoEggCheck.Visible := 0
	GUIObjDinoPetText.Visible := 0
	GUIObjDinoPetEdit.Visible := 0
	GUIObjDinoCraftText.Visible := 0
	GUIObjPrehistInstantCraftCheck.Visible := 0
	GUIObjPrehistBox.Visible := 0
	
	GUIObjForceSummerCheck.Visible := 0
	GUIObjSummerShopCheck.Visible := 0
	GUIObjSummerSeedCheck.Visible := 0
	GUIObjDelphiniumCheck.Visible := 0
	GUIObjLilyValleyCheck.Visible := 0
	GUIObjTravelerCheck.Visible := 0
	GUIObjSprayBurntCheck.Visible := 0
	GUIObjOasisCrateCheck.Visible := 0
	GUIObjOasisEggCheck.Visible := 0
	GUIObjHamsterCheck.Visible := 0
	GUIObjSumBox.Visible := 0
	;page 2 (Bee and twilight)
	GUIObjForceNightCheck.Visible := 0
	GUIObjForceBeeCheck.Visible := 0
	GUIObjTwibloodCheck.Visible := 0
	GUIObjBloodCrateCheck.Visible := 0
	GUIObjTwilightCrateCheck.Visible := 0
	GUIObjNightEggCheck.Visible := 0
	GUIObjNightSeedCheck.Visible := 0
	GUIObjStarCallerCheck.Visible := 0
	GUIObjMoonMelonCheck.Visible := 0
	GUIObjBloodBananaCheck.Visible := 0
	GUIObjMoonMangoCheck.Visible := 0
	GUIObjCelestiberryCheck.Visible := 0
	GUIObjMoonCatCheck.Visible := 0
	GUIObjBloodHedgeCheck.Visible := 0
	GUIObjBloodKiwiCheck.Visible := 0
	GUIObjBloodOwlCheck.Visible := 0
	GUIObjBeeShopCheck.Visible := 0
	GUIObjFlowerSeedCheck.Visible := 0
	GUIObjLavenderCheck.Visible := 0
	GUIObjNectarshadeCheck.Visible := 0
	GUIObjNectarineCheck.Visible := 0
	GUIObjHiveFruitCheck.Visible := 0
	GUIObjPollenGunCheck.Visible := 0
	GUIObjNectarStaffCheck.Visible := 0
	GUIObjHoneySprinklerCheck.Visible := 0
	GUIObjBeeEggCheck.Visible := 0
	GUIObjBeeCrateCheck.Visible := 0
	GUIObjHoneyCombCheck.Visible := 0
	GUIObjBeeChairCheck.Visible := 0
	GUIObjHoneyTorchCheck.Visible := 0
	GUIObjHoneyWalkwayCheck.Visible := 0
	GUIObjBeeBox.Visible := 0
	GUIObjTwiBloodBox.Visible := 0
}
PageChange(LOrR, PageType, *){
	global
	Switch PageType {
		case "Seed":
		if (TravelEnabled) {
			
			} else {
			MaxPage := 2
			if (LOrR) {
				SeedPrevious := SeedCurrentPage
				if ((SeedCurrentPage + 1) > MaxPage) {
					SeedCurrentPage := 1
					} else {
					SeedCurrentPage++
				}
				SeedPage(SeedCurrentPage)
				} else {
				SeedPrevious := SeedCurrentPage
				if ((SeedCurrentPage - 1) < 1) {
					SeedCurrentPage := MaxPage
					} else {
					SeedCurrentPage--
				}
				SeedPage(SeedCurrentPage)
			}
		}
		case "Event":
		if (CraftEnabled){
			
			} else {
			MaxPage := 2
			if (LOrR) {
				if ((EventCurrentPage + 1) > MaxPage) {
					EventCurrentPage := 1
					} else {
					EventCurrentPage++
				}
				EventPage(EventCurrentPage)
				} else {
				if ((EventCurrentPage - 1) < 1) {
					EventCurrentPage := MaxPage
					} else {
					EventCurrentPage--
				}
				EventPage(EventCurrentPage)
			}
		}
	}
}
EnableSpecialTab(MainPage, *)
{
	global
	if (MainPage = 0) {
		if (CraftEnabled) {
			GUIObjCraftAText.Visible := 0
			GUIObjCraftBText.Visible := 0
			GUIObjCraftAOption.Visible := 0
			GUIObjCraftBOption.Visible := 0
			GUIObjCraftInfoText.Visible := 0
			GUIObjCraftBox.Visible := 0
			GUIObjCraftInstantCheck.Visible := 0
			GUIObjMakeHoneyCheck.Visible := 0
			EventPage(EventCurrentPage)
			GUIObjIgnoreWeatherCheck.Visible := 1
			CraftEnabled := 0
			GUIObjButtonCraft.Text := "Switch to crafting"
			} else {
			GUIObjCraftAText.Visible := 1
			GUIObjCraftBText.Visible := 1
			GUIObjCraftAOption.Visible := 1
			GUIObjCraftBOption.Visible := 1
			GUIObjCraftInfoText.Visible := 1
			GUIObjCraftBox.Visible := 1
			GUIObjCraftInstantCheck.Visible := 1
			GUIObjMakeHoneyCheck.Visible := 1
			HideAllEvent()
			GUIObjIgnoreWeatherCheck.Visible := 0
			CraftEnabled := 1
			GUIObjButtonCraft.Text := "Switch to events"
		}
	}
	if (MainPage = 1) {
		if (TravelEnabled) {
			GUIObjSkyOpt1Check.Visible := 0
			GUIObjSkyOpt2Check.Visible := 0
			GUIObjSkyOpt3Check.Visible := 0
			GUIObjSkyBox.Visible := 0
			GUIObjSummerTravelActiveCheck.Visible := 0
			GUIObjSkyActiveCheck.Visible := 0
			GUIObjGnomeActiveCheck.Visible := 0
			GUIObjGnomeOpt1Check.Visible := 0
			GUIObjGnomeOpt2Check.Visible := 0
			GUIObjGnomeOpt3Check.Visible := 0
			GUIObjGnomeOpt4Check.Visible := 0
			GUIObjGnomeBox.Visible := 0
			GUIObjHoneyActiveCheck.Visible := 0
			GUIObjTravelFlowerSeedCheck.Visible := 0
			GUIObjTravelHoneySprinklerCheck.Visible := 0
			GUIObjTravelBeeEggCheck.Visible := 0
			GUIObjTravelHoneyCrateCheck.Visible := 0
			GUIObjTravelCrafterCrateCheck.Visible := 0
			SeedPage(SeedCurrentPage)
			TravelEnabled := 0
			GUIObjButtonTravel.Text := "Traveling Merchants"
			} else {
			GUIObjSkyOpt1Check.Visible := 1
			GUIObjSkyOpt2Check.Visible := 1
			GUIObjSkyOpt3Check.Visible := 1
			GUIObjSkyBox.Visible := 1
			GUIObjSummerTravelActiveCheck.Visible := 1
			GUIObjSkyActiveCheck.Visible := 1
			GUIObjGnomeActiveCheck.Visible := 1
			GUIObjGnomeOpt1Check.Visible := 1
			GUIObjGnomeOpt2Check.Visible := 1
			GUIObjGnomeOpt3Check.Visible := 1
			GUIObjGnomeOpt4Check.Visible := 1
			GUIObjHoneyActiveCheck.Visible := 1
			GUIObjTravelFlowerSeedCheck.Visible := 1
			GUIObjTravelHoneySprinklerCheck.Visible := 1
			GUIObjTravelBeeEggCheck.Visible := 1
			GUIObjTravelHoneyCrateCheck.Visible := 1
			GUIObjTravelCrafterCrateCheck.Visible := 1
			GUIObjGnomeBox.Visible := 1
			HideAllSeedGear()
			TravelEnabled := 1
			GUIObjButtonTravel.Text := "Normal shops"
		}
	}
}
SettingsMenuSwap(SettingsCategory, *)
{
	global
	
	HideAllSettings()
	Switch SettingsCategory {
		case 0:
		GUIObjSettingsBox.Text := "Settings Menu"
		GUIObjEssentialButton.Visible := 1
		GUIObjSpeedButton.Visible := 1
		GUIObjPreferenceButton.Visible := 1
		GUIObjAdvancedButton.Visible := 1
		case 1:
		;essential
		GUIObjSettingsBox.Text := "Essential Settings"
		GUIObjBackpackText.Visible := 1
		GUIObjInventoryKeyEdit.Visible := 1
		GUIObjUIText.Visible := 1
		GUIObjInterfaceButtonEdit.Visible := 1
		GUIObjBackButton.Visible := 1
		case 2:
		;speed
		GUIObjSettingsBox.Text := "Speed Settings"
		GUIObjSlowModeCheck.Visible := 1
		GUIObjMouseDelayText.Visible := 1
		GUIObjMouseDelayEdit.Visible := 1
		GUIObjKeyDelayText.Visible := 1
		GUIObjKeyDelayEdit.Visible := 1
		GUIObjGlobalDelayText.Visible := 1
		GUIObjGlobalDelayEdit.Visible := 1
		GUIObjBackButton.Visible := 1
		case 3:
		;preference
		GUIObjSettingsBox.Text := "Preference Settings"
		GUIObjBuyCapText.Visible := 1
		GUIObjBuyCapEdit.Visible := 1
		GUIObjAltBuyCheck.Visible := 1
		GUIObjAutoAlignCheck.Visible := 1
		GUIObjAutoAlignRecalText.Visible := 1
		GUIObjAutoAlignRecalEdit.Visible := 1
		GUIObjZoomLevelEdit.Visible := 1
		GUIObjZoomLevelText.Visible := 1
		GUIObjWrenchActiveCheck.Visible := 1
		GUIObjWrenchSlotEdit.Visible := 1
		GUIObjFailCountLimitText.Visible := 1
		GUIObjClassicShopInitCheck.Visible := 1
		GUIObjFailCountLimitEdit.Visible := 1
		GUIObjBackButton.Visible := 1
		case 4:
		;advanced
		GUIObjSettingsBox.Text := "Advanced Settings"
		GUIObjIgnoreErrorsCheck.Visible := 1
		GUIObjDebugModeCheck.Visible := 1
		GUIObjMovementFactorText.Visible := 1
		GUIObjMovementFactorEdit.Visible := 1
		GUIObjUIInitModeCheck.Visible := 1
		GUIObjBackButton.Visible := 1
	}
}

HideAllSettings(*)
{
	global
	GUIObjEssentialButton.Visible := 0
	GUIObjSpeedButton.Visible := 0
	GUIObjPreferenceButton.Visible := 0
	GUIObjAdvancedButton.Visible := 0
	GUIObjBackButton.Visible := 0
	GUIObjBackpackText.Visible := 0
	GUIObjInventoryKeyEdit.Visible := 0
	GUIObjUIText.Visible := 0
	GUIObjInterfaceButtonEdit.Visible := 0
	GUIObjBuyCapText.Visible := 0
	GUIObjBuyCapEdit.Visible := 0
	GUIObjAltBuyCheck.Visible := 0
	GUIObjSlowModeCheck.Visible := 0
	GUIObjIgnoreErrorsCheck.Visible := 0
	GUIObjDebugModeCheck.Visible := 0
	GUIObjMouseDelayText.Visible := 0
	GUIObjMouseDelayEdit.Visible := 0
	GUIObjKeyDelayText.Visible := 0
	GUIObjKeyDelayEdit.Visible := 0
	GUIObjGlobalDelayText.Visible := 0
	GUIObjGlobalDelayEdit.Visible := 0
	GUIObjAutoAlignCheck.Visible := 0
	GUIObjAutoAlignRecalText.Visible := 0
	GUIObjAutoAlignRecalEdit.Visible := 0
	GUIObjZoomLevelEdit.Visible := 0
	GUIObjZoomLevelText.Visible := 0
	GUIObjWrenchActiveCheck.Visible := 0
	GUIObjWrenchSlotEdit.Visible := 0
	GUIObjMovementFactorText.Visible := 0
	GUIObjMovementFactorEdit.Visible := 0
	GUIObjFailCountLimitText.Visible := 0
	GUIObjFailCountLimitEdit.Visible := 0
	GUIObjClassicShopInitCheck.Visible := 0
	GUIObjUIInitModeCheck.Visible := 0
}
