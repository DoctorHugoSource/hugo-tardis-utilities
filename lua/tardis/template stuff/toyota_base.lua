
-- T.Interior={


-- new lowpower brightness variable

-- 	LightOverride = {
-- 		basebrightness = 0.0169,
-- 		nopowerbrightness = 0.0025,
-- 		lowpowerbrightness = 0.008
-- 	},




-- transducer cell spawn position, will not spawn without this

		-- TransducerCell = {
		-- position = Vector(17, 84, 10)  -- defines the position the transducer cell spawns in, relative to the main interior entity
		-- },                             -- protip: use the addon 'no more guessing' to easily get a vector relative to the interior entity




-- confirms the tardis has travel controls assigned to the console, this disables the fallback that assigns map travel functions to door lock, engine release, etc

-- 	Travelcontrols = true,  -- tells the extension that travel controls have been added manually and disables the ones embedded into existing controls (such as door lock enabling map travel)




-- new parts

-- 	Parts={

-- 		tardisfireexting			= {pos = Vector(125,165,37), ang = Angle(0, -30, 0), },
-- 		chronoplasmicshell			= {matrixScale = Vector(20,20,20),},

-- 	},



-- new part tips

-- 	PartTips = {

-- tardisfireexting		= {pos = Vector(125, 165, 63), 				text = "Fire Extinguisher", right = false, down = false},
-- toyota_fiddle2			= {pos = Vector(-48.039, 17.423, 128.479),	right = true, 	down = false, },
-- toyota_lever5			= {pos = Vector(-39.239, -12.951, 135.572),	text = "Box illumination", right = true, 	down = false, },
-- toyota_gears			= {pos = Vector(-19.36, -33.05, 132.67),	text = "Window Opacity", right = true, 	down = false, },
-- toyota_sliders			= {pos = Vector(14.47, -31.44, 134.92),		right = true, 	down = false, },
-- toyota_cranks2			= {pos = Vector(-24.18, -165.67, 130.53),	right = true, 	down = false, },
-- toyota_toggles2			= {pos = Vector(14.9, -25.97, 137.27),		right = true, 	down = false, },
-- toyota_flippers 		= {pos = Vector(-36.22, -0.07, 136.28),		right = true, 	down = false, },
-- toyota_levers2 			= {pos = Vector(29.86, -3.24, 137.54),		right = true, 	down = false, },
-- toyota_levers5			= {pos = Vector(29.74, 6.49, 137.65),		right = true, 	down = false, },
-- toyota_cranks			= {pos = Vector(76.89, 148.56, 130.77),		right = true, 	down = false, },
-- toyota_spin7			= {pos = Vector(-15.07, 47.02, 129.87),		right = true, 	down = false, },
-- toyota_ducks			= {pos = Vector(30.33, -30.84, 132.08),		right = false, 	down = false, },
-- toyota_levers3 			= {pos = Vector(29.86, 0, 137.54),			right = true, 	down = false, },

-- 	},


-- new controls

-- 	Controls = {
-- 		toyota_fiddle2			= "vortexswap",
	-- toyota_gears				= "windowopacity",
	-- toyota_sliders			= "maptravel",
	-- toyota_cranks2			= "returntobar",
	-- toyota_toggles2			= "randomjazzmap",
	-- toyota_flippers			= "manualmapdestination",
	-- toyota_levers2			= "hadssensitivity",
	-- toyota_levers5			= "mathop",
	-- toyota_cranks			= "mathop_shortcut",
	-- toyota_spin7				= "vortexdrift",
	-- toyota_ducks				= "multiloopstabiliser",
	-- toyota_levers3			= "fastvortexremat",
	-- toyota_levers4			= "timeswap"
-- 	},


-- }