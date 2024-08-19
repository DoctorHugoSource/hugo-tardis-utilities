-- 2010 TARDIS

local T = {
	Base = "base",
	Name = "2010 TARDIS",
	ID = "tardis2010",
}

T.Interior = {
	Model = "models/doctorwho1200/copper/interior.mdl",
	Portal = {
		pos = Vector(305.963, 321.391, 9.79),
		ang = Angle(0, -102.642482, 0),
		width = 115,
		height = 200,
	},
	Fallback = {
		pos = Vector(301, 294, -34),
		ang = Angle(0, 90, 0)
	},
	ExitDistance = 1300,
	Light = {
		color = Color(255, 150, 50),
		pos = Vector(0, 0, 230),
		brightness = 5,

		warn_color = Color(255, 55, 55),
		warn_pos = Vector(0, 0, 230),
		warn_brightness = 5,
	},
	Lights = {
		console_inside = {
			color = Color(0, 255, 230),
			pos = Vector(0, 0, 35),
			brightness = 0.5,

			warn_color = Color(60, 0, 0),

			nopower = true,
			off_color = Color(0, 255, 230),
			off_pos = Vector(0, 0, 40),
			off_brightness = 0.2,

			off_warn_color = Color(60, 0, 0),
			off_warn_brightness = 0.2,
			off_warn_pos = Vector(0, 0, 45),
		},

		under_console = {
			color = Color(0, 255, 180),
			pos = Vector(0, 0, -60),
			brightness = 1.5,

			warn_color = Color(60, 0, 0),

			nopower = false,
		},
	},
	Lamps = {
		under_the_stairs = {
			color = Color(0, 255, 230),
			texture = "effects/flashlight/soft",
			fov = 169.09091186523,
			distance = 165.45454406738,
			brightness = 0.1,
			pos = Vector(329.0859375, -88.878295898438, 74.0126953125),
			ang = Angle(87.648414611816, 20.883867263794, 169.94299316406),
			nopower = true,

			off = {
				brightness = 0.4,
			},
			warn = {
				color = Color(255,0,0),
				brightness = 0.3,
			},
			off_warn = {
				color = Color(180,0,0),
				brightness = 0.3,
			},
		},

		under_the_console = {
			color = Color(0, 255, 180),
			texture = "effects/flashlight/soft",
			fov = 170,
			distance = 300,
			brightness = 0.25,
			pos = Vector(0, 0, -29.5),
			ang = Angle(90, 180, 180),
			nopower = true,

			warn = {
				color = Color(255,0,0)
			},
			off_warn = {
				color = Color(180,0,0)
			},
		},


		right_wall_front = {
			color = Color(255, 125, 35),
			texture = "effects/flashlight/soft",
			fov = 156.36363220215,
			distance = 661.45452880859,
			brightness = 0.75,
			pos = Vector(6.7666015625, 42.2294921875, 164.078125),
			ang = Angle(28.094324111938, 94.355094909668, -131.17744445801),
		},

		left_wall_front = {
			color = Color(255, 125, 35),
			texture = "effects/flashlight/soft",
			fov = 140,
			shadows = true,
			distance = 593.81817626953,
			brightness = 0.75,
			pos = Vector(36.8564453125, -35.8046875, 162.078125),
			ang = Angle(37.900814056396, -71.551132202148, -125.09094238281),
		},

		right_wall_behind_right = {
			color = Color(255, 75, 15),
			texture = "effects/flashlight/soft",
			fov = 152.72727966309,
			distance = 278.18182373047,
			brightness = 3.13,
			pos = Vector(120.0654296875, 340.57373046875, -15.4306640625),
			ang = Angle(-34.583518981934, 84.241966247559, -167.74044799805),
		},

		right_wall_behind_left = {
			color = Color(255, 75, 15),
			texture = "effects/flashlight/soft",
			fov = 114.54545593262,
			distance = 278.18182373047,
			brightness = 3.13,
			pos = Vector(-200.4365234375, 282.01977539063, -27.7734375),
			ang = Angle(-64.854331970215, 97.828582763672, 99.961730957031),
		},

		left_wall_behind_top = {
			color = Color(255, 30, 0),
			texture = "effects/flashlight/soft",
			fov = 149.09091186523,
			distance = 1044.7272949219,
			brightness = 1.5,
			pos = Vector(93.869140625, -285.302734375, 77.765625),
			ang = Angle(-57.673290252686, -70.594253540039, -167.64936828613),
		},

		front_wall = {
			color = Color(255, 30, 0),
			texture = "effects/flashlight/soft",
			fov = 154.54545593262,
			distance = 323.63635253906,
			brightness = 1.0454545021057,
			pos = Vector(150.6689453125, -75.748046875, 110.1337890625),
			ang = Angle(-6.397337436676, -10.224858283997, 132.53907775879),
		},

		behind_web = {
			color = Color(160, 25, 0),
			texture = "effects/flashlight/soft",
			fov = 100,
			distance = 774.18182373047,
			brightness = 7.5,
			pos = Vector(-283.8935546875, 110.646484375, 151.533203125),
			ang = Angle(72.317031860352, 159.0650177002, -39.073394775391),
		},

		entrance = {
			color = Color(200, 255, 255),
			texture = "effects/flashlight/soft",
			fov = 100,
			shadows = true,
			distance = 300,
			brightness = 1.50,
			pos = Vector(302.509, 300.799, 60.143),
			ang = Angle(76.530212402344, -109.5119934082, 59.944305419922),
		},
	},
	LightOverride = {
		basebrightness = 0.075,
		nopowerbrightness = 0.0001
	},
	Sounds = {
		Teleport = {}, -- uses exterior sounds if not specified
		Power = {
			On = "drmatt/tardis/power_on.wav",
			Off = "drmatt/tardis/power_off.wav"
		},
		SequenceOK = "drmatt/tardis/seq_ok.wav",
		SequenceFail = "drmatt/tardis/seq_bad.wav",
		Cloister = "drmatt/tardis/cloisterbell_loop.wav"
	},
	IdleSound = {{path = "doctorwho1200/copper/interior.wav", volume = 10}},
	Scanners = {
		{
			part = "tardis2010_bigscanner",
			mat = "models/doctorwho1200/copper/bigscanner",
			width = 1024,
			height = 1024,
			ang = Angle(0,0,0),
			fov = 90,
		},
	},
	Screens = {
		{
			pos = Vector(-7.25, -47.8, 79),
			ang = Angle(0, 0, 100),
			width = 237.75,
			height = 150,
			visgui_rows = 2
		}
	},
	ScreenDistance = 500,
	ScreensEnabled = false, // lag prevention
	Sequences = "tardis2010_sequences",

	Parts = {
		door = {
			model = "models/doctorwho1200/copper/doors.mdl",
			posoffset = Vector(6.0172, 0, -50.97),
			angoffset = Angle(0, 180, 0),
		},

		--Lights
		tardis2010_roundels 			= {},
		tardis2010_ceilinglights 		= {},
		tardis2010_lights 				= {},
		tardis2010_lightsgreen 			= {},
		tardis2010_lightsred 			= {},
		tardis2010_throttlelights 		= {},

		--Animated parts
		tardis2010_atomaccel 			= {},
		tardis2010_barometer 			= {},
		tardis2010_bigscanner 			= {},
		tardis2010_clock 				= {},
		tardis2010_counter 				= {},
		tardis2010_flipclock 			= {},
		tardis2010_gyrostab 			= {},
		tardis2010_meters 				= {},
		tardis2010_movingpart 			= {},
		tardis2010_recorder 			= {},
		tardis2010_timecolumn 			= {},

		--Static parts
		tardis2010_console 				= {},
		tardis2010_consolepipes 		= {},
		tardis2010_consolewires 		= {},
		tardis2010_controls1 			= {},
		tardis2010_controls2 			= {},
		tardis2010_controls3 			= {},
		tardis2010_controls4 			= {},
		tardis2010_controls5 			= {},
		tardis2010_controls6 			= {},
		tardis2010_doorframe 			= {},
		tardis2010_furniture 			= {},
		tardis2010_gramophone 			= {},
		tardis2010_monitor 				= {},
		tardis2010_pipes 				= {},
		tardis2010_rails 				= {},
		tardis2010_speedpad 			= {},
		tardis2010_telephone 			= {},

		--Corridors
		tardis2010_corridors1 				= {},
		tardis2010_corridors2 				= {},
		tardis2010_corridors3 				= {},
		tardis2010_corridordoors1 			= {},
		tardis2010_corridordoors2 			= {},
		tardis2010_corridordoors3 			= {},
		tardis2010_corridordoors4 			= {},
		tardis2010_corridordoors5 			= {},
		tardis2010_corridordoors6 			= {},
		tardis2010_corridordoors7 			= {},
		tardis2010_corridordoors8 			= {},
		tardis2010_corridordoors9 			= {},
		tardis2010_corridordoors10 			= {},
		tardis2010_corridordoors11 			= {},
		tardis2010_corridordoors12_static 	= {},
		tardis2010_corridordoors13 			= {},
		tardis2010_corridordoors14 			= {},
		tardis2010_corridordoors15_static	= {},

		--Controls
		tardis2010_bell 				= {},
		tardis2010_bluevalves 			= {},
		tardis2010_button1 				= {},
		tardis2010_crank1 				= {},
		tardis2010_crank3 				= {},
		tardis2010_dipstick1 			= {},
		tardis2010_dipstick2 			= {},
		tardis2010_lever1 				= {},
		tardis2010_pbm1 				= {},
		tardis2010_pbm2 				= {},
		tardis2010_pedal1 				= {},
		tardis2010_pedal2 				= {pos = Vector(0, 0, 0), ang = Angle(0, 180, 0)},
		tardis2010_pump1 				= {},
		tardis2010_pump2 				= {},
		tardis2010_qfm1 				= {},
		tardis2010_qfm3 				= {pos = Vector(0, 0, 0), ang = Angle(0, 120, 0)},
		tardis2010_qfm4 				= {pos = Vector(0, 0, 0), ang = Angle(0, 180, 0)},
		tardis2010_qfm5 				= {pos = Vector(0, 0, 0), ang = Angle(0, 240, 0)},
		tardis2010_regulators 			= {},
		tardis2010_safelock1 			= {},
		tardis2010_safelock2 			= {},
		tardis2010_safelock3 			= {},
		tardis2010_safelock4 			= {pos = Vector(0, 0, 0), ang = Angle(0, 120, 0)},
		tardis2010_stabilisers 			= {},
		tardis2010_steeringmech1 		= {},
		tardis2010_steeringmech2 		= {},
		tardis2010_steeringmech3 		= {},
		tardis2010_steeringmech4 		= {},
		tardis2010_steeringmech5 		= {},
		tardis2010_switch2 				= {},
		tardis2010_timespaceforwardback = {},
		tardis2010_toggles 				= {},
		tardis2010_valves 				= {},
		tardis2010_wibblylever 			= {},

		--Controls Functional
		tardis2010_button2 				= {},
		tardis2010_button3 				= {},
		tardis2010_controlbox1a 		= {},
		tardis2010_controlbox1b 		= {},
		tardis2010_controlbox2a 		= {},
		tardis2010_controlbox2b 		= {},
		tardis2010_crank2 				= {},
		tardis2010_directionalpointer 	= {},
		tardis2010_keyboard 			= {},
		tardis2010_lever2 				= {},
		tardis2010_lever3 				= {},
		tardis2010_plotter 				= {},
		tardis2010_qfm2 				= {pos = Vector(0, 0, 0), ang = Angle(0, 60, 0), },
		tardis2010_rotaryswitch 		= {},
		tardis2010_switch1				= {},
		tardis2010_throttle 			= {},
		tardis2010_typewriter 			= {},
		tardis2010_enginerelease 		= {},
		tardis2010_handbrake 			= {},

		tardis2010_screen_switch_hitbox	= {pos = Vector(0.254, -45.458, 66.828), ang = Angle(-3.444, 84.653, 2.604), },

		tardis2010_sonic_charger		= {pos = Vector(21.283, 36.728, 37.975), ang = Angle(25.987, 61.401, -0.863), scale = 2, },
	},
	TipSettings = {
		style = "classic",
		view_range_max = 70,
		view_range_min = 60,
		TextOverrides = {
			["Door Lock"] = "Doors security lock",
			["Fast Return Protocol"] = "Fast return",
			["Coordinates"] = "Programmable destination",
			["Engine Release"] = "Engine release lever",
			["Flight Mode"] = "Flight lever",
			["Anti-Gravs"] = "Anti-gravity control",
			["Power Switch"] = "Power lever",
			["Self-Repair"] = "Self-repair systems",
			["H.A.D.S."] = "Hostile action displacement system",
			["Door Switch"] = "Doors control",
			["Spin direction"] = "Directional pointer",
			["Destination Select"] = "Manual destination",

		},
	},
	PartTips = {

		--Animated parts
		tardis2010_atomaccel			= {pos = Vector(-19.9 , -34.5 , 43.1),		down = false,	right = true,	text = "Atom accelerator",						},
		tardis2010_gyrostab				= {pos = Vector(-17.3, 30, 45.7),			down = false,	right = false,	text = "Gyroscopic stabiliser",					},
		tardis2010_recorder				= {pos = Vector(33.3, 3, 46.4),				down = false,	right = true,	text = "Voice recorder", 						},

		--Static parts
		tardis2010_monitor				= {pos = Vector(-8.5, -46.4, 70),			down = true,	right = false,	text = "Scanner/menu", 							},
		tardis2010_speedpad				= {pos = Vector(33.1, -12.2, 46),			down = false,	right = false,	text = "Digital communication",					},
		tardis2010_telephone			= {pos = Vector(21.3, 1, 57.2),				down = false,	right = true,	text = "Analogue telephone", 					},

		--Controls
		tardis2010_timespaceforwardback = {pos = Vector(-37.7, -28.2, 41.4),		down = true,	right = true,	text = "Time and space forward/back control",	},
		tardis2010_wibblylever 			= {pos = Vector(-7.7, 40.4, 43.3),			down = true,	right = true,	text = "Wibbly lever", 							},

		--Controls Functional
		tardis2010_button2 				= {pos = Vector(-43.6, 18.2, 43.4),			down = true,	right = true,	text = "Dematerialisation circuit", 			},
		tardis2010_button3 				= {pos = Vector(-32.2, 11.8, 48.6),			down = false,	right = true,	},
		tardis2010_controlbox1a 		= {pos = Vector(32, 23, 47.8),				down = false,	right = false,	},
		tardis2010_controlbox1b 		= {pos = Vector(29.8, 25.9, 46.2),			down = true,	right = true, 	},
		tardis2010_controlbox2a 		= {pos = Vector(4.5, -44, 46.3),			down = false,	right = false,	},
		tardis2010_controlbox2b 		= {pos = Vector(7.5, -43.3, 44.2),			down = true,	right = true, 	},
		tardis2010_crank2 				= {pos = Vector(43.4, 31.8, 33.5),			down = false,	right = true,	},
		tardis2010_directionalpointer 	= {pos = Vector(-13.239, -22.873, 61.436),	down = true,	right = false,	},
		tardis2010_valves 				= {pos = Vector(-5.478, -18.736, 63.498),	down = false,	right = false,	},
		tardis2010_keyboard 			= {pos = Vector(-26.9, -46.7, 31.5),		down = false,	right = true,	},
		tardis2010_lever2 				= {pos = Vector(-38.6, 13.5, 45.7),			down = false,	right = true,	},
		tardis2010_lever3 				= {pos = Vector(11.11, -19.436, 55.76),		down = false,	right = true,	},
		tardis2010_plotter 				= {pos = Vector(7.8, 56.9, 35),				down = false,	right = false,	},
		tardis2010_regulators			= {pos = Vector(-22.176, -2.616, 51.9),		down = false,	right = false,	},
		tardis2010_rotaryswitch 		= {pos = Vector(-43.9, 32.5, 33.2),			down = false,	right = false,	},
		tardis2010_switch1 				= {pos = Vector(12, 44.7, 40),				down = false,	right = false,	},
		tardis2010_throttle 			= {pos = Vector(-40.3, -11.6, 46.9),		down = true,	right = false,	},
		tardis2010_typewriter 			= {pos = Vector(45, 5, 40),					down = false,	right = false,	},
		tardis2010_switch2				= {pos = Vector(-5.578, -45.239, 41.876),	down = true,	right = false,	},
		tardis2010_enginerelease		= {pos = Vector(-8.6, 54.6, 32.1),			down = true,	right = true,	},
		tardis2010_handbrake			= {pos = Vector(-49.5 , -26.7 , 40),		down = false,	right = false,	},
		tardis2010_safelock4			= {pos = Vector(41.706, -29.978, 33.77),	down = true,	right = false,	},

		tardis2010_screen_switch_hitbox	= {pos = Vector(0.106, -47.167, 68.19),		down = true,	right = true,	},

		tardis2010_pbm2					= {pos = Vector(-12.781, -52.892, 34.58),	down = true,	right = true,	},
		tardis2010_safelock1			= {pos = Vector(44.264, -19.409, 39.883),	down = true,	right = true,	},
	},
	Controls = {
		tardis2010_button3 				= "fastreturn",
		tardis2010_controlbox1a 		= "flight",
		tardis2010_controlbox1b 		= "float",
		tardis2010_controlbox2a 		= "power",
		tardis2010_controlbox2b 		= "repair",
		tardis2010_crank2 				= "door",
		tardis2010_crank3 				= "door",
		tardis2010_switch1 				= "doorlock",
		tardis2010_keyboard 			= "destination",
		tardis2010_lever2 				= "vortex_flight",
		tardis2010_lever3 				= "cloak",
		tardis2010_plotter 				= "hads",
		tardis2010_rotaryswitch 		= "physlock",
		tardis2010_regulators			= "isomorphic",

		tardis2010_throttle 			= "teleport", -- overriden by control sequences
		tardis2010_typewriter 			= "coordinates",
		tardis2010_safelock4			= "redecorate",
		tardis2010_enginerelease		= "engine_release",
		tardis2010_handbrake			= "handbrake",
		tardis2010_switch2				= false, --"toggle_screens",
		tardis2010_directionalpointer	= "spin_switch",
		tardis2010_valves				= "spin_toggle",

		tardis2010_screen_switch_hitbox	= "toggle_screens",
		tardis2010_console				= "thirdperson_careful",

		tardis2010_safelock1			= "toggle_scanners",
		tardis2010_safelock2			= "tardis2010_animations",

		tardis2010_pbm2					= "random_coords",

		tardis2010_sonic_charger		= "sonic_dispenser",

	},
	Seats = {
		{pos = Vector(112, 45, 15), ang = Angle(0, 125, 15)},
		{pos = Vector(117, -84, 15), ang = Angle(0, 25, 5)}
	},
}

local sonic_exists_2010 = file.Exists("models/doctorwho1200/sonics/11thdoctor/3rdpersonsonic.mdl", "GAME")

if sonic_exists_2010 then
	T.Interior.Parts.tardis2010_sonic = {
		pos = Vector(18.344, 34.863, 40.48),
		ang = Angle(11.672, 29.511, -7.47),
	}
	T.Interior.Controls.tardis2010_sonic = "tardis2010_sonic_dispenser"
	T.Interior.Controls.tardis2010_sonic_charger = "tardis2010_sonic_dispenser"
end

T.Exterior = {
	Model = "models/doctorwho1200/copper/exterior.mdl",
	Mass = 2900,
	Portal = {
		pos = Vector(32.732, 0, 51),
		ang = Angle(0, 0, 0),
		width = 45,
		height = 89.99,
		thickness = 25,
		inverted = true,
	},
	Fallback = {
		pos = Vector(60,0,7),
		ang = Angle(0,0,0)
	},
	Light = {
		enabled = true,
		pos = Vector(0, 0, 122),
		color = Color(255, 245, 210),
		dynamicpos = Vector(0, 0, 122),
		dynamicbrightness = 1,
		dynamicsize = 150
	},
	ProjectedLight = {
		--color=Color(r,g,b),					--Base color. Will use main interior light if not set.
		--warncolor=Color(r,g,b),				--Warning color. Will use main interior warn color if not set.
		brightness = 0.1,						--Light's brightness
		--vertfov=90,							--vertical
		--horizfov=90,							--and horizontal field of view of the light. Will default to portal height and width.
		farz = 750,								--FarZ property of the light. Determines how far the light projects.
		offset = Vector(-15, 0, 50),			--Offset from box origin
		texture = "effects/flashlight/square"	--Texture the projected light will use. You can get these from the Lamp tool.
	},
	Sounds = {
		Teleport = {
			demat = "drmatt/tardis/demat.wav",
			mat = "drmatt/tardis/mat.wav",
			fullflight = "drmatt/tardis/full.wav"
		},
		RepairFinish = "drmatt/tardis/repairfinish.wav",
		Lock = "drmatt/tardis/lock.wav",
		Door = {
			enabled = true,
			open = "vtalanov98/tardis2010/door_open.wav",
			close = "vtalanov98/tardis2010/door_close.wav"
		},
		FlightLoop = "drmatt/tardis/flight_loop.wav"
	},
	Teleport = {
		SequenceSpeed = 0.77,
		SequenceSpeedFast = 0.935,
		DematSequence = {
			150,
			200,
			100,
			150,
			50,
			100,
			0
		},
		MatSequence = {
			100,
			50,
			150,
			100,
			200,
			150,
			255
		}
	},
	Parts = {
		vortex = {
			model = "models/doctorwho1200/copper/2010timevortex.mdl",
			pos = Vector(0,0,50),
			ang = Angle(0,0,0),
			scale = 10
		},
		door = {
			model = "models/doctorwho1200/copper/doorsext.mdl",
			posoffset = Vector(-6.0172, 0, -50.97),
			angoffset = Angle(0, 0, 0)
		},
		stephelper = {pos = Vector(14,0,-0), ang = Angle(0, 0, 0), },
		stephelper2 = {pos = Vector(11,0,3.25), ang = Angle(0, 0, 0), },
		occluder = {
		pos = Vector(0,0,0),
		ang = Angle(0, 0, 0),
			},
		dooroccluder = {
		pos = Vector(0,0,0),
		ang = Angle(0, 0, 0),
			},
	},
	DoorAnimationTime = 0.45,
	ScannerOffset = Vector(25, 0, 50),
	WinterSkins = { 3 },
}

T.Interior.TextureSets = {
	["normal"] = {
		prefix = "models/doctorwho1200/copper/",
		{ "self", 2, "curvedwallroundel" },
		{ "self", 4, "curvedwall2" },
		{ "self", 10, "floor" },
		{ "self", 13, "metalparts", },
		{ "self", 19, "metalreflective", },
		{ "self", 21, "walls3", },
		{ "self", 24, "walls4", },
		{ "self", 25, "walls", },
		{ "self", 26, "walls2", },
		{ "self", 27, "doorsl", },
		{ "tardis2010_console", 17, "consoledetails", },
		{ "tardis2010_timecolumn", 5, "rotorrings" },
		{ "tardis2010_ceilinglights", "ceilinglights" },
		{ "tardis2010_lightsgreen", "greenlights" },
		{ "tardis2010_lightsred", "redlamp" },
	},
	["poweroff"] = {
		prefix = "models/doctorwho1200/copper/",
		{ "self", 2, "curvedwallroundel_off" },
		{ "self", 4, "curvedwall2" },
		{ "self", 10, "floor_a" },
		{ "self", 13, "metalparts_off", },
		{ "self", 19, "metalreflective_off", },
		{ "self", 21, "walls3_off", },
		{ "self", 24, "walls4_off", },
		{ "self", 25, "walls_off", },
		{ "self", 26, "walls2_off", },
		{ "self", 27, "doorsl_off", },
		{ "tardis2010_console", 17, "consoledetails_off", },
		{ "tardis2010_timecolumn", 5, "rotorrings_off" },
		{ "tardis2010_ceilinglights", "ceilinglightsoff" },
		{ "tardis2010_lightsgreen", "greenlights_off" },
		{ "tardis2010_lightsred", "redlamp" },
	},
	["warning"] = {
		prefix = "models/doctorwho1200/copper/",
		{ "self", 2, "curvedwallroundel_warning" },
		{ "self", 4, "curvedwall2_warning" },
		{ "self", 10, "floor" },
		{ "self", 13, "metalparts", },
		{ "self", 19, "metalreflective", },
		{ "self", 21, "walls3", },
		{ "self", 24, "walls4", },
		{ "self", 25, "walls", },
		{ "self", 26, "walls2", },
		{ "self", 27, "doorsl", },
		{ "tardis2010_console", 17, "consoledetails_warning", },
		{ "tardis2010_timecolumn", 5, "rotorrings" },
		{ "tardis2010_ceilinglights", "ceilinglights_warning" },
		{ "tardis2010_lightsgreen", "greenlights" },
		{ "tardis2010_lightsred", "redlampflash" },
	},
	["lights_normal"] = {
		prefix = "models/doctorwho1200/copper/",
		{ "tardis2010_lights", 0, "bluelampsl" },
		{ "tardis2010_lights", 1, "neonblue" },
		{ "tardis2010_lights", 2, "bulbcages" },
		{ "tardis2010_lights", 3, "lights" },
		{ "tardis2010_lights", 4, "lights_off" },
	},
	["lights_off"] = {
		prefix = "models/doctorwho1200/copper/",
		{ "tardis2010_lights", 0, "bluelamps_off" },
		{ "tardis2010_lights", 1, "neonblue" },
		{ "tardis2010_lights", 2, "bulbcages_off" },
		{ "tardis2010_lights", 3, "lights_off" },
		{ "tardis2010_lights", 4, "neonwhite" },
	},
	["lights_warning"] = {
		prefix = "models/doctorwho1200/copper/",
		{ "tardis2010_lights", 0, "bluelamps_off" },
		{ "tardis2010_lights", 1, "neonblue_warning" },
		{ "tardis2010_lights", 2, "bulbcages_warning" },
		{ "tardis2010_lights", 3, "lights_off" },
		{ "tardis2010_lights", 4, "lights_off" },
	},
	["lights_warning_off"] = {
		prefix = "models/doctorwho1200/copper/",
		{ "tardis2010_lights", 0, "bluelamps_off" },
		{ "tardis2010_lights", 1, "neonblue_warning" },
		{ "tardis2010_lights", 2, "bulbcages_warning" },
		{ "tardis2010_lights", 3, "lights_off" },
		{ "tardis2010_lights", 4, "lights_off" },
	},
}

local TEXTURE_UPDATE_DATA_IDS = {
	["power-state"] = true,
	["health-warning"] = true,
	["teleport"] = true,
	["vortex"] = true,
	["flight"] = true,
}

T.CustomHooks = {
	power_textures = {
		inthooks = {
			["PostInitialize"] = true,
			["PowerToggled"] = true,
			["HealthWarningToggled"] = true,
			["ScannersToggled"] = true,
			["PostScannersToggled"] = true,
		},
		func = function(ext, int)
			local power = ext:GetData("power-state")
			local warning = int:GetData("health-warning", false)

			local prefix = "models/doctorwho1200/copper/"
			local scanner = int:GetScannersOn()

			if not power then
				int:ApplyTextureSet("poweroff")
			elseif warning then
				int:ApplyTextureSet("warning")
			else
				int:ApplyTextureSet("normal")
			end

			if power then
				if warning then
					int:ApplyTextureSet("lights_warning")
				else
					int:ApplyTextureSet("lights_normal")
				end
			else
				if warning then
					int:ApplyTextureSet("lights_warning_off")
				else
					int:ApplyTextureSet("lights_off")
				end
			end

			if not power then
				int:ChangeTexture("tardis2010_bigscanner", "bigscanner_off", nil, prefix)
			elseif scanner then
				int:ChangeTexture("tardis2010_bigscanner", "!"..int.scanners[1].uid)
			elseif warning then
				int:ChangeTexture("tardis2010_bigscanner", "bigscanner_warning", nil, prefix)
			else
				int:ChangeTexture("tardis2010_bigscanner", "bigscanner", nil, prefix)
			end
		end,
	},
	travel_textures = {
		exthooks = {
			["DataChanged"] = true,
		},
		func = function(ext, int, data_id, data_value)
			if not TEXTURE_UPDATE_DATA_IDS[data_id] then return end

			local power = ext:GetData("power-state")
			local warning = ext:GetData("health-warning")
			local teleport = ext:GetData("teleport")
			local flight = ext:GetData("flight")
			local vortex = ext:GetData("vortex")

			local prefix = "models/doctorwho1200/copper/"
			local flipclock_texture, roundels_texture, throttle_texture, button1_texture

			if teleport or vortex then
				flipclock_texture = "flipclock"
			else
				flipclock_texture = "flipclockoff"
			end

			if not power then
				roundels_texture = "roundels_off"
			elseif (vortex or flight or teleport) then
				roundels_texture = "roundels"
			else
				roundels_texture = "roundels_on"
			end
			if power and warning then
				roundels_texture = roundels_texture .. "_warning"
			end

			local throttle_part = int:GetPart("tardis2010_throttle")
			if power and IsValid(throttle_part) and throttle_part:GetOn() then
				throttle_texture = "throttlelightson"
			else
				throttle_texture = "throttlelightsoff"
			end

			local button1_part = int:GetPart("tardis2010_button1")
			if power and IsValid(button1_part) and not button1_part:GetOn() then
				button1_texture = "redlampon"
			else
				button1_texture = "redlamp"
			end

			int:ChangeTexture("tardis2010_flipclock", flipclock_texture, nil, prefix)
			int:ChangeTexture("tardis2010_roundels", roundels_texture, nil, prefix)
			int:ChangeTexture("tardis2010_throttlelights", throttle_texture, nil, prefix)
			int:ChangeTexture("tardis2010_button1", 1, button1_texture, prefix)
		end,
	},
	parse_custom_settings = {
		inthooks = {
			["PostInitialize"] = true,
		},
		func = function(ext, int)
			local id = ext.metadata.ID
			local ply = ext:GetCreator()

			local disable_anim = TARDIS:GetCustomSetting(id, "disable_animations", ply)
			int:SetData("tardis2010_animations", (not disable_anim), true)
		end,
	},
	doorframe_skin = {
		exthooks = {
			["SkinChanged"] = true,
		},
		func = function(ext, int, i)
			local doorframe = int:GetPart("tardis2010_doorframe")
			if IsValid(doorframe) then
				doorframe:SetSkin(i)
			end
		end,
	},
}

T.CustomSettings = {
	interior_portals = {
		text = "Enable interior portals",
		value_type = "bool",
		value = true,
	},
	disable_animations = {
		text = "Disable animations",
		value_type = "bool",
		value = false,
	},
	disable_lights = {
		text = "Disable additional dynamic lights",
		value_type = "bool",
		value = false,
	},
	disable_lamps = {
		text = "Disable additional projected lights",
		value_type = "bool",
		value = false,
	},
	disable_corridors = {
		text = "Disable corridors",
		value_type = "bool",
		value = false,
	},
}

T.Templates = {
	tardis2010_intportals = {
		override = true,
		condition = function(id, ply, ent)
			return TARDIS:GetCustomSetting(id, "interior_portals", ply)
		end,
	},
	tardis2010_no_corridors = {
		override = true,
		condition = function(id, ply, ent)
			return TARDIS:GetCustomSetting(id, "disable_corridors", ply)
		end,
	},
	tardis2010_no_lights = {
		override = true,
		condition = function(id, ply, ent)
			return TARDIS:GetCustomSetting(id, "disable_lights", ply)
		end,
	},
	tardis2010_no_lamps = {
		override = true,
		condition = function(id, ply, ent)
			return TARDIS:GetCustomSetting(id, "disable_lamps", ply)
		end,
	},
}

TARDIS:AddInterior(T)
