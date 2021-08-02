(
var coil = Buffer.readChannel(s, "C:/Users/jonathan/Desktop/scc/sons/Chapitre3 - Rituel/DrumRackOneShot/coil.aif");
var coilPanBus = Bus.control(s, 1);
var coilAmpBus = Bus.control(s, 1);
var coilLowPassBus = Bus.control(s, 1);

var cricket1 = Buffer.readChannel(s, "C:/Users/jonathan/Desktop/scc/sons/Chapitre3 - Rituel/DrumRackOneShot/cricket1.aif");
var cricket1PanBus = Bus.control(s, 1);
var cricket1AmpBus = Bus.control(s, 1);
var cricket1LowPassBus = Bus.control(s, 1);

var cricket2 = Buffer.readChannel(s, "C:/Users/jonathan/Desktop/scc/sons/Chapitre3 - Rituel/DrumRackOneShot/cricket2.aif");
var cricket2PanBus = Bus.control(s, 1);
var cricket2AmpBus = Bus.control(s, 1);
var cricket2LowPassBus = Bus.control(s, 1);

var hhdelay = Buffer.readChannel(s, "C:/Users/jonathan/Desktop/scc/sons/Chapitre3 - Rituel/DrumRackOneShot/hhdelay.aif");
var hhdelayPanBus = Bus.control(s, 1);
var hhdelayAmpBus = Bus.control(s, 1);
var hhdelayLowPassBus = Bus.control(s, 1);

var kick = Buffer.readChannel(s, "C:/Users/jonathan/Desktop/scc/sons/Chapitre3 - Rituel/DrumRackOneShot/kick.aif");
var kickPanBus = Bus.control(s, 1);
var kickAmpBus = Bus.control(s, 1);
var kickLowPassBus = Bus.control(s, 1);

var kickDelay = Buffer.readChannel(s, "C:/Users/jonathan/Desktop/scc/sons/Chapitre3 - Rituel/DrumRackOneShot/kickDelay.aif");
var kickDelayPanBus = Bus.control(s, 1);
var kickDelayAmpBus = Bus.control(s, 1);
var kickDelayLowPassBus = Bus.control(s, 1);

var snareTom = Buffer.read(s, "C:/Users/jonathan/Desktop/scc/sons/Chapitre3 - Rituel/DrumRackOneShot/snareTom.wav");
var snareTomPanBus = Bus.control(s, 1);
var snareTomAmpBus = Bus.control(s, 1);
var snareTomLowPassBus = Bus.control(s, 1);

var tom1 = Buffer.readChannel(s, "C:/Users/jonathan/Desktop/scc/sons/Chapitre3 - Rituel/DrumRackOneShot/tom1.aif");
var tom1PanBus = Bus.control(s, 1);
var tom1AmpBus = Bus.control(s, 1);
var tom1LowPassBus = Bus.control(s, 1);

var grillonOneShot = Buffer.readChannel(s, "C:/Users/jonathan/Desktop/scc/sons/Chapitre3 - Rituel/Grillons/GrillonOneShot.aif");
var grillonOneShotPanBus = Bus.control(s, 1);
var grillonOneShotPanBus2 = Bus.control(s, 1);
var grillonOneShotAmpBus = Bus.control(s, 1);
var grillonOneShotLowPassBus = Bus.control(s, 1);
var grillonOneShotLowPassBus2 = Bus.control(s, 1);

var feuillesNappe = Buffer.readChannel(s, "C:/Users/jonathan/Desktop/scc/sons/Chapitre3 - Rituel/feuillesNappe.aif");
var feuillesNappePanBus = Bus.control(s, 1);
var feuillesNappeAmpBus = Bus.control(s, 1);
var feuillesNappeLowPassBus = Bus.control(s, 1);

var murmures = ~readContentsAsBuffers.value("C:/Users/jonathan/Desktop/scc/sons/Chapitre3 - Rituel/MurmuresOneShot");
var murmuresPanBus = Bus.control(s, 1);
var murmuresAmpBus = Bus.control(s, 1);
var murmuresLowPassBus = Bus.control(s, 1);

var hiboux = ~readContentsAsBuffers.value("C:/Users/jonathan/Desktop/scc/sons/Chapitre3 - Rituel/Hiboux");
var hibouxPanBus = Bus.control(s, 1);
var hibouxAmpBus = Bus.control(s, 1);
var hibouxLowPassBus = Bus.control(s, 1);

var bass = Buffer.readChannel(s, "C:/Users/jonathan/Desktop/scc/sons/Chapitre3 - Rituel/Baaaaass.wav");
var bassPanBus = Bus.control(s, 1);
var bassAmpBus = Bus.control(s, 1);
var bassLowPassBus = Bus.control(s, 1);

var bassVoiceShaman = Buffer.readChannel(s, "C:/Users/jonathan/Desktop/scc/sons/Chapitre3 - Rituel/BassVoiceShaman.aif");
var bassVoiceShamanPanBus = Bus.control(s, 1);
var bassVoiceShamanAmpBus = Bus.control(s, 1);
var bassVoiceShamanLowPassBus = Bus.control(s, 1);

var bassVoiceShaman2PanBus = Bus.control(s, 1);
var bassVoiceShaman2AmpBus = Bus.control(s, 1);
var bassVoiceShaman2LowPassBus = Bus.control(s, 1);

var clochettes = ~readContentsAsBuffers.value("C:/Users/jonathan/Desktop/scc/sons/Chapitre3 - Rituel/ClochetteOneShot/ClochetteReverb");
var clochettesPanBus = Bus.control(s, 1);
var clochettesAmpBus = Bus.control(s, 1);
var clochettesLowPassBus = Bus.control(s, 1);

var murmuresLoops = ~readContentsAsBuffers.value("C:/Users/jonathan/Desktop/scc/sons/Chapitre3 - Rituel/Murmures");
var murmuresLoopsPanBus = Bus.control(s, 1);
var murmuresLoopsAmpBus = Bus.control(s, 1);
var murmuresLoopsLowPassBus = Bus.control(s, 1);

~grillons = {
	| duration |
	Ppar([
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \ampControl,
			\atk, 0,
			\sus, (duration - 32) / TempoClock.default.tempo,
			\rel, 32 / TempoClock.default.tempo,
			\controlBus, grillonOneShotAmpBus
		),
		Ppar([
				[1, grillonOneShotPanBus, grillonOneShotLowPassBus, 12, 0, -12.midiratio, false, 0.05],
				[-1, grillonOneShotPanBus2,  grillonOneShotLowPassBus2, 16, pi, -12.midiratio, false, 0.05],
				[1, grillonOneShotPanBus, grillonOneShotLowPassBus, 0, 0, 1, true, 0.1],
				[-1, grillonOneShotPanBus2,  grillonOneShotLowPassBus2, 4, pi, 1, true, 0.1]
			].collect {
			| args |
			var direction, panBus, lpfBus, initialRest, phase, pattern, rate, triggerControlSynths, amp;
			direction = args[0];
			panBus = args[1];
			lpfBus = args[2];
			initialRest = args[3];
			phase = args[4];
			rate = args[5];
			triggerControlSynths = args[6];
			amp = args[7];
			pattern = Prand([
				Pseq([Pseq([1/2], repeats: 4), Rest(6)]),
				Pseq([Pseq([1/3], repeats: 6), Rest(2)]),
				Pseq([Pseq([1/3], repeats: 3), Rest(3)]),
				Pseq([Pseq([1/2], repeats: 10), Rest(3)])
			], repeats: inf);
			Ppar([
				Pbind(
					\dur, Pif(initialRest > 0, Pseq([Rest(initialRest), pattern]), pattern),
					\legato, 1,
					\instrument, Pif(Ptime() < duration, \play),
					\buf, grillonOneShot,
					\panBus, panBus,
					\lpfBus, lpfBus,
					\ampBus, grillonOneShotAmpBus,
					\rate, rate,
					\gateRelease, 3,
					\amp, amp
				),
				Pif(triggerControlSynths, Pbind(
					\dur, Pseq([duration]),
					\legato, 1,
					\instrument, \panControl,
					\freq, TempoClock.default.tempo / 12,
					\iphase, 0,
					\controlBus, panBus,
					\direction, direction
				)),
				Pif(triggerControlSynths, Pbind(
					\dur, Pseq([duration]),
					\legato, 1,
					\instrument, \lpfControl,
					\freq, TempoClock.default.tempo / 16,
					\phase, phase,
					\min, 100,
					\max, 10000,
					\controlBus, lpfBus,
				)),
			])
		})
	])
};

~feuillesNappe = {
	| duration |
	Ppar([
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \play,
			\buf, feuillesNappe,
			\loop, 1,
			\panBus, feuillesNappePanBus,
			\ampBus, feuillesNappeAmpBus,
		),
		Pbind(
			\dur, Pseq([48], repeats: inf),
			\legato, 1,
			\instrument, Pif(Ptime() < duration, \panControl),
			\freq, TempoClock.default.tempo / 24,
			\iphase, 0,
			\controlBus, feuillesNappePanBus,
			\direction, Prand([Pseq([1], 4), Pseq([-1], 4)], inf)
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \ampControl,
			\atk, 16 / TempoClock.default.tempo,
			\sus, (duration -  32) / TempoClock.default.tempo,
			\rel, 16 / TempoClock.default.tempo,
			\controlBus, feuillesNappeAmpBus
		),
	]);
};

~murmures = {
	| duration |
	Pseq([
		Ppar([
			Pbind(
				\dur, Prand([24, 12], repeats: inf),
				\legato, 1,
				\instrument, Pif(Ptime() < duration, \play),
				\buf, Pxrand(murmures, repeats: inf),
				\panBus, murmuresPanBus,
				\ampBus, murmuresAmpBus,
				\gateRelease, 7
			),
			Pbind(
				\dur, Pseq([12], repeats: inf),
				\legato, 1,
				\instrument, Pif(Ptime() < duration, \panControl),
				\freq, TempoClock.default.tempo / 24,
				\iphase, Prand([0, 0.5, 1, 1.5], inf),
				\controlBus, murmuresPanBus,
				\direction, Prand([Pseq([1], 4), Pseq([-1], 4)], inf)
			),
			Pbind(
				\dur, Pseq([duration]),
				\legato, 1,
				\instrument, \ampControl,
				\atk, 16 / TempoClock.default.tempo,
				\sus, (duration -  32) / TempoClock.default.tempo,
				\rel, 16 / TempoClock.default.tempo,
				\controlBus, murmuresAmpBus
			)
		])
	]);
};

// ~murmuresLoops = {
// 	| duration |
// 	Pseq([
// 		Ppar([
// 			Pbind(
// 				\buf, Pxrand(murmuresLoops, repeats: inf),
// 				\dur, Pfunc({ | ev | (ev[\buf].duration * TempoClock.default.tempo).round(2) }),
// 				\legato, 1,
// 				\instrument, Pif(Ptime() < duration, \play),
// 				\panBus, murmuresLoopsPanBus,
// 				\ampBus, murmuresLoopsAmpBus,
// 				\amp, 0.3,
// 				\gateRelease, 7
// 			),
// 			Pbind(
// 				\dur, Pseq([12], repeats: inf),
// 				\legato, 1,
// 				\instrument, Pif(Ptime() < duration, \panControl),
// 				\freq, TempoClock.default.tempo / 24,
// 				\iphase, Prand([0, 0.5, 1, 1.5], inf),
// 				\controlBus, murmuresLoopsPanBus,
// 				\direction, Prand([Pseq([1], 4), Pseq([-1], 4)], inf)
// 			),
// 			Pbind(
// 				\dur, Pseq([duration]),
// 				\legato, 1,
// 				\instrument, \ampControl,
// 				\atk, 16 / TempoClock.default.tempo,
// 				\sus, (duration -  32) / TempoClock.default.tempo,
// 				\rel, 16 / TempoClock.default.tempo,
// 				\controlBus, murmuresLoopsAmpBus
// 			),
// 		])
// 	]);
// };

~murmuresLoops = {
	| duration |
	Pseq([
		Ppar([
			Pbind(
				\buf, Pxrand(murmuresLoops, repeats: inf),
				\dur, Pxrand([0, 8, 12].collect {
					| waitBeats |
					Pfunc({
						| ev |
						(ev[\buf].duration * TempoClock.default.tempo).round(2) + waitBeats
					})
				}),
				\legato, 1,
				\instrument, Pif(Ptime() < duration, \play),
				\panBus, murmuresLoopsPanBus,
				\ampBus, murmuresLoopsAmpBus,
				\amp, 0.15,
				\gateRelease, 7
			),
			Pbind(
				\dur, Pseq([12], repeats: inf),
				\legato, 1,
				\instrument, Pif(Ptime() < duration, \panControl),
				\freq, TempoClock.default.tempo / 24,
				\iphase, Prand([0, 0.5, 1, 1.5], inf),
				\controlBus, murmuresLoopsPanBus,
				\direction, Prand([Pseq([1], 4), Pseq([-1], 4)], inf)
			),
			Pbind(
				\dur, Pseq([duration]),
				\legato, 1,
				\instrument, \ampControl,
				\atk, 32 / TempoClock.default.tempo,
				\sus, (duration -  48) / TempoClock.default.tempo,
				\rel, 16 / TempoClock.default.tempo,
				\controlBus, murmuresLoopsAmpBus
			),
		])
	]);
};

~clochettes = {
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
			\buf, Pxrand(clochettes, repeats: inf),
			\hardPan, Prand([0, 0.5, 1, 1.5], inf),
			\lpfBus, clochettesLowPassBus,
			\amp, 0.5,
			\gateRelease, 3,
			\delayTime, Pif(rarement, Prand([TempoClock.default.tempo / 10, TempoClock.default.tempo / 9], inf), 0)
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \lpfControl,
			\freq, TempoClock.default.tempo / 16,
			\min, 100,
			\max, 10000,
			\controlBus, clochettesLowPassBus,
		)
	]);
};

~bassVoiceShaman = {
	| duration, withFifth = true |
	Ppar([
		Ppar([
			Pbind(
				\dur, Pseq([duration]),
				\legato, 1,
				\instrument, \play,
				\buf, bassVoiceShaman,
				\panBus, bassVoiceShamanPanBus,
				\ampBus, bassVoiceShamanAmpBus,
				\loop, 1
			),
			Pbind(
				\dur, Pseq([64], repeats: inf),
				\legato, 1,
				\instrument, Pif(Ptime() < duration, \panControl),
				\freq, TempoClock.default.tempo / 64,
				\iphase, 0,
				\controlBus, bassVoiceShamanPanBus,
				\direction, 1,
			),
			Pbind(
				\dur, Pseq([duration]),
				\legato, 1,
				\instrument, \ampControl,
				\atk, 16 / TempoClock.default.tempo,
				\sus, (duration - 32) / TempoClock.default.tempo,
				\rel, 16 / TempoClock.default.tempo,
				\controlBus, bassVoiceShamanAmpBus
			)]),
			Pif(withFifth, Ppar([
				Pbind(
					\dur, Pseq([Rest(16), 32], inf),
					\legato, 1,
					\instrument, Pif(Ptime() < duration, \play),
					\buf, bassVoiceShaman,
					\panBus, bassVoiceShaman2PanBus,
					\ampBus, bassVoiceShaman2AmpBus,
					\rate, 7.midiratio,
					\amp, 0.05,
					\loop, 1,
					\atk, 16 / TempoClock.default.tempo,
					\sus, 0,
					\rel, 16 / TempoClock.default.tempo,
				),
				Pbind(
					\dur, Pseq([Rest(16), 32], inf),
					\legato, 1,
					\instrument, Pif(Ptime() < duration, \panControl),
					\freq, TempoClock.default.tempo / 32,
					\iphase, Prand([0, 0.5, 1, 1.5], inf),
					\controlBus, bassVoiceShaman2PanBus,
					\direction, Prand([1, -1], inf)
				),
				Pbind(
					\dur, Pseq([duration]),
					\legato, 1,
					\instrument, \ampControl,
					\atk, 16 / TempoClock.default.tempo,
					\sus, (duration -  32) / TempoClock.default.tempo,
					\rel, 16 / TempoClock.default.tempo,
					\controlBus, bassVoiceShaman2AmpBus
				)]
			)),
	]);
};

~hiboux = {
	| duration |
	Ppar([
		Pbind(
			\dur, Prand([24, 16], repeats: inf),
			\legato, 1,
			\instrument, Pif(Ptime() < duration, \play),
			\buf, Pwrand(hiboux, [0.2, 0.2, 0.6], inf),
			\rate, Pwrand([1, -8.midiratio, -6.midiratio], [0.5, 0.25, 0.25], inf),
			\gateRelease, 13,
			\amp, 0.275,
			\ampBus, hibouxAmpBus,
			\panBus, hibouxPanBus
		),
		Pbind(
			\dur, 48,
			\legato, 1,
			\instrument, Pif(Ptime() < duration, \panControl),
			\freq, TempoClock.default.tempo / 16,
			\iphase, Prand([0, 0.5, 1, 1.5], inf),
			\controlBus, hibouxPanBus,
			\direction, Prand([1, -1], inf)
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \ampControl,
			\atk, 32 / TempoClock.default.tempo,
			\sus, (duration -  48) / TempoClock.default.tempo,
			\rel, 16 / TempoClock.default.tempo,
			\controlBus, hibouxAmpBus
		),
	]);
};

~bass = {
	| duration, rarement = false |
	Pbind(
		\dur, Pif(rarement, Prand([16, 24], inf), 8),
		\legato, 1,
		\instrument, Pif(Ptime() < duration, \play),
		\buf, bass,
		\amp, 0.7
	);
};

	/**
	 *************************
	 * DRUM RACK STARTS HERE *
	 *************************
	 */

~kick = {
	| duration |
	Pbind(
		\dur, Pseq([1.5, 0.5, 2], repeats: inf),
		\legato, 1,
		\instrument, Pif(Ptime() < duration, \play),
		\amp, 0.6,
		\buf, kick,
		\gateRelease, 4
	);
};

~coil = {
	| duration |
	Pbind(
		\dur, Pseq([Rest(47/4), 17/4], repeats: inf),
		\legato, 1,
		\instrument, Pif(Ptime() < duration, \play),
		\buf, coil,
		\gateRelease, 8,
		\hardPan, Prand([0, 0.5, 1, 1.5], inf)
	);
};

~cricket = {
	| duration |
	Pbind(
		\dur, Pseq([Rest(8), 8], repeats: inf),
		\legato, 1,
		\instrument, Pif(Ptime() < duration, \play),
		\buf, cricket1,
		\gateRelease, 2,
		\hardPan, Prand([0, 0.5, 1, 1.5], inf)
	);
};

~cricket2 = {
	| duration |
	Ppar([
		Pbind(
			\dur, Pseq([Pseq([1/4], repeats: 57), Rest(1/4), Pseq([1/4], repeats: 6)], repeats: inf),
			\legato, 1,
			\instrument, Pif(Ptime() < duration, \play),
			\buf, cricket2,
			\panBus, cricket2PanBus,
			// \lpfBus, cricket2LowPassBus,
			\gateRelease, 1
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \panControl,
			\freq, TempoClock.default.tempo / 4,
			\controlBus, cricket2PanBus
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \lpfControl,
			\freq, TempoClock.default.tempo / 16,
			\min, 100,
			\max, 10000,
			\controlBus, cricket2LowPassBus
		)
	]);
};

~hhdelay = {
	| duration |
	Pbind(
		\dur, Pseq([Rest(14), 22], repeats: inf),
		\legato, 1,
		\instrument, Pif(Ptime() < duration, \play),
		\buf, hhdelay,
		\hardPan, Prand([0, 0.5, 1, 1.5], inf)
	);
};

~kickDelay = {
	| duration |
	Pbind(
		\dur, Pseq([Rest(10), 6], repeats: inf),
		\legato, 1,
		\instrument, Pif(Ptime() < duration, \play),
		\buf, kickDelay,
		\gateRelease, 3,
		\hardPan, Prand([0, 0.5, 1, 1.5], inf)
	);
};

~snareTom = {
	| duration |
	Pbind(
		\dur, Pseq([Rest(2), 5, 2/4, 2, 2/4, 14/4, 1/4, 1/4, 2], repeats: inf),
		\legato, 1,
		\instrument, Pif(Ptime() < duration, \play),
		\buf, snareTom,
		\gateRelease, 3,
		\amp, Pfunc( { | ev | 0.05 + (ev[\dur] / 20) } ),
		\hardPan, Prand([0, 0.5, 1, 1.5], inf)
	);
};

~tom1 = {
	| duration |
	Pbind(
		\dur, Pseq([Rest(26/4), 38/4], repeats: inf),
		\legato, 1,
		\instrument, Pif(Ptime() < duration, \play),
		\buf, tom1,
		\gateRelease, 1,
		\hardPan, Prand([0, 0.5, 1, 1.5], inf)
	);
};

~drumRack = {
	| duration |
	Ppar([
		~kick.value(duration),
		~coil.value(duration),
		~cricket.value(duration),
		~cricket2.value(duration),
		~hhdelay.value(duration),
		~kickdelay.value(duration),
		~snareTom.value(duration),
		~tom.value(duration)
	]);
};
)
/*
		\type, \oscEvent,
		\oscServer, ~touchDesigner,
		\eventName, "/kick",
		\eventValue, 1,
		\offEventValue, 0,
		\playSynth, true
*/