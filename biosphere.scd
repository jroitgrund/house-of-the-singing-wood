(
var birds1 = Buffer.readChannel(s, ~basePath ++ "Chapitre1 - Biosphere/Birds1.aif", action: ~loaded);
var birds1PanBus = Bus.control(s, 1);
var birds1AmpBus = Bus.control(s, 1);
var birds1LowPassBus = Bus.control(s, 1);
var birds1AmpOutBus = Bus.control(s, 1);

var birds2 = Buffer.readChannel(s, ~basePath ++ "Chapitre1 - Biosphere/Birds2.aif", action: ~loaded);
var birds2PanBus = Bus.control(s, 1);
var birds2AmpBus = Bus.control(s, 1);
var birds2LowPassBus = Bus.control(s, 1);
var birds2AmpOutBus = Bus.control(s, 1);

var frog = Buffer.readChannel(s, ~basePath ++ "Chapitre1 - Biosphere/Frog_1shot_Wrapped.aif", action: ~loaded);
var frogPanBus = Bus.control(s, 1);
var frogAmpBus = Bus.control(s, 1);
var frogLowPassBus = Bus.control(s, 1);
var frogAmpOutBus = Bus.control(s, 1);

var gouttes = Buffer.readChannel(s, ~basePath ++ "Chapitre1 - Biosphere/Gouttes.aif", action: ~loaded);
var gouttesPanBus = Bus.control(s, 1);
var gouttesAmpBus = Bus.control(s, 1);
var gouttesLowPassBus = Bus.control(s, 1);
var gouttesAmpOutBus = Bus.control(s, 1);

var melodie = Buffer.readChannel(s, ~basePath ++ "Chapitre1 - Biosphere/Melodie_Wrapped.aif", action: ~loaded);
var melodiePanBus = Bus.control(s, 1);
var melodieAmpBus = Bus.control(s, 1);
var melodieLowPassBus = Bus.control(s, 1);
var melodieAmpOutBus = Bus.control(s, 1);

var owlNappe = Buffer.readChannel(s, ~basePath ++ "Chapitre1 - Biosphere/OWL_1BAR.aif", action: ~loaded);
var owlNappePanBus = Bus.control(s, 1);
var owlNappeAmpBus = Bus.control(s, 1);
var owlNappeLowPassBus = Bus.control(s, 1);
var owlNappeAmpOutBus = Bus.control(s, 1);

var owls = [
    Buffer.readChannel(s, ~basePath ++ "Chapitre1 - Biosphere/Owl-Sing1.aif", action: ~loaded),
    Buffer.readChannel(s, ~basePath ++ "Chapitre1 - Biosphere/Owl-Sing2.aif", action: ~loaded)
];
var owlsPanBus = Bus.control(s, 1);
var owlsAmpBus = Bus.control(s, 1);
var owlsLowPassBus = Bus.control(s, 1);
var owlsAmpOutBus = Bus.control(s, 1);

var water = Buffer.readChannel(s, ~basePath ++ "Chapitre1 - Biosphere/Water.aif", action: ~loaded);
var waterPanBus = Bus.control(s, 1);
var waterAmpBus = Bus.control(s, 1);
var waterLowPassBus = Bus.control(s, 1);
var waterAmpOutBus = Bus.control(s, 1);

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
                    \buf, birds2,
                    \loop, 1,
                    \panBus, birds2PanBus,
                    \ampBus, birds2AmpBus,
                ),
                Pbind(
                    \dur, Pseq([48], repeats: inf),
                    \legato, 1,
                    \instrument, Pif(Ptime() < (duration - 16), \panControl),
                    \freq, TempoClock.default.tempo / 24,
                    \iphase, 0,
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
			\buf, birds1,
			\loop, 1,
			\panBus, birds1PanBus,
			\ampBus, birds1AmpBus,
		),
		Pbind(
			\dur, Pseq([48], repeats: inf),
			\legato, 1,
			\instrument, Pif(Ptime() < duration, \panControl),
			\freq, TempoClock.default.tempo / 24,
			\iphase, 0,
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
			\buf, gouttes,
			\loop, 1,
			\panBus, gouttesPanBus,
			\ampBus, gouttesAmpBus,
		),
		Pbind(
			\dur, Pseq([36], repeats: inf),
			\legato, 1,
			\instrument, Pif(Ptime() < duration, \panControl),
			\freq, TempoClock.default.tempo / 18,
			\iphase, 0,
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

// Long sample with fade in and out.
// This is actually quite in rhythm and maybe a bit repetitive, maybe we could chop it up
// and trigger it more randomly.
~owlNappe = {
	| duration |
	Ppar([
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \play,
			\buf, owlNappe,
			\loop, 1,
			\panBus, owlNappePanBus,
			\ampBus, owlNappeAmpBus,
		),
		Pbind(
			\dur, Pseq([28], inf),
			\instrument, Pif(Ptime() < duration, \panControl),
			\legato, 1,
			\iphase, 0,
			\freq, TempoClock.default.tempo / 14,
			\controlBus, owlNappePanBus,
			\direction, Prand([1, -1], inf)
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \ampControl,
			\atk, 16 / TempoClock.default.tempo,
			\sus, (duration -  32) / TempoClock.default.tempo,
			\rel, 16 / TempoClock.default.tempo,
			\controlBus, owlNappeAmpBus
		),
	]);
};

// Short samples, hard panned to one speaker. I tried to add delay here but
// this kept resulting in weird clicks so I gave up.
// Could be worth adding something to spice it up as the owl samples are just
// identical source material pitched up or down (and same as in ritual).
~owls = {
	| duration, rarement = false |
	Ppar([
		Pbind(
			\dur, Pif(
				rarement,
				Pxrand([
					Pseq([12, 12, 24]),
					Pseq([18, 6, 24]),
					Pseq([18, 12, 18]),
					Pseq([30, 6, 12]),
				], repeats: inf),
				Pxrand([
					Pseq([4, 4, 8]),
					Pseq([6, 2, 8]),
					Pseq([6, 4, 6]),
					Pseq([10, 2, 4]),
				], repeats: inf)),
				\legato, 1,
			\instrument, Pif(Ptime() < duration, \play),
			\buf, Pxrand(owls, repeats: inf),
			\hardPan, Pwhite(0.0, 2.0, inf),
            \lpfRq, 2,
			\gateRelease, 60,
            \ampBus, owlsAmpBus,
            \ampOutBus, owlsAmpOutBus,
            \type, \actionInstrument,
            \resolume, ~resolume,
            \panToRotate, ~panToRotate,
            \action, Pfunc({
                |ev|
                {
                    ~resolume.sendMsg("/composition/layers/3/video/effects/transform/rotationz", ~panToRotate.value(ev[\hardPan]));
                    Pbind(\type, \actionEvent, \dur, Pseq([1/60], 60), \frame, Pseries(), \resolume, ~resolume, \action, {

                        if(~frame >= 59, {
                            ~resolume.sendMsg("/composition/layers/3/video/opacity", 0)
                        }, {
                            ~resolume.sendMsg("/composition/layers/3/video/opacity", ~frame / 60)
                        });
                    }).play;
                }
            })
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
			\buf, melodie,
			\loop, 1,
			\panBus, melodiePanBus,
			\ampBus, melodieAmpBus,
            \amp, 0.05,
            \ampOutBus, melodieAmpOutBus
		),
		Pbind(
			\dur, Pseq([27], inf),
			\instrument, Pif(Ptime() < duration, \panControl),
			\legato, 1,
			\iphase, 0,
			\freq, TempoClock.default.tempo / 18,
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
		),
        ~pollActionPattern.value({
            melodieAmpOutBus.get { | amp | ~resolume.sendMsg("/composition/layers/3/video/opacity", amp * 300); };
            melodiePanBus.get { | pan | ~resolume.sendMsg("/composition/layers/3/video/effects/transform/rotationz", ((0.5 + ((pan - 0.25) / 2)) % 1)); };
        }, duration);
	]);
};


// Short samples, hard panned to one speaker. These sound cool, appear at the end of biosphere
// in the "day takes over night" phase, and could maybe be more frequent. The rarement mode
// is unused for now.
// These also showcase adding randomness to delayTime and delayRepeat (not sure it sounds amazing,
// but use this code as a reference).
~frog = {
	| duration, rarement = false |
	Ppar([
		Pbind(
			\dur, Pif(
				rarement,
				Pxrand([
					Pseq([12, 12, 24]),
					Pseq([18, 6, 24]),
					Pseq([18, 12, 18]),
					Pseq([30, 6, 12]),
				], repeats: inf),
				Pxrand([
					Pseq([4, 4, 8]),
					Pseq([6, 2, 8]),
					Pseq([6, 4, 6]),
					Pseq([10, 2, 4]),
				], repeats: inf)),
				\legato, 1,
			\instrument, Pif(Ptime() < duration, \play),
			\buf, frog,
			\hardPan, Pwhite(0.0, 2.0, inf),
            \lpfRq, 2,
			\gateRelease, 20,
            \amp, Pwhite(0.05, 0.015, inf),
			\ampBus, frogAmpBus,
            \delayTime, Prand([1.5 / TempoClock.default.tempo, 1 / TempoClock.default.tempo], inf),
            \delayRepeat, Pwhite(0.1, 1, inf),
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
			\buf, water,
			\loop, 1,
			\panBus, waterPanBus,
			\ampBus, waterAmpBus,
		),
		Pbind(
			\dur, Pseq([36], inf),
			\instrument, Pif(Ptime() < duration, \panControl),
			\legato, 1,
			\iphase, 0,
			\freq, TempoClock.default.tempo / 18,
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

)