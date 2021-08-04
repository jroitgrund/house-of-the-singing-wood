(
var birds1PanBus = Bus.control(s, 1);
var birds1AmpBus = Bus.control(s, 1);
var birds1LowPassBus = Bus.control(s, 1);
var birds1AmpOutBus = Bus.control(s, 1);

var birds2PanBus = Bus.control(s, 1);
var birds2AmpBus = Bus.control(s, 1);
var birds2LowPassBus = Bus.control(s, 1);
var birds2AmpOutBus = Bus.control(s, 1);

var frogPanBus = Bus.control(s, 1);
var frogAmpBus = Bus.control(s, 1);
var frogLowPassBus = Bus.control(s, 1);
var frogAmpOutBus = Bus.control(s, 1);

var gouttesPanBus = Bus.control(s, 1);
var gouttesAmpBus = Bus.control(s, 1);
var gouttesLowPassBus = Bus.control(s, 1);
var gouttesAmpOutBus = Bus.control(s, 1);

var melodiePanBus = Bus.control(s, 1);
var melodieAmpBus = Bus.control(s, 1);
var melodieLowPassBus = Bus.control(s, 1);
var melodieAmpOutBus = Bus.control(s, 1);

var owlNappePanBus = Bus.control(s, 1);
var owlNappeAmpBus = Bus.control(s, 1);
var owlNappeLowPassBus = Bus.control(s, 1);
var owlNappeAmpOutBus = Bus.control(s, 1);

var owlsPanBus = Bus.control(s, 1);
var owlsAmpBus = Bus.control(s, 1);
var owlsLowPassBus = Bus.control(s, 1);
var owlsAmpOutBus = Bus.control(s, 1);

var waterPanBus = Bus.control(s, 1);
var waterAmpBus = Bus.control(s, 1);
var waterLowPassBus = Bus.control(s, 1);
var waterAmpOutBus = Bus.control(s, 1);

var sirensPanBus = Bus.control(s, 1);
var sirensAmpBus = Bus.control(s, 1);
var sirensLowPassBus = Bus.control(s, 1);
var sirensAmpOutBus = Bus.control(s, 1);

var nappeBaleinePanBus = Bus.control(s, 1);
var nappeBaleineAmpBus = Bus.control(s, 1);
var nappeBaleineLowPassBus = Bus.control(s, 1);
var nappeBaleineAmpOutBus = Bus.control(s, 1);

~loadBiosphereBuffers = {
	~birds1Buffer = Buffer.readChannel(s, ~basePath ++ "Chapitre1 - Biosphere/Birds1.aif", action: ~loaded);
	~birds2Buffer = Buffer.readChannel(s, ~basePath ++ "Chapitre1 - Biosphere/Birds2.aif", action: ~loaded);
	~frogBuffers = [Buffer.readChannel(s, ~basePath ++ "Chapitre1 - Biosphere/Frog_1shot_Wrapped.aif", action: ~loaded)] ++ ~readContentsAsBuffers.value(~basePath + "Chapitre1 - Biosphere/frogs");
	~gouttesBuffer = Buffer.readChannel(s, ~basePath ++ "Chapitre1 - Biosphere/Gouttes.aif", action: ~loaded);
	~melodieBuffer = Buffer.readChannel(s, ~basePath ++ "Chapitre1 - Biosphere/Melodie_Wrapped.aif", action: ~loaded);
	~owlNappeBuffer = Buffer.readChannel(s, ~basePath ++ "Chapitre1 - Biosphere/OWL_1BAR.aif", action:~loaded);
	~owlNappeBuffers = ~readContentsAsBuffers.value(~basePath ++ "Chapitre1 - Biosphere/owlnappe");
	~owlNappeEndBuffers = ~readContentsAsBuffers.value(~basePath ++ "Chapitre1 - Biosphere/owlnappeend");
	~nappeBaleineBuffer = Buffer.readChannel(s, ~basePath ++ "Chapitre1 - Biosphere/nappe-baleines.wav", action:~loaded);
	~owlsBuffers = [
		Buffer.readChannel(s, ~basePath ++ "Chapitre1 - Biosphere/Owl-Sing1.aif", action: ~loaded),
		Buffer.readChannel(s, ~basePath ++ "Chapitre1 - Biosphere/Owl-Sing2.aif", action: ~loaded)
	] ++ ~readContentsAsBuffers.value(~basePath ++ "Chapitre1 - Biosphere/owls");
	~waterBuffer = Buffer.readChannel(s, ~basePath ++ "Chapitre1 - Biosphere/Water.aif", action: ~loaded);

	~sirensBuffers = ~readContentsAsBuffers.value(~basePath ++ "Chapitre1 - Biosphere/sirens");
};

// Plays birds1 and birds2, birds2 starts 4 bars after birds1 and they have separate pan and amp controls.
// They both fade in and out over 4 bars.
~birds = {
	| duration |
	Ppar([
        Pseq([Event.silent(16), Ppar([
                Pbind(
                    \dur, Pseq([duration - 16]),
                    \legato, 1,
                    \instrument, \play,
                    \buf, ~birds2Buffer,
                    \loop, 1,
                    \panBus, birds2PanBus,
                    \ampBus, birds2AmpBus,
					\loopAtk, 4,
					\loopSus, 40,
					\loopRel, 4
                ),
                Pbind(
                    \dur, Pseq([48], repeats: inf),
                    \legato, 1,
                    \instrument, Pif(Ptime() < (duration - 16), \panControl),
                    \freq, TempoClock.default.tempo / 32,
                    \iphase, Pwhite(0.0, 2.0, inf),
                    \controlBus, birds2PanBus,
                    \direction, Prand([1, -1], inf)
                ),
                Pbind(
                    \dur, Pseq([duration - 16]),
                    \legato, 1,
                    \instrument, \ampControl,
                    \atk, 16 / TempoClock.default.tempo,
                    \sus, (duration - 48) / TempoClock.default.tempo,
                    \rel, 16 / TempoClock.default.tempo,
                    \controlBus, birds2AmpBus
                )
            ])
        ]),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \play,
			\buf, ~birds1Buffer,
			\loop, 1,
			\panBus, birds1PanBus,
			\ampBus, birds1AmpBus,
			\loopAtk, 4,
			\loopSus, 24,
			\loopRel, 4
		),
		Pbind(
			\dur, Pseq([32], repeats: inf),
			\legato, 1,
			\instrument, Pif(Ptime() < duration, \panControl),
			\freq, TempoClock.default.tempo / 28,
			\iphase, Pwhite(0.0, 2.0, inf),
			\controlBus, birds1PanBus,
			\direction, Prand([1, -1], inf)
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \ampControl,
			\atk, 16 / TempoClock.default.tempo,
			\sus, (duration -  32) / TempoClock.default.tempo,
			\rel, 16 / TempoClock.default.tempo,
			\controlBus, birds1AmpBus
		),
	]);
};


// Long sample with fade in and fade out.
~gouttes = {
    | duration |
    Ppar([
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \play,
			\buf, ~gouttesBuffer,
			\loop, 1,
			\panBus, gouttesPanBus,
			\ampBus, gouttesAmpBus,
			\loopAtk, 16 / TempoClock.default.tempo,
			\loopSus, 0,
			\loopRel, 16 / TempoClock.default.tempo
		),
		Pbind(
			\dur, Pseq([32], repeats: inf),
			\legato, 1,
			\instrument, Pif(Ptime() < duration, \panControl),
			\freq, TempoClock.default.tempo / 12,
			\iphase, Pwhite(0.0, 2.0, inf),
			\controlBus, gouttesPanBus,
			\direction, Prand([1, -1], inf)
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \ampControl,
			\atk, 16 / TempoClock.default.tempo,
			\sus, (duration -  32) / TempoClock.default.tempo,
			\rel, 16 / TempoClock.default.tempo,
			\controlBus, gouttesAmpBus
		)
    ]);
};

~nappeBaleine = {
	| duration |
	Ppar([
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \play,
			\buf, ~nappeBaleineBuffer,
			\loop, 1,
			\panBus, nappeBaleinePanBus,
			\ampBus, nappeBaleineAmpBus
		),
		Pseq([Event.silent(6), Pbind(
			\dur, Pseq([
				8,
				7,
				5,
				44
			], inf),
			\type, \action,
			\pfunc, Pif(Ptime() < duration, Pfunc({
				// Run code to be triggered on baleine noises here.
				1
			})),
		)]),
		Pbind(
			\dur, Pseq([32], inf),
			\instrument, Pif(Ptime() < duration, \panControl),
			\legato, 1,
			\iphase, 0,
			\freq, TempoClock.default.tempo / 16,
			\controlBus, nappeBaleinePanBus,
			\direction, Prand([1, -1], inf)
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \ampControl,
			\atk, 16 / TempoClock.default.tempo,
			\sus, (duration -  32) / TempoClock.default.tempo,
			\rel, 16 / TempoClock.default.tempo,
			\controlBus, nappeBaleineAmpBus
		),
	]);
};

// Short samples, hard panned to one speaker. I tried to add delay here but
// this kept resulting in weird clicks so I gave up.
// Could be worth adding something to spice it up as the owl samples are just
// identical source material pitched up or down (and same as in ritual).
~owls = {
	| duration |
	Ppar([
		Pbind(
			\buf, Pxrand(~owlsBuffers, repeats: inf),
			\dur, Pwrand(
				[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].collect {
					| waitBeats |
					Pfuncn({
						| ev |
						(ev[\buf].duration * TempoClock.default.tempo).round(2) + waitBeats
					}, inf)
				},
				[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].normalizeSum),
			\legato, 1,
			\instrument, Pif(Ptime() < duration, \play),
			\hardPan, Pwhite(0.0, 2.0, inf),
            \lpfRq, 2,
			\gateRelease, 60,
            \ampBus, owlsAmpBus,
            \ampOutBus, owlsAmpOutBus
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \ampControl,
			\atk, 0,
			\sus, (duration -  16) / TempoClock.default.tempo,
			\rel, 16 / TempoClock.default.tempo,
			\controlBus, owlsAmpBus
		),
	]);
};

~sirens = {
	| duration |
	Ppar([
		Pbind(
			\buf, Pxrand(~sirensBuffers, repeats: inf),
			\dur, Prand(
				[8, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20].collect {
					| waitBeats |
					Pfuncn({
						| ev |
						(ev[\buf].duration * TempoClock.default.tempo).round(2) + waitBeats
					}, inf)
				}),
			\legato, 1,
			\instrument, Pif(Ptime() < duration, \play),
			\hardPan, Pwhite(0.0, 2.0, inf),
            \lpfRq, 2,
			\gateRelease, 60,
            \ampBus, owlsAmpBus,
            \ampOutBus, owlsAmpOutBus
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \ampControl,
			\atk, 0,
			\sus, (duration -  16) / TempoClock.default.tempo,
			\rel, 16 / TempoClock.default.tempo,
			\controlBus, owlsAmpBus
		),
	]);
};

// Long sample fades in and out over the entire duration, not just the first and last 4 bars.
// This is because it takes up a lot of space. This also uses "waver" in the panControl synth
// to add a little bit of glitchiness.
~melodie = {
	| duration |
	Ppar([
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \play,
			\buf, ~melodieBuffer,
			\loop, 1,
			\panBus, melodiePanBus,
			\ampBus, melodieAmpBus,
            \amp, 0.05,
            \ampOutBus, melodieAmpOutBus
		),
		Pbind(
			\dur, Pseq([48], inf),
			\instrument, Pif(Ptime() < duration, \panControl),
			\legato, 1,
			\iphase, 0,
			\freq, TempoClock.default.tempo / 24,
			\controlBus, melodiePanBus,
			\direction, Prand([1, -1], inf),
            \waver, 0.05
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \ampControl,
			\atk, 0.5 * duration / TempoClock.default.tempo,
			\sus, 0,
			\rel, 0.5 * duration / TempoClock.default.tempo,
			\controlBus, melodieAmpBus
		)
	]);
};


// Short samples, hard panned to one speaker. These sound cool, appear at the end of biosphere
// in the "day takes over night" phase, and could maybe be more frequent. The rarement mode
// is unused for now.
// These also showcase adding randomness to delayTime and delayRepeat (not sure it sounds amazing,
// but use this code as a reference).
~frog = {
	| duration |
	Ppar([
		Pbind(
			\buf, Pxrand(~frogBuffers, inf),
			\dur, Pwrand(
				[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].collect {
					| waitBeats |
					Pfuncn({
						| ev |
						(ev[\buf].duration * TempoClock.default.tempo).round(2) + waitBeats
					}, inf)
				},
				[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].normalizeSum),
			\legato, 1,
			\instrument, Pif(Ptime() < duration, \play),
			\hardPan, Pwhite(0.0, 2.0, inf),
            \lpfRq, 2,
			\gateRelease, 20,
            \amp, Pwhite(0.05, 0.015, inf),
			\ampBus, frogAmpBus,
            \delayTime, Prand([1.5 / TempoClock.default.tempo, 1 / TempoClock.default.tempo], inf),
            \delayRepeat, Pwhite(0.1, 1.0, inf),
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \ampControl,
			\atk, 0 / TempoClock.default.tempo,
			\sus, (duration -  16) / TempoClock.default.tempo,
			\rel, 16 / TempoClock.default.tempo,
			\controlBus, frogAmpBus
		),
	]);
};

// Long sample with fade in and out.
~water = {
	| duration |
	Ppar([
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \play,
			\buf, ~waterBuffer,
			\loop, 1,
			\panBus, waterPanBus,
			\ampBus, waterAmpBus,
			\loopAtk, 16,
			\loopRel, 16,
			\loopSus, 0
		),
		Pbind(
			\dur, Pseq([32], inf),
			\instrument, Pif(Ptime() < duration, \panControl),
			\legato, 1,
			\iphase, Pwhite(0.0, 2.0, inf),
			\freq, TempoClock.default.tempo / 12,
			\controlBus, waterPanBus,
			\direction, Prand([1, -1], inf),
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \ampControl,
			\atk, 16 / TempoClock.default.tempo,
			\sus, (duration -  32) / TempoClock.default.tempo,
			\rel, 16 / TempoClock.default.tempo,
			\controlBus, waterAmpBus
		),
	]);
};

~biospherePart1 = {
	| firstPhaseDuration, secondPhaseDuration |
	var sireneIn = (firstPhaseDuration / 6).round(4);
	var gouttesIn = (2 * firstPhaseDuration / 6).round(4);
	var owlsIn = (3 * firstPhaseDuration / 6).round(4);
	Ppar([
		Pseq([Event.silent(0), ~nappeBaleine.value(firstPhaseDuration + 8)]),
		Pseq([Event.silent(sireneIn), ~sirens.value(firstPhaseDuration - sireneIn)]),
		Pseq([Event.silent(gouttesIn), ~gouttes.value(firstPhaseDuration + secondPhaseDuration + 16 - gouttesIn)]),
		Pseq([Event.silent(owlsIn), ~owls.value(firstPhaseDuration + secondPhaseDuration + 32 - owlsIn)])
	]);
};

~biospherePart2 = {
	| firstPhaseDuration, secondPhaseDuration |
	Pseq([
		Event.silent(firstPhaseDuration),
		Ppar([
			Pseq([Event.silent(0), ~melodie.value(secondPhaseDuration)]),
		])
	]);
};

~biospherePart3 = {
	| firstPhaseDuration, secondPhaseDuration, thirdPhaseDuration |
	var birdsIn = (firstPhaseDuration / 6).round(4);
	var frogsIn = (2 * firstPhaseDuration / 6).round(4);
	Pseq([
		Event.silent(firstPhaseDuration + secondPhaseDuration),
		Ppar([
			Pseq([Event.silent(0), ~water.value(thirdPhaseDuration)]),
			Pseq([Event.silent(birdsIn), ~birds.value(thirdPhaseDuration - birdsIn)]),
			Pseq([Event.silent(frogsIn), ~frog.value(secondPhaseDuration - frogsIn)]),
		])
	]);
};

)