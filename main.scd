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
var firstPhaseDuration = 32;
var secondPhaseDuration = 32;
var thirdPhaseDuration = 32;
var fourthPhaseDuration = 32;
var fifthPhaseDuration = 32;
TempoClock.default.tempo = 90/60;
"./common.scd".load;
"./playLoop.scd".load;

runLoop = {
	Ppar([
		Pseq([Event.silent(0), Ppar([
			~grillons.value(firstPhaseDuration + 16),
			~clochettes.value(firstPhaseDuration),
			~bass.value(firstPhaseDuration, rarement: true)
		])]),
		Pseq([Event.silent(firstPhaseDuration), Ppar([
			~bassVoiceShaman.value(secondPhaseDuration),
			Pseq([Event.silent(8), ~murmuresLoops.value(secondPhaseDuration - 8)]),
			Pseq([Event.silent(8), ~hiboux.value(secondPhaseDuration - 8)]),
		])]),
		Pseq([Event.silent(firstPhaseDuration + secondPhaseDuration), Ppar([
			~kick.value(thirdPhaseDuration),
			~snareTom.value(thirdPhaseDuration),
			~murmuresLoops.value(thirdPhaseDuration)
		])]),
		Pseq([Event.silent(firstPhaseDuration + secondPhaseDuration + thirdPhaseDuration), Ppar([
			~murmuresLoops.value(fourthPhaseDuration),
			~hiboux.value(fourthPhaseDuration),
			~clochettes.value(fourthPhaseDuration, rarement: true),
			~feuillesNappe.value(fourthPhaseDuration),
		])]),
		Pseq([Event.silent(firstPhaseDuration + secondPhaseDuration + thirdPhaseDuration + fourthPhaseDuration), Ppar([
			~drumRack.value(64),
			~bassVoiceShaman.value(64)
		])])
	]).play;
};

Routine({
	var total = firstPhaseDuration + secondPhaseDuration + thirdPhaseDuration + fourthPhaseDuration + fifthPhaseDuration;

	2.wait;

	Array.series(10).do { | i |
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
	//~feuillesNappe.value(64).play; // perhaps needs some enveloping
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
		/*Pseq([Event.silent(0), Ppar([
			~grillons.value(32),
			~clochettes.value(32),
			~bass.value(32, rarement: true)
		])]).play;*/
		Ppar([Ppar([
		~bassVoiceShaman.value(32),
			// ~murmuresLoops.value(32),
		// ~hiboux.value(32)
	]), Pbind(\dur, Pseq([Rest(31), 1]))]).play(TempoClock.default);
		/*Pseq([Event.silent(firstPhaseDuration + secondPhaseDuration), Ppar([
			~kick.value(thirdPhaseDuration),
			~snareTom.value(thirdPhaseDuration),
			~murmuresLoops.value(thirdPhaseDuration)
		])]),
		Pseq([Event.silent(firstPhaseDuration + secondPhaseDuration + thirdPhaseDuration), Ppar([
			~murmuresLoops.value(fourthPhaseDuration),
			~hiboux.value(fourthPhaseDuration),
			~clochettes.value(fourthPhaseDuration, rarement: true),
			~feuillesNappe.value(fourthPhaseDuration),
		])]),
		Pseq([Event.silent(firstPhaseDuration + secondPhaseDuration + thirdPhaseDuration + fourthPhaseDuration), Ppar([
			~drumRack.value(64),
			~bassVoiceShaman.value(64)
		])])*/
}).play;
)
