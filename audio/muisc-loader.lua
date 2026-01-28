local LDA = require("__LDA-LIB__/init")
local LDAUtils = LDA.utils
local PATH = LDA.setBasePath("Workers-And-Resources-Soviet-Republic-OST")
local folderMusic = PATH .. "audio/"
-- local ambientMusic = Workers-And-Resources-Soviet-Republic-OST_ambient_music_config.value
-- local menuMusic = Workers-And-Resources-Soviet-Republic-OST_menu_music_config.value
-- utils.CreateBaseAmbientSound(nameTrack, track_type, volume, SpaceLocationID)
-- utils.CreateInterludeAmbientSound(nameTrack, volume, SpaceLocationID)
-- utils.CreateMenuAmbientSound(nameTrack, volume)

data:extend(
	{
		-- Workers & Resources Soviet Republic OST_Call Me Back
		LDAUtils.CreateInterludeAmbientSound(folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_Call_Me_Back")
	}
)
data:extend(
	{
		-- Workers & Resources Soviet Republic OST_Main Theme_Folk version
		LDAUtils.CreateInterludeAmbientSound(
			folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_Main_Theme_Folk_version"
		),
		-- Workers & Resources Soviet Republic OST_ Plan Filled_to_130%
		LDAUtils.CreateInterludeAmbientSound(folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_Plan_Filled_to_130%"),
		-- Workers & Resources Soviet Republic OST_ Sergey_electronic version
		LDAUtils.CreateInterludeAmbientSound(
			folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_Sergey_electronic_version"
		),
		-- Workers & Resources Soviet Republic OST_Svetlana
		LDAUtils.CreateInterludeAmbientSound(folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_Svetlana"),
		-- Workers & Resources Soviet Republic OST_1979's  Swing
		LDAUtils.CreateInterludeAmbientSound(folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_1979's_Swing"),
		-- Workers & Resources Soviet Republic OST_Anthem_of_Soviet Republic
		LDAUtils.CreateInterludeAmbientSound(
			folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_Anthem_of_Soviet_Republic"
		),
		-- Workers & Resources Soviet Republic OST_Better_Tomorrow
		LDAUtils.CreateInterludeAmbientSound(folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_Better_Tomorrow"),
		-- Workers & Resources Soviet Republic OST_Black Eyes
		LDAUtils.CreateInterludeAmbientSound(folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_Black_Eyes"),
		-- Workers & Resources Soviet Republic OST_Don't_Touch_Us
		LDAUtils.CreateInterludeAmbientSound(folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_Don't_Touch_Us"),
		-- Workers & Resources Soviet Republic OST_Future Arrived to the Republic
		LDAUtils.CreateInterludeAmbientSound(
			folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_Future_Arrived_to_the_Republic"
		),
		-- Workers & Resources Soviet Republic OST_KRETCHMA
		LDAUtils.CreateInterludeAmbientSound(folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_KRETCHMA"),
		-- Workers & Resources Soviet Republic OST_Old Bolshevik
		LDAUtils.CreateInterludeAmbientSound(folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_Old_Bolshevik"),
		-- Workers & Resources Soviet Republic OST_Perestroika
		LDAUtils.CreateInterludeAmbientSound(folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_Perestroika"),
		-- Workers & Resources Soviet Republic OST_Sergey
		LDAUtils.CreateInterludeAmbientSound(folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_Sergey"),
		-- Workers & Resources Soviet Republic OST_Smychka
		LDAUtils.CreateInterludeAmbientSound(folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_Smychka"),
		-- Workers & Resources Soviet Republic OST_Songs of Harvesting
		LDAUtils.CreateInterludeAmbientSound(folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_Songs_of_Harvesting"),
		-- Workers & Resources Soviet Republic OST_Soviet_Cartoons
		LDAUtils.CreateInterludeAmbientSound(folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_Soviet_Cartoons"),
		-- Workers & Resources Soviet Republic OST_Soviet Dance Floor
		LDAUtils.CreateInterludeAmbientSound(folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_Soviet_Dance_Floor"),
		-- Workers & Resources Soviet Republic OST_Soviet_Electro
		LDAUtils.CreateInterludeAmbientSound(folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_Soviet_Electro"),
		-- Workers & Resources Soviet Republic OST_Soviet Republic's Army Choir
		LDAUtils.CreateInterludeAmbientSound(
			folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_Soviet_Republic's_Army_Choir"
		),
		-- Workers & Resources Soviet Republic OST_The_Glory_Of_Soviet_Union
		LDAUtils.CreateInterludeAmbientSound(
			folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_The_Glory_Of_Soviet_Union"
		),
		-- Workers & Resources Soviet Republic OST_The Rise of Metallurgy
		LDAUtils.CreateInterludeAmbientSound(
			folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_The_Rise_of_Metallurgy"
		),
		-- Workers & Resources Soviet Republic OST_The Ruska Roma
		LDAUtils.CreateInterludeAmbientSound(folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_The_Ruska_Roma"),
		-- Workers & Resources Soviet Republic OST_The Vodka Waltz
		LDAUtils.CreateInterludeAmbientSound(folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_The_Vodka_Waltz"),
		-- Workers & Resources Soviet Republic OST_Trojka
		LDAUtils.CreateInterludeAmbientSound(folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_Trojka"),
		-- Workers & Resources Soviet Republic OST_Worker's_March_Folk_version
		LDAUtils.CreateInterludeAmbientSound(
			folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_Worker's_March_Folk_version"
		),
		-- Workers & Resources Soviet Republic OST_Worker's March
		LDAUtils.CreateInterludeAmbientSound(folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_Worker's_March"),
		-- Workers & Resources Soviet Republic OST_Working_And_Singing
		LDAUtils.CreateInterludeAmbientSound(folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_Working_And_Singing"),
		-- Workers & Resources Soviet Republic OST_Working Class
		LDAUtils.CreateInterludeAmbientSound(folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_Working_Class"),
		-- Workers & Resources Soviet Republic OST_Working for the Leader
		LDAUtils.CreateInterludeAmbientSound(
			folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_Working_for_the_Leader"
		),
		-- Workers & Resources Soviet Republic OST-  Blue Scarf
		LDAUtils.CreateInterludeAmbientSound(folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_Blue_Scarf")
	}
)

data:extend(
	{
		-- Workers & Resources Soviet Republic OST_Main Theme
		LDAUtils.CreateMenuAmbientSound(folderMusic .. "Workers_and_Resources_Soviet_Republic_OST_Main_Theme")
	}
)
