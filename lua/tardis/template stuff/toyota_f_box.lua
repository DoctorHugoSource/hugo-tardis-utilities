
	-- Exterior = {



-- manually placed steps that will make walking in and out of a tardis smoother and more consistent

	-- 	Parts={

	-- 	stephelper = {pos = Vector(14,0,-0), ang = Angle(0, 0, 0), },
	-- 	stephelper2 = {pos = Vector(11,0,3.25), ang = Angle(0, 0, 0), },
	-- 	},







-- new sounds associated with the new teleport features

	-- 	Sounds = {

	-- Teleport = {

	-- 	mat_short = "hug o/tardis/default+/exterior/mat/reverb+volume_filter/mat_ext_s10+_enhanced_short2.ogg",
	-- 	mathop_demat = "hug o/tardis/default+/exterior/demat/reverb+volume_filter/demat_ext_mathop_enhanced.ogg",
	-- 	mathop_mat = "hug o/tardis/default+/exterior/mat/reverb+volume_filter/mat_ext_mathop_enhanced.ogg",
	-- },
	-- 	},



	-- new, visually optimized phasing sequences

	-- 	Teleport = {

	-- 		DematSequenceDelays = {
	-- 			[1] = 2.5
	-- 		},
	-- 		DematFastSequenceDelays = {
	-- 			[1] = 0.5
	-- 		},

	-- 		SequenceSpeed = {
	-- 		 Mat = 1.5,
	-- 		 Demat = 1.5,
	-- 		 },
	-- 		PrematDelay = 8.5,
	-- 		PrematDelayShort = 1,

	-- 		SequenceSpeedFast = 1.5,
	-- 		PrematSequenceDelayFast = 0.1,

	-- 		SequenceSpeedVeryFast = 2.8,
	-- 		PrematSequenceDelayVeryFast = 0.1,

	-- 		SequenceSpeedWarning = 1.5,
	-- 		SequenceSpeedWarnFast = 1.5,

	-- 		SequenceSpeedHads = 1.8,

	-- 		DematSequence = {
	-- 			192,
	-- 			250,
	-- 			129,
	-- 			200,
	-- 			85,
	-- 			160,
	-- 			17,
	-- 			90,
	-- 			0
	-- 		},
	-- 		MatSequence = {
	-- 			120,
	-- 			30,
	-- 			140,
	-- 			55,
	-- 			150,
	-- 			70,
	-- 			160,
	-- 			82,
	-- 			200,
	-- 		},
	-- 		DematSequenceFast = {
	-- 			192,
	-- 			250,
	-- 			129,
	-- 			200,
	-- 			85,
	-- 			160,
	-- 			0
	-- 		},
	-- 		MatSequenceFast = {
	-- 			150,
	-- 			70,
	-- 			160,
	-- 			82,
	-- 			200,
	-- 			255,		-- these have to be here because the base will 'overwrite' any extension's sequence that is shorter than the base
	-- 			255,
	-- 			255,
	-- 			255,
	-- 			255,
	-- 			255,
	-- 			255,
	-- 		},
	-- 		DematSequenceVeryFast = {
	-- 			255,
	-- 			0
	-- 		},
	-- 		MatSequenceVeryFast = {
	-- 			0,
	-- 			255
	-- 		},
	-- 		HadsDematSequence = {
	-- 			100,
	-- 			200,
	-- 			0
	-- 		},
	-- },
	-- },