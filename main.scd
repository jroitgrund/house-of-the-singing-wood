(
s.options.device = "ASIO : Focusrite USB ASIO";
s.options.numOutputBusChannels = 4;
s.options.memSize = 1000000;
s.reboot;
)

(
s.options.device = "ASIO : Realtek ASIO";
s.options.memSize = 1000000;
s.options.numOutputBusChannels = 2;
s.reboot;
);

(
var runLoop;
var firstPhaseDuration = 0;
var secondPhaseDuration = 128;
var thirdPhaseDuration = 64;
var fourthPhaseDuration = 64;
var fifthPhaseDuration = 64;
var total = firstPhaseDuration + secondPhaseDuration + thirdPhaseDuration + fourthPhaseDuration + fifthPhaseDuration;
TempoClock.default.tempo = 90/60;
"./common.scd".load;
"./playLoop.scd".load;

runLoop = {
	Ppar([
		Pseq([Event.silent(0), Ppar([
			~grillons.value(firstPhaseDuration + 32),
			Pseq([Event.silent(4), ~clochettes.value(firstPhaseDuration - 4)]),
			~bass.value(firstPhaseDuration, rarement: true)
		])]),
		Pseq([Event.silent(firstPhaseDuration), Ppar([
			Pseq([Event.silent(16), ~bassVoiceShaman.value(secondPhaseDuration - 8)]),
			Pseq([Event.silent(0), ~murmuresLoops.value(secondPhaseDuration - 0)]),
			Pseq([Event.silent(8), ~hiboux.value(secondPhaseDuration - 8)]),
		])]),
		Pseq([Event.silent(firstPhaseDuration + secondPhaseDuration), Ppar([
			~kick.value(thirdPhaseDuration + 1),
			~murmuresLoops.value(thirdPhaseDuration)
		])]),
		Pseq([Event.silent(firstPhaseDuration + secondPhaseDuration + thirdPhaseDuration), Ppar([
			~murmures.value(fourthPhaseDuration),
			Pseq([Event.silent(fourthPhaseDuration / 2), ~hiboux.value(fourthPhaseDuration / 2)]),
			~clochettes.value(fourthPhaseDuration + 32, rarement: true),
			~feuillesNappe.value(fourthPhaseDuration + 16),
		])]),
Pseq([Event.silent(firstPhaseDuration + secondPhaseDuration + thirdPhaseDuration + fourthPhaseDuration), Ppar([
			Pseq([Event.silent(32), ~drumRack.value(fifthPhaseDuration - 32)]),
			~bassVoiceShaman.value(fifthPhaseDuration, withFifth: false)
		])])
	]).play;
};

Routine({
	2.wait;

	Array.series(1).do { | i |
		TempoClock.default.sched(total * i, runLoop);
	};
}).play;
)

(
var play;
TempoClock.default.tempo = 90/60;
"./common.scd".load;
"./playLoop.scd".load;

Routine({
	2.wait;
	// ~grillons.value(64).play;
	// ~feuillesNappe.value(64).play; // perhaps needs some enveloping
	// ~murmures.value(64).play;
	// ~murmuresLoops.value(64).play; // needs to be a bit louder
	// ~clochettes.value(64).play;
	// ~bassVoiceShaman.value(64).play; // louder
	// ~hiboux.value(64).play; // more often
	// ~bass.value(64).play;
	// ~kick.value(64).play;
	// ~coil.value(64).play; // louder
	// ~cricket.value(64).play; // louder
	// ~cricket2.value(64).play;
	// ~hhdelay.value(64).play; // louder
	// ~kickDelay.value(64).play; // louder
	// ~snareTom.value(64).play; // louder, randomness
	// ~tom1.value(64).play;
	// ~snareTom.value(64).play;
	// ~drumRack.value(64).play;
	// ~hiboux.value(32).play;
	// ~clochettes.value(64, rarement: true).play;
}).play;
)


(
SynthDef(\test, {
	var playBuf;
	playBuf = PlayBuf.ar(2, Buffer.read(s, "C:/Users/jonathan/Desktop/scc/sons/Chapitre3 - Rituel/ClochetteOneShot/ClochetteReverb/ClochetteReverb1.aif"));
	playBuf = (playBuf[0] + playBuf[1]) * 0.5;
	Out.ar(0, 0.1 * PanAz.ar(4, playBuf, 0, orientation: 0));
}).add);
)
(
Synth(\test);
}