(
var coil = Buffer.readChannel(s, "C:/Users/jonathan/Desktop/scc/sons/Chapitre3 - Rituel/DrumRackOneShot/coil.aif");
var cricket1 = Buffer.readChannel(s, "C:/Users/jonathan/Desktop/scc/sons/Chapitre3 - Rituel/DrumRackOneShot/cricket1.aif");
var cricket2 = Buffer.readChannel(s, "C:/Users/jonathan/Desktop/scc/sons/Chapitre3 - Rituel/DrumRackOneShot/cricket2.aif");
var hhdelay = Buffer.readChannel(s, "C:/Users/jonathan/Desktop/scc/sons/Chapitre3 - Rituel/DrumRackOneShot/hhdelay.aif");
var kick = Buffer.readChannel(s, "C:/Users/jonathan/Desktop/scc/sons/Chapitre3 - Rituel/DrumRackOneShot/kick.aif");
var kickDelay = Buffer.readChannel(s, "C:/Users/jonathan/Desktop/scc/sons/Chapitre3 - Rituel/DrumRackOneShot/kickDelay.aif");
var snareTom = Buffer.readChannel(s, "C:/Users/jonathan/Desktop/scc/sons/Chapitre3 - Rituel/DrumRackOneShot/snareTom.aif");
var tom1 = Buffer.readChannel(s, "C:/Users/jonathan/Desktop/scc/sons/Chapitre3 - Rituel/DrumRackOneShot/tom1.aif");

var grillonOneShot = Buffer.readChannel(s, "C:/Users/jonathan/Desktop/scc/sons/Chapitre3 - Rituel/Grillons/GrillonOneShot.aif");
var grillonOneShotPanBus = Bus.control(s, 1);
var grillonOneShotLowPassBus = Bus.control(s, 1);

var feuillesNape = Buffer.readChannel(s, "C:/Users/jonathan/Desktop/scc/sons/Chapitre3 - Rituel/FeuillesNape.aif");
var feuillesNapePanBus = Bus.control(s, 1);

var murmures = ~readContentsAsBuffers.value("C:/Users/jonathan/Desktop/scc/sons/Chapitre3 - Rituel/MurmuresOneShot");
var murmuresPanBus = Bus.control(s, 1);
var murmuresAmpBus = Bus.control(s, 1);


/**
 *
 * 1st element coming in: wind / leaves, panned slowly arounnd the space
 * there's a cricket in there, but it's a different one
 * clochettes prand
 * whispers
 * kick / bass
 */

var crickets2PanBus = Bus.control(s, 1);
var crickets2LowPassBus = Bus.control(s, 1);

~playLoop = {
	var patterns = List.new;
	var routines = List.new;

	patterns.add(Ppar([
		Pbind(
			\dur, Pseq([Pseq([1/2], repeats: 4), Rest(6)], repeats: inf),
			\instrument, \play,
			\buf, grillonOneShot,
			\duration, grillonOneShot.duration,
			\panBus, grillonOneShotPanBus,
			\lpfBus, grillonOneShotLowPassBus
		),
		Pbind(
			\dur, Pseq([1]),
			\instrument, \panControl,
			\freq, TempoClock.default.tempo / 4,
			\controlBus, grillonOneShotPanBus
		),
		Pbind(
			\dur, Pseq([1]),
			\instrument, \lpfControl,
			\freq, TempoClock.default.tempo / 16,
			\min, 100,
			\max, 10000,
			\controlBus, grillonOneShotLowPassBus
		)
	]));

	patterns.add(Ppar([
		Pbind(
			\dur, Pseq([1]),
			\instrument, \play,
			\buf, feuillesNape,
			\duration, feuillesNape.duration,
			\atk, 32 / TempoClock.default.tempo,
			\sus, 16 / TempoClock.default.tempo,
			\rel, 8 / TempoClock.default.tempo,
			\panBus, feuillesNapePanBus,
		),
		Pbind(
			\dur, Pseq([1]),
			\instrument, \panControl,
			\freq, TempoClock.default.tempo / 16,
			\iphase, 1,
			\controlBus, feuillesNapePanBus
		),
	]));

	patterns.add(Pseq([
		Event.silent(32),
		Ppar([
			Pbind(
				\dur, Prand([4, 6, 12], repeats: inf),
				\instrument, \play,
				\buf, Pxrand(murmures),
				\duration, 7,
				\panBus, murmuresPanBus,
				\ampBus, murmuresAmpBus
			),
			Pbind(
				\dur, Pseq([1]),
				\instrument, \panControl,
				\freq, TempoClock.default.tempo / 24,
				\iphase, 0.5,
				\controlBus, murmuresPanBus
			),
			Pbind(
				\dur, Pseq([1]),
				\instrument, \ampControl,
				\atk, 32 / TempoClock.default.tempo,
				\sus, 16 / TempoClock.default.tempo,
				\rel, 8 / TempoClock.default.tempo,
				\controlBus, murmuresAmpBus
			)
		])
	]));

	/*patterns.add(Pbind(
		\dur, Pseq([Rest(47/4), 17/4], repeats: inf),
		\instrument, \play,
		\buf, coil,
		\duration, coil.duration,
	));

	patterns.add(Pbind(
		\dur, Pseq([Rest(8), 8], repeats: inf),
		\instrument, \play,
		\buf, cricket1,
		\duration, cricket1.duration,
	));

	patterns.add(Ppar([
		Pbind(
			\dur, Pseq([Pseq([1/4], repeats: 57), Rest(1/4), Pseq([1/4], repeats: 6)], repeats: inf),
			\instrument, \play,
			\buf, cricket2,
			\duration, cricket2.duration,
			\panBus, crickets2PanBus,
			\lpfBus, crickets2LowPassBus
		),
		Pbind(
			\dur, Pseq([1]),
			\instrument, \panControl,
			\freq, TempoClock.default.tempo / 4,
			\controlBus, crickets2PanBus
		),
		Pbind(
			\dur, Pseq([1]),
			\instrument, \lpfControl,
			\freq, TempoClock.default.tempo / 16,
			\min, 100,
			\max, 10000,
			\controlBus, crickets2LowPassBus
		)
	]));

	patterns.add(Pbind(
		\dur, Pseq([Rest(14), 22], repeats: inf),
		\instrument, \play,
		\buf, hhdelay,
		\duration, hhdelay.duration,
	));

	patterns.add(Pbind(
		\dur, Pseq([2/4, 6/4, 2, 2, 2, 2/4, 6/4, 2, 2/4, 6/4, 2], repeats: inf),
		\instrument, \play,
		\buf, kick,
		\duration, kick.duration,
		\type, \oscEvent,
		\oscServer, ~touchDesigner,
		\eventName, "/kick",
		\eventValue, 1,
		\offEventValue, 0,
		\playSynth, true
	));

	patterns.add(Pbind(
		\dur, Pseq([Rest(10), 6], repeats: inf),
		\instrument, \play,
		\buf, kickDelay,
		\duration, kickDelay.duration,
	));

	patterns.add(Pbind(
		\dur, Pseq([Rest(2), 5, 2/4, 2, 2/4, 14/4, 1/4, 1/4, 2], repeats: inf),
		\instrument, \play,
		\buf, snareTom,
		\duration, snareTom.duration,
	));

	patterns.add(Pbind(
		\dur, Pseq([Rest(26/4), 38/4], repeats: inf),
		\instrument, \play,
		\buf, tom1,
		\duration, tom1.duration,
	));*/

	[patterns, routines];
};
)