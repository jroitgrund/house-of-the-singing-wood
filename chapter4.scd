(
var birds1Amp = Bus.control(s, 1);
var cloche1Amp = Bus.control(s, 1);
var waterAmp = Bus.control(s, 1);

var birds1 = Buffer.readChannel(s, "C:/Users/jonathan/Desktop/scc/Sons pour Supercollider 2/Chapitre1 - Biosphere/Birds1.aif");
var cloche1 = Buffer.readChannel(s, "C:/Users/jonathan/Desktop/scc/Sons pour Supercollider 2/Chapitre1 - Biosphere/Cloche_1.aif");
var water = Buffer.readChannel(s, "C:/Users/jonathan/Desktop/scc/Sons pour Supercollider 2/Chapitre1 - Biosphere/Water.aif");

var totalDuration = 30;


~playChapter1 = {
	var patterns = List.new;

    Synth.new(\control, [
		\controlBus, birds1Amp,
		\silence, 0,
		\attack, 0,
		\sustainTime, 20,
		\release, 0
	]);

    Synth.new(\control, [
		\controlBus, cloche1Amp,
		\silence, 10,
		\attack, 0,
		\sustainTime, 20,
		\release, 0
	]);

    Synth.new(\control, [
		\controlBus, waterAmp,
		\silence, 20,
		\attack, 0,
		\sustainTime, 10,
		\release, 0
	]);

	patterns.add(Pbind(
		\dur, birds1.duration,
		\instrument, \play,
		\buf, birds1,
		\duration, birds1.duration,
		\ampBus, birds1Amp
	).play);

	patterns.add(Pbind(
		\dur, cloche1.duration,
		\instrument, \play,
		\buf, cloche1,
		\duration, cloche1.duration,
		\ampBus, cloche1Amp
	).play);

	patterns.add(Pbind(
		\dur, water.duration,
		\instrument, \play,
		\buf, water,
		\duration, water.duration,
		\ampBus, waterAmp
	).play);

	[totalDuration, patterns];
};
)