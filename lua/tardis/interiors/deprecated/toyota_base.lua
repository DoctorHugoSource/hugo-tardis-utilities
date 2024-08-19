local T={
	ID="toyota_base",
	Base="base",
	Name = "Toyota - Blue 2013",
	Hidden = true,
}

T.Interior={
	Model="models/cem/toyota/interior_2013.mdl",
	Fallback={
		pos=Vector(-300,0,100),
		ang=Angle(0,0,0)
	},
	FloorLevel = 93.1,
	ExitDistance=650,
	LightOverride = {
		basebrightness = 0.0169,
		nopowerbrightness = 0.0025
	},
	Light={
		-- colors are defined in templates
		pos=Vector(0,0,110),
		brightness=0.5,
		nopower = false,
	},
	Lights={
		console_white = {
			-- colors are defined in templates
			pos=Vector(0,0,189.5),
			brightness=0.69,
		},
	},
--        WindowTint = {
--         Vortex = Color(0,5,10):ToVector(), --color for the window tint during vortex travel
--         TintMult = 3, --multiplier for window tint brightness
-- 		Windowmat = "models/tardisman/tardisman550/int_off_tint.vmt",
-- 		Frostmat = "models/tardisman/tardisman550/int_frost_tint.vmt",
-- 		mat1 = 1,
-- 		mat2 = 3,
-- 		mat3 = 13,
-- 		mat4 = 15,
--     },

	IdleSound={
		{
			path="cem/toyota/interior_idle_loop.wav",
			volume=1
		}
	},
	ScreensEnabled = false,
	Screens = {
		{
			visgui_rows = 3,
			power_off_black = false,
		},
	},
	Scanners = {
		{
			part = "toyota_monitor2",
			mat = "models/cem/toyota_smith/scannersmith1",
			width = 1024,
			height = 1024,
			ang = Angle(0,0,0),
			fov = 90,
		},
	},
	Seats={
		{
			pos=Vector(-145,-83,104),
			ang=Angle(0,-65,0)
		},
		{
			pos=Vector(9,-165,104),
			ang=Angle(0,0,0)
		},
		{
			pos=Vector(160,29,104),
			ang=Angle(0,100,0)
		},
		{
			pos=Vector(43,155,104),
			ang=Angle(0,170,0)
		}
	},
	Parts={
		console=false,
		toyota_console 				= {ang = Angle(0,90,0)},
		toyota_sonic_charger 		= {ang = Angle(0,90,0)},
		toyota_walls_upper			= {pos = Vector(0, 0, 0), ang = Angle(0,90,0)},
		toyota_walls_lower			= {pos = Vector(0, 0, 0), ang = Angle(0,90,0)},
		toyota_rotor_piston			= {},
		toyota_rotors 				= {},
		toyota_roundels 			= {},
		toyota_roundels2 			= {pos = Vector(0, 0, 0), ang = Angle(0,100,0),},
		toyota_roundels3 			= {pos = Vector(0, 0, 0), ang = Angle(0,-100,0),},
		toyota_roundelstone			= {},
		toyota_rails 				= {},
		toyota_glass				= {},
		toyota_console_details 		= {pos = Vector(0, 0, 0), ang = Angle(0,90,0)},
		toyota_console_side_details1 = {pos = Vector(0, 0, 0), ang = Angle(0,-0.07,0)},
		toyota_console_side_details2 = {pos = Vector(0, 0, 0), ang = Angle(0,198.97,0)},
		toyota_lights 				= {},
		toyota_lights1 				= {},
		toyota_lights2 				= {},
		toyota_neon_lights 			= {pos = Vector(0, 0, 0), ang = Angle(0,0,0)},
		toyota_lower_trim			= {},
		toyota_hull_struts			= {},
		toyota_gears				= {},
		toyota_key					= {},
		toyota_lights_catwalk_upper	= {},
		toyota_lights_floor			= {},
		toyota_handbrake			= {},
		toyota_balls				= {},
		toyota_buttons				= {},
		toyota_button				= {},
		toyota_button2				= {pos = Vector(0,9.4,0), ang = Angle(0,0,0)},
		toyota_crank				= {},
		toyota_crank2				= {},
		toyota_crank3				= {},
		toyota_crank4				= {},
		toyota_crank5				= {},
		toyota_crank6				= {},
		toyota_cranks				= {},
		toyota_cranks2				= {pos = Vector(0, 0, 0), ang = Angle(0,199,0)},
		toyota_flippers				= {},
		toyota_lever				= {},
		toyota_lever2				= {pos = Vector(0,26.55,0), ang = Angle(0,0,0)},
		toyota_lever3				= {},
		toyota_lever4				= {pos = Vector(0, 0, 0), ang = Angle(0,199,0)},
		toyota_lever5				= {},
		toyota_levers				= false,
		toyota_levers1				= {pos = Vector(31.2772, -6.47828, 134.362), ang = Angle(0,0,0)},
		toyota_levers2				= {pos = Vector(31.2772, -3.22899, 134.362), ang = Angle(0,0,0)},
		toyota_levers3				= {pos = Vector(31.2772, 0, 134.362), ang = Angle(0,0,0)},
		toyota_levers4				= {pos = Vector(31.2772, 3.23634, 134.362), ang = Angle(0,0,0)},
		toyota_levers5				= {pos = Vector(31.2772, 6.47268, 134.362), ang = Angle(0,0,0)},
		toyota_spin1				= {pos = Vector(-48.304, 9.401, 129.35), ang = Angle(0,0,0)},
		toyota_spin2				= {pos = Vector(-48.304, 4.707, 129.35), ang = Angle(0,0,0)},
		toyota_spin3				= {pos = Vector(-48.304, -0.009, 129.35), ang = Angle(0,0,0)},
		toyota_spin4				= {pos = Vector(-48.304, -4.644, 129.35), ang = Angle(0,0,0)},
		toyota_spin5				= {pos = Vector(-48.304, -9.453, 129.35), ang = Angle(0,0,0)},
		toyota_spin6				= {pos = Vector(-10.011, 45.859, 130.910), ang = Angle(0, -2.574, 0)},
		toyota_spin7				= {pos = Vector(-14.892, 46.776, 129.530), ang = Angle(-2.88, -7.877, 4.089)},
		toyota_spin8				= {pos = Vector(-33.016, 36.267, 129.530), ang = Angle(-4.679, -21.486, 4.023)},
		toyota_spin9				= {pos = Vector(-34.663, 31.617, 130.910), ang = Angle(1.556, 9.082, -1.378)},
		toyota_spin10				= {pos = Vector(33.5519, -30.4627, 130.518), ang = Angle(11.6955,-19.3464,-2)},
		toyota_spin11				= {pos = Vector(-39.865, -31.28, 129.931), ang = Angle(0, -4.62, 0)},
		toyota_spin12				= {pos = Vector(32.9344, -25.9602, 132.217), ang = Angle(0, -4.62, 0)},
		toyota_red_flick_cover		= {pos = Vector(46.8003, 20.3683, 130.056), ang = Angle(0,0,0)},
		toyota_red_flick_switch		= {pos = Vector(48.3763, 20.3791, 129.36), ang = Angle(0,0,0)},
		toyota_handle1				= {pos = Vector(-32.0253, -11.1286, 136.032), ang = Angle(33.87, 94.5, -24.402)},
		toyota_handle2				= {pos = Vector(-32.0253, 11.1286, 136.032), ang = Angle(0,0,0)},
		toyota_bouncy_lever			= {pos = Vector(37.6148, 12.5797, 134.562), ang = Angle(0,0,0)},
		toyota_ducks				= {pos = Vector(0,0,0), ang = Angle(0,0,0)},
		toyota_fiddle1				= {pos = Vector(-47.8258,20.3926,128.359), ang = Angle(0,0,0)},
		toyota_fiddle2				= {pos = Vector(-47.8258, 17.3307,128.359), ang = Angle(0,0,0)},
		toyota_phone				= {},
		toyota_rooms				= {},
		toyota_intdoors				= {},
		toyota_keyboard				= {},
		toyota_audio_system			= {},
		toyota_console_scanner		= {},
		toyota_sliders				= {},
		toyota_switch				= {},
		toyota_switch2				= {},
		toyota_flat_switch_1		= {pos = Vector(-10.1897,28.1115,137.23), ang = Angle(0,0,0)},
		toyota_flat_switch_2		= {pos = Vector(-11.3625,27.4343,137.23), ang = Angle(0,0,0)},
		toyota_flat_switch_3		= {pos = Vector(-12.5354,26.7572,137.23), ang = Angle(0,0,0)},
		toyota_flat_switch_4		= {pos = Vector(-16.7892,24.3012,137.23), ang = Angle(0,0,0)},
		toyota_flat_switch_5		= {pos = Vector(-17.9621,23.6241,137.23), ang = Angle(0,0,0)},
		toyota_flat_switch_6		= {pos = Vector(-19.135,22.9469,137.23), ang = Angle(0,0,0)},
		toyota_small_switch_1		= {pos = Vector(-43.5688,9.2562,129.997), ang = Angle(0,0,0)},
		toyota_small_switch_2		= {pos = Vector(-43.5688,8.45203,129.997), ang = Angle(0,0,0)},
		toyota_small_switch_3		= {pos = Vector(-43.5688,7.64787,129.997), ang = Angle(0,0,0)},
		toyota_small_switch_4		= {pos = Vector(-43.5688,6.84371,129.997), ang = Angle(0,0,0)},
		toyota_small_switch_5		= {pos = Vector(-43.5688,6.03954,129.997), ang = Angle(0,0,0)},
		toyota_small_switch_6		= {pos = Vector(-43.5688,-2.63501,129.997), ang = Angle(0,0,0)},
		toyota_small_switch_7		= {pos = Vector(-43.5688,5.23538,129.997), ang = Angle(0,0,0)},
		toyota_small_switch_8		= {pos = Vector(-43.5688,4.43121,129.997), ang = Angle(0,0,0)},
		toyota_small_switch_9		= {pos = Vector(-43.5688,3.62705,129.997), ang = Angle(0,0,0)},
		toyota_small_switch_10		= {pos = Vector(-43.5688,2.82289,129.997), ang = Angle(0,0,0)},
		toyota_small_switch_11		= {pos = Vector(-43.5688,-3.43917,129.997), ang = Angle(0,0,0)},
		toyota_small_switch_12		= {pos = Vector(-43.5688,-4.24334,129.997), ang = Angle(0,0,0)},
		toyota_small_switch_13		= {pos = Vector(-43.5688,-5.0475,129.997), ang = Angle(0,0,0)},
		toyota_small_switch_14		= {pos = Vector(-43.5688,-5.85166,129.997), ang = Angle(0,0,0)},
		toyota_small_switch_15		= {pos = Vector(-43.5688,-6.65583,129.997), ang = Angle(0,0,0)},
		toyota_small_switch_16		= {pos = Vector(-43.5688,-7.45999,129.997), ang = Angle(0,0,0)},
		toyota_small_switch_17		= {pos = Vector(-43.5688,-8.26416,129.997), ang = Angle(0,0,0)},
		toyota_small_switch_18		= {pos = Vector(-43.5688,-9.06832,129.997), ang = Angle(0,0,0)},
		toyota_telepathic			= {},
		toyota_throttle				= {},
		toyota_toggles				= {},
		toyota_toggles2				= {},
		toyota_tumblers				= {},
		toyota_trim					= {},
		toyota_hitbox1				= {pos = Vector(6.27, -51.833, 127.407), ang = Angle(17.274, -45.918, 4.22), },
		toyota_hitbox2				= {pos = Vector(39.214, -28.694, 129.871),  ang = Angle(0, 34.32, 0), scale = 0.3, },
		toyota_doorframecover		= {pos = Vector(0,0,0), ang = Angle(0, -90, 0), },
		toyota_entry				= {pos = Vector(0,0,0), ang = Angle(0, 90, 0), },
		tardisfireexting			= {pos = Vector(125,165,37), ang = Angle(0, -30, 0), },
		chronoplasmicshell			= {matrixScale = Vector(20,20,20),},

	},
	PartTips = {
		toyota_throttle 		= {pos = Vector(44.891, 14.683, 132.679),	right = false,	down = true, },
		toyota_handbrake 		= {pos = Vector(46.248, -16.804, 131.436),	right = true,	down = true, },
		toyota_lever3 			= {pos = Vector(103.41, 121.655, 130.044),	right = true,	down = false, },
		toyota_audio_system		= {pos = Vector(25.339, -27.011, 134.427),	right = true,	down = false, },
		toyota_telepathic		= {pos = Vector(19.919, 35.908, 130.754),	right = true,	down = false, },
		toyota_console_scanner	= {pos = Vector(-24.497, 34.429, 130.864),	right = false,	down = false, },
		toyota_keyboard			= {pos = Vector(20.96, -43.773, 128.294),	right = true,	down = false, },
		toyota_crank4			= {pos = Vector(-34.917, -29.135, 132.425),	right = true,	down = true, },
		toyota_toggles			= {pos = Vector(39.523, 0.016, 133.705),	right = true,	down = false, },
		toyota_crank2			= {pos = Vector(-9.156, -47.859, 130.481),	right = true,	down = true, },
		toyota_crank3			= {pos = Vector(-6.948, -30.268, 137.647),	right = false,	down = false, },
		toyota_lever4 			= {pos = Vector(-59.115, -151.548, 126.17),	right = true,	down = false, },
		toyota_buttons			= {pos = Vector(10.193, -49.502, 128.582),	right = true,	down = true,  },
		toyota_switch2			= {pos = Vector(-35.645, 12.629, 135.094),	right = true,	down = true,  },
		toyota_switch			= {pos = Vector(-45.646, -17.836, 130.267),	right = true,	down = true,  },
		toyota_lever5			= {pos = Vector(-36.787, -13.688, 134.195),	right = true,	down = false, },
		toyota_crank5			= {pos = Vector(-24.084, 21.564, 136.681),	right = false,	down = false, },
		toyota_crank6			= {pos = Vector(-6.901, 31.399, 136.842),	right = false,	down = false, },
		toyota_crank			= {pos = Vector(30.237, -28.123, 132.312),	right = true,	down = true,  },
		toyota_spin12			= {pos = Vector(33.531, -25.783, 132.247),	right = true,	down = false,  },
		toyota_hitbox1			= {pos = Vector(6.577, -51.692, 128.632),	right = false,	down = true,  },
		toyota_tumblers			= {pos = Vector(35.573, -11.599, 134.216),	right = true,	down = false, },
		toyota_button2			= {pos = Vector(39.263, 4.64, 132.233),		right = true,	down = false, },
		toyota_button			= {pos = Vector(39.263, -4.64, 132.233),	right = false,	down = false, },
		toyota_handle2			= {pos = Vector(-33.066, 10.939, 137.381),	right = true,	down = false, },
		toyota_handle1			= {pos = Vector(-32.921, -10.81, 137.31),	right = false,	down = false, },
		toyota_red_flick_switch	= {pos = Vector(47.918, 20.722, 129.642),	right = true,	down = true, },
		toyota_bouncy_lever		= {pos = Vector(37.33, 12.944, 133.946),	right = true,	down = false, },
		toyota_lever			= {pos = Vector(-44.239, -12.951, 131.572),	right = true,	down = false, },
		toyota_lever2			= {pos = Vector(-44.051, 14.102, 131.376),	right = false,	down = false, },
		toyota_fiddle1			= {pos = Vector(-48.039, 20.423, 128.479),	right = false, 	down = true, },
		toyota_spin2			= {pos = Vector(-49.221, 4.594, 129.101),	right = true,	down = true, },
		toyota_spin8			= {pos = Vector(-32.958, 36.406, 129.314),	right = true,	down = true, },
		toyota_spin7			= {pos = Vector(-15.003, 46.519, 128.838),	right = true,	down = true, },
		toyota_spin11			= {pos = Vector(-40.013, -31.619, 130.98),	right = false,	down = true, },
		toyota_key				= {pos = Vector(-23.59, -20.837, 137.406),	right = true,	down = false, },
		tardisfireexting		=	{pos=Vector(125,165,63), text="Fire Extinguisher", right = false, down = false},
		toyota_fiddle2			= {pos = Vector(-48.039, 17.423, 128.479),	right = true, 	down = false, },
		toyota_lever5			= {pos = Vector(-39.239, -12.951, 135.572),	text="Box illumination", right = true, 	down = false, },
		toyota_gears			= {pos = Vector(-19.36, -33.05, 132.67),	text="Window Opacity", right = true, 	down = false, },

	},
	CustomTips = {
		{pos = Vector(-36.982, -151.084, 128.849),	down = true, right = false,	part = "toyota_audio_system", },
		{pos = Vector(-106.793, -119.792, 123.778),	down = true, right = true,	part = "toyota_audio_system", },
		{pos = Vector(88.949, 132.435, 125.284),	down = true, right = true,	part = "toyota_audio_system", },
		{pos = Vector(139.173, 77.856, 125.267),	down = true, right = true,	part = "toyota_audio_system", },
	},
	Controls = {
		toyota_throttle 		= "teleport_double",
		toyota_handbrake 		= "handbrake",
		toyota_lever3			= "engine_release",
		toyota_audio_system		= "music",
		toyota_crank 			= nil,
		toyota_telepathic 		= "destination",
		toyota_console_scanner	= "thirdperson",
		toyota_balls 			= "thirdperson",
		toyota_keyboard 		= "coordinates",
		toyota_crank4			= "repair",
		toyota_crank2 			= "power",
		toyota_crank3 			= "redecorate",
		toyota_lever4			= "physlock",
		toyota_buttons			= "isomorphic",
		toyota_switch 			= "door",
		toyota_switch2 			= "doorlock",
		toyota_crank6			= "cloak",
		toyota_crank5			= "spin_switch",
		toyota_tumblers			= "vortex_flight",
		toyota_button2			= "toggle_scanners",
		toyota_handle1			= "flight",
		toyota_handle2			= "float",
		toyota_red_flick_switch	= "fastreturn",
		toyota_hitbox2			= "toyota_easteregg_4",
		toyota_bouncy_lever		= "random_coords",
		toyota_fiddle1			= "random_coords",
		toyota_key				= "toggle_console",

		toyota_button			= "toyota_toggle_moving_screen",
		toyota_monitor1			= "toyota_toggle_screens_delayed",
		toyota_monitor1_hitbox	= "toyota_toggle_screens_delayed",
		toyota_monitor1_hitbox2	= "toyota_toggle_screens_delayed",
		toyota_monitor1_hitbox3	= "toyota_toggle_screens_delayed",
		toyota_monitor1_hitbox_b = "toyota_toggle_screens_delayed",
		toyota_monitor1_hitbox2_b = "toyota_toggle_screens_delayed",
		toyota_monitor1_hitbox3_b = "toyota_toggle_screens_delayed",
		toyota_sonic_charger	= "sonic_dispenser",

		toyota_spin8			= "spin_toggle",
		toyota_spin11			= "hads",

		toyota_lever			= "toyota_protocol",
		toyota_lever2			= "toyota_protocol",
		toyota_small_switch_11	= "toyota_power_special_toggle",

		toyota_spin6			= "toyota_easteregg_1",
		[TARDIS.ToyotaSoundControlSetting]	= "toyota_easteregg_2",
		[TARDIS.ToyotaSoundControlSetting2]	= "toyota_easteregg_3_toggle",
		toyota_small_switch_18	= "exterior_light",
		toyota_fiddle2			= "vortexswap",
		toyota_toggles			= "shields",


	},
	CustomHooks = {
		screens_condition = {
			"CanEnableScreens",
			function(self)
				local monitor = self:GetPart("toyota_monitor1")
				if not IsValid(monitor) then
					return false
				end
				if monitor:GetOn() then
					return false
				end
				if not self:GetData("toyota_screen_ui_allowed") then
					return false
				end
			end,
		},
	},
	Sounds={
		Teleport={
			demat="cem/toyota/demat.wav",
			mat="cem/toyota/mat.wav",
			fullflight = "cem/toyota/full.wav",
			demat_fail = "Poogie/toyota/others/demat_fail_2013.wav",
			interrupt = "drmatt/tardis/repairfinish.wav",
		},
		Power = {
			On = "Poogie/toyota/powerup2013.wav",
			Off = "Poogie/toyota/powerdown2013.wav"
		},
		Cloister = "Poogie/toyota/others/cloister_loop.wav",
	},
	TipSettings = {
		view_range_min = 40,
		view_range_max = 75,
		--style = "smith",
	},

}

T.Exterior={
	ScannerOffset = Vector(25,0,50),
	Sounds={
		Teleport = {
			demat_fail = "Poogie/toyota/others/demat_fail_2017_ext.wav",
			mat_damaged = "Poogie/toyota/mat/mat_damaged_2013.wav"
		},
		FlightLoop="cem/toyota/flight_loopext.wav",
		RepairFinish="cem/toyota/repairfinish.wav",
		Delete = "p00gie/tardis/base/tardis_delete.wav",
		Spawn = "drmatt/tardis/repairfinish.wav",
		Lock="cem/toyota/lock.wav",
		Cloak = "cem/toyota/cloak.wav",
		CloakOff = "cem/toyota/uncloak.wav",
	},
	Teleport={
		SequenceSpeed=0.62,
		SequenceSpeedFast=1,
	},
}

T.Interior.TextureSets = {
	initial_roundel_trim = {
		-- prefix is defined in templates
		{"toyota_lights_lower_roundels", 0, "roundel_trim"},
		{"toyota_lights_lower_roundels", 1, "roundel_trim_moving"},
		{"toyota_lights_lower_roundels", 2, "roundel_trim_warning"},
		{"toyota_lights_lower_roundels", 3, "roundel_trim_off"},
	},
	poweron = {
		prefix = "models/cem/toyota_smith/",
		{"self", 11, "interior_pipes"},
		{"self", 12, "rotorbottcap"},
		{"toyota_console", 0, "chairs"},
		{"toyota_console", 2, "lightsconsole"},

		{"toyota_books", 4, "lightsconsole"},

		{"toyota_entry", "entry"},
		{"toyota_entry_alt", 0, "entry"},
		{"toyota_console_side_details1", 0, 		"detailsm"},
		{"toyota_console_side_details2", 0, 		"detailsm"},
		{"toyota_upperconsolelights", 1, 		"lightsconsole"},
		{"toyota_monitor_ring", 2, 	"detailsm"},
		{"toyota_crank", 0, 		"detailsm"},
		{"toyota_crank2", 0, 		"detailsm"},
		{"toyota_crank3", 0, 		"detailsm"},
		{"toyota_crank5", 1, 		"detailsm"},
		{"toyota_crank6", 1, 		"detailsm"},
		{"toyota_cranks", 0, 		"detailsm"},
		{"toyota_cranks2", 0, 		"detailsm"},
		{"toyota_gears", 1, 		"detailsm"},
		{"toyota_handbrake", 0, 	"detailsm"},
		{"toyota_lever3", 1, 		"detailsm"},
		{"toyota_lever4", 1, 		"detailsm"},
		{"toyota_levers", 1, 		"detailsm"},
		{"toyota_levers1", 1, 		"detailsm"},
		{"toyota_levers2", 1, 		"detailsm"},
		{"toyota_levers3", 1, 		"detailsm"},
		{"toyota_levers4", 1, 		"detailsm"},
		{"toyota_levers5", 1, 		"detailsm"},
		{"toyota_monitor1", 1, 		"detailsm"},
		{"toyota_monitor1", 2, 		"monitorm"},
		{"toyota_monitor2", 1, 		"detailsm"},
		{"toyota_monitor2", 2, 		"monitorm"},
		{"toyota_red_flick_switch",	"redflickswitch"},
		{"toyota_sonic_charger", 1, "detailsm"},
		{"toyota_switch", 0, 		"detailsm"},
		{"toyota_throttle", 0, 		"detailsm"},
		{"toyota_throttle_2014", 0, "detailsm"},
		{"toyota_toggles2", 0, 		"detailsm"},
		{"toyota_tumblers", 1, 		"detailsm"},

		{"toyota_small_switch_1", 	"newswitches"},
		{"toyota_small_switch_2", 	"newswitches"},
		{"toyota_small_switch_3", 	"newswitches"},
		{"toyota_small_switch_4", 	"newswitches"},
		{"toyota_small_switch_5", 	"newswitches"},
		{"toyota_small_switch_6", 	"newswitches"},
		{"toyota_small_switch_7", 	"newswitches"},
		{"toyota_small_switch_8", 	"newswitches"},
		{"toyota_small_switch_9", 	"newswitches"},
		{"toyota_small_switch_10", 	"newswitches"},
		{"toyota_small_switch_11", 	"newswitches"},
		{"toyota_small_switch_12", 	"newswitches"},
		{"toyota_small_switch_13", 	"newswitches"},
		{"toyota_small_switch_14", 	"newswitches"},
		{"toyota_small_switch_15", 	"newswitches"},
		{"toyota_small_switch_16", 	"newswitches"},
		{"toyota_small_switch_17", 	"newswitches"},
		{"toyota_small_switch_18", 	"newswitches"},
		{"toyota_flat_switch_1", 	"newswitches"},
		{"toyota_flat_switch_2", 	"newswitches"},
		{"toyota_flat_switch_3", 	"newswitches"},
		{"toyota_flat_switch_4", 	"newswitches"},
		{"toyota_flat_switch_5", 	"newswitches"},
		{"toyota_flat_switch_6", 	"newswitches"},

		{"toyota_lights", 0, "neonlights"},
		{"toyota_lights", 1, "lightsconsole"},
		{"toyota_lights", 2, "red"},
		{"toyota_lights", 3, "purple"},

		{"toyota_rotors", 0, "rotorlights"},

		{"toyota_rails", 1, "railsm"},

		{"toyota_hull_struts", 1, "hullstrutsm"},

		{"toyota_trim", 0, "trim"},
		{"toyota_lower_trim", 0, "trimlower"},

		{"toyota_monitor_ring", 0, "rotor"},

		{ "toyota_console_scanner", 0, "screen" },

		{ "intdoor", 1, "roundelstone" },
		{ "intdoor", 2, "roundels" },
		{ "intdoor", 3, "trim" },
		{ "intdoor", 4, "wallssmith" },
	},
	poweroff = {
		base = "poweron",
		prefix = "models/cem/toyota_smith/off/",
	},


	normal = {
		prefix = "models/cem/toyota_smith/",
		[1] = {"self", 2, "ceilingl_a"},
		[2] = {"self", 3, "ceilingl_b"},
		[3] = {"self", 4, "ceilingl_c"},
		[4] = {"self", 5, "ceilingl_d"},
		[5] = {"self", 6, "ceilingl_e"},
		[6] = {"self", 7, "ceilingl_f"},
		[7] = {"self", 8, "ceilingl_g"},
		[8] = {"self", 9, "ceilingl_h"},
		[9] = {"self", 10, "ceilingl_i"},
		[10] = {"toyota_lights_catwalk_upper", "catwalklights"},
		[11] = {"toyota_lights_floor", "catwalklightsfloor"},
		[12] = {"toyota_roundelstone", "roundelstone"},
		[13] = {"toyota_telepathic", "telepathic"},
		[14] = {"toyota_lights_catwalk_lower", "catwalklightslow"},
		[15] = {"toyota_lights_lower_roundels", 0},
	},
	off = {
		base = "normal",
		prefix = "models/cem/toyota_smith/off/",
		[15] = {"toyota_lights_lower_roundels", 3},
	},
	warning = {
		base = "normal",
		prefix = "models/cem/toyota_smith/warning/",
		[15] = {"toyota_lights_lower_roundels", 2},
	},
	demat_catwalks_warning = {
		base = "normal",
		prefix = "models/cem/toyota_smith/demat_warning/",
		[15] = {"toyota_lights_lower_roundels", 1},
	},
	demat_catwalks = {
		base = "normal",
		prefix = "models/cem/toyota_smith/demat/",
		[15] = {"toyota_lights_lower_roundels", 1},
	},
	mat_catwalks = {
		base = "normal",
		prefix = "models/cem/toyota_smith/mat/",
		[15] = {"toyota_lights_lower_roundels", 0},
	},
	mat_catwalks_warning = {
		base = "normal",
		prefix = "models/cem/toyota_smith/mat_warning/",
		[15] = {"toyota_lights_lower_roundels", 2},
	},
	flight  = {
		base = "normal",
		prefix = "models/cem/toyota_smith/flight/",
		[15] = {"toyota_lights_lower_roundels", 1},
	},
	warning_flight = {
		base = "normal",
		prefix = "models/cem/toyota_smith/warning_flight/",
		[15] = {"toyota_lights_lower_roundels", 2},
	},


	poweron_specific = {
		{"toyota_console", 1, "console"},
		{"toyota_console", 3, 		"detailsm"},
		{"toyota_console", 4,	"details"},
		{"toyota_console_details", 1, 		"detailsm"},
		{"toyota_audio_system", 0,		"details"},
		{"toyota_keyboard", 0,		"details"},
		{"toyota_phone", 0,		"details"},

		{"toyota_walls_lower", "walls_lower"},
		{"toyota_walls_lower_roundels", "walls_lower_lit"},
		{"toyota_neon_lights", 0, "neon_mid"}, -- time rotor
		{"toyota_neon_lights", 1, "neon"},
		{"toyota_neon_lights", 2, "neon_outer"},
		{"toyota_floor", 0, "floor"},
		{"toyota_floor", 1, "mainfloor"},
		{"toyota_floor", 2, "lowerfloor"},
		{"toyota_floor", 3, "stairs"},
		{"toyota_floor", 5, "lowerfloorm"},

		{"toyota_floor_dotd_step", 0, "floor"},
		{"toyota_floor_dotd_step", 1, "mainfloor"},

		{"toyota_glass", 0, "glass"},
		{"toyota_glass", 2, "consoleglass"},
		{"toyota_glass", 3, "glass_green"},

		{"toyota_rotor_piston", 0, "caps"},
		{"toyota_rotor_piston", 1, "rotorglass"},
		{"toyota_rotor_piston", 2, "caps"},

		{"self", 13, "rotor"},
		{"self", 14, "rotorm"},

		{"toyota_lights1", 0, "lightsconsole1"},
		{"toyota_lights2", 0, "lightsconsole2"},

		{ "intdoor", 0, "lightsconsole1" },
	},
	poweroff_specific = {
		base = "poweron_specific",
	},
}

T.CustomHooks = {
	power_special_sequence = {
		exthooks = {
			["PowerToggled"] = true,
		},
		func = function(ext, int, on)
			local power_special = int:GetData("toyota_power_special")

			if not on and int:GetData("toyota_protocol") == TardisToyotaStopLightUpProtocol then
				if not int:GetData("flight") then
					int:SetData("power-lastflight", false)
				end
				TardisToyotaStopLightUpProtocol(int)
			end

			if on or not power_special then
				if int:GetData("toyota_protocol") == TardisToyotaLightUpProtocol then
					int:SetData("toyota_protocol", nil)
				end
				return
			end

			int:SetData("toyota_protocol", TardisToyotaLightUpProtocol)
		end,
	},
	screen_textures = {
		exthooks = {
			["PowerToggled"] = true,
			["HealthWarningToggled"] = true,
		},
		inthooks = {
			["PostInitialize"] = true,
			["ScannersToggled"] = true,
			["PostScannersToggled"] = true,
		},
		func = function(ext, int)
			local power = ext:GetData("power-state")
			local warning = ext:GetData("health-warning", false)
			local vortex = ext:GetData("vortex")
			local vortex_flight = not ext:GetData("demat-fast")
			local scanner = int:GetScannersOn()

			local prefix = int.metadata.ToyotaCustom.screen_material_prefix

			local function reapply_scanner_material(part_id)
				local part = int:GetPart(part_id)
				for k,v in ipairs(int.scanners) do
					if v.ent == part and v.submatid then
						part:SetSubMaterial(v.submatid, "!"..v.uid)
					end
				end
			end

			if not power or warning then
				int:ChangeTexture("toyota_monitor1", 3, "black", prefix)
			else
				int:ChangeTexture("toyota_monitor1", 3, "monitor_screen", prefix)
			end

			if not power then
				int:ChangeTexture("toyota_monitor2", 3, "black", prefix)
			elseif scanner then
				reapply_scanner_material("toyota_monitor2")
			elseif warning then
				int:ChangeTexture("toyota_monitor2", 3, "black", prefix)
			else
				int:ChangeTexture("toyota_monitor2", 3, "monitor_screen", prefix)
			end
		end,
	},
	initial_textures = {
		inthooks = {
			["PostInitialize"] = true,
		},
		func = function(ext, int)
			int:ApplyTextureSet("poweron")
			int:ApplyTextureSet("poweron_specific")
			int:ApplyTextureSet("normal")
			int:ApplyTextureSet("initial_roundel_trim")
		end,
	},
	float_toggle_warning = {
		exthooks = {
			["FloatToggled"] = true,
		},
		func = function(ext, int, on)
			if on then return end
			if not ext:GetData("health-warning") then return end

			ext:EmitSound("Poogie/toyota/others/float_drum.wav")
			if IsValid(int) then
				int:EmitSound("Poogie/toyota/others/float_drum.wav")
			end
		end,
	},
	monitors_rotation = {
		inthooks = {
			["PostInitialize"] = true,
		},
		func = function(ext, int)
			local m1 = int:GetPart("toyota_monitor1")
			local m2 = int:GetPart("toyota_monitor2")

			if not IsValid(m1) or not IsValid(m2) then return end

			local offset = 180 + math.random(-54, 54)
			m2:SetAngles(m1:GetAngles() + Angle(0, offset, 0))
		end,
	},
	power_textures = {
		exthooks = {
			["PowerToggled"] = true,
		},
		func = function(ext, int, on)
			int:ApplyTextureSet(on and "poweron" or "poweroff")
			int:ApplyTextureSet((on and "poweron" or "poweroff") .. "_specific")
		end,
	},
	doorframe_light = {
		exthooks = {
			["PowerToggled"] = true,
		},
		inthooks = {
			["PostInitialize"] = true,
		},
		func = function(ext, int)
			local power = ext:GetData("power-state")
			if power then
				int:ApplyTextureSet("doorframe_on")
			else
				int:ApplyTextureSet("doorframe_off")
			end
		end,
	},
	travel_textures = {
		exthooks = {
			["PostInitialize"] = true,
			["ToyotaTextureUpdate"] = true,
			["PowerToggled"] = true,
			["HealthWarningToggled"] = true,
			["DematStart"] = true,
			["MatStart"] = true,
			["PreMatStart"] = true,
			["StopDemat"] = true,
			["StopMat"] = true,
			["FlightToggled"] = true,
			["InterruptTeleport"] = true,
		},
		func = function(ext, int, data_id, data_value)
			if ext:GetData("redecorate_parent") ~= nil then return end

			local power = ext:GetData("power-state")
			local warning = ext:GetData("health-warning")
			local teleport = ext:GetData("teleport")
			local flight = ext:GetData("flight")
			local vortex = ext:GetData("vortex")
			local mat = ext:GetData("mat")
			local demat = ext:GetData("demat")

			if not power then
				int:ApplyTextureSet("off")

			elseif demat and not vortex and not ext:GetData("toyota_catwalks_demat_done") then

				ext:SetData("toyota_catwalks_demat_done", true, true)
				int:ApplyTextureSet(warning and "demat_catwalks_warning" or "demat_catwalks")

				int:Timer("toyota_catwalks", ext.metadata.ToyotaCustom.demat_cw_delay or 3, function()
					ext:CallHook("ToyotaTextureUpdate", "toyota_texture_update")
				end)

			elseif mat and not int:GetData("toyota_catwalks_mat_required") then
				int:SetData("toyota_catwalks_mat_required", true)

			elseif not mat and int:GetData("toyota_catwalks_mat_required") then
				int:SetData("toyota_catwalks_mat_required", nil)
				int:ApplyTextureSet(warning and "mat_catwalks_warning" or "mat_catwalks")

				int:Timer( "toyota_catwalks", ext.metadata.ToyotaCustom.mat_cw_delay or 2.2, function()
					ext:CallHook("ToyotaTextureUpdate", "toyota_texture_update")
				end )

			elseif flight or vortex or teleport then
				int:ApplyTextureSet(warning and "warning_flight" or "flight")

			elseif not int:GetData("toyota_catwalks_mat_required") then
				int:ApplyTextureSet(warning and "warning" or "normal")
			end

			if vortex and not demat then
			if not int:GetData("spawn_in_vortex") then
				int:Timer("toyota_catwalks_demat_reset", 0.1, function()
					int:SetData("toyota_catwalks_demat_done", nil, true);
				end)
				end
			end
		end,
	},
	travel_textures_reset_data = {
		exthooks = {
			["InterruptTeleport"] = true,
			["StopMat"] = true,
		},
		func = function(ext, int)
			ext:SetData("toyota_catwalks_demat_done", nil, true);
		end,
	},
	initial_monitors_state = {
		exthooks = {
			["Initialize"] = true,
		},
		func = function(ext, int)
			ext:SetData("toyota_monitor1_on", (math.random(0, 1) == 1), true)
		end,
	},
	scanner_sound = {
		inthooks = {
			["ScannersToggled"] = true,
		},
		func = function(ext, int, on)
			if on then
				int:EmitSound("Poogie/toyota/controls/screen_beep1.wav")
			end
		end,
	},
}

TARDIS:AddInterior(T)
