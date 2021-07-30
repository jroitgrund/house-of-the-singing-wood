(
var birds1 = Buffer.readChannel(s, "C:/Users/jonathan/Desktop/scc/sons/Chapitre1 - Biosphere/Birds1.aif");
var cloche1 = Buffer.readChannel(s, "C:/Users/jonathan/Desktop/scc/sons/Chapitre1 - Biosphere/Cloche_1.aif");
var water = Buffer.readChannel(s, "C:/Users/jonathan/Desktop/scc/sons/Chapitre1 - Biosphere/Water.aif");

~playChapter1 = {
	var patterns = List.new;

	patterns.add(Pbind(
		\dur, Pseq([1]),
		\instrument, \play,
		\buf, birds1,
		\duration, birds1.duration,
		\atk, 5 / TempoClock.default.tempo,
		\sus, 20 / TempoClock.default.tempo,
		\rel, 5 / TempoClock.default.tempo,
		\loop, 1,
	));

	patterns.add(Pbind(
		\dur, Pseq([Pseq([Rest(10)]), Pseq([1], 20)]),
		\instrument, \play,
		\buf, cloche1,
		\duration, cloche1.duration,
	));

	patterns.add(Pbind(
		\dur, Pseq([Pseq([Rest(20)]), Pseq([1])]),
		\instrument, \play,
		\buf, water,
		\duration, water.duration,
		\atk, 5 / TempoClock.default.tempo,
		\sus, 20 / TempoClock.default.tempo,
		\rel, 5 / TempoClock.default.tempo,
		\loop, 1
	));

	patterns;
};
)