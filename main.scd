// Actual device on PC, need to change for mac.
(
s.options.device = "ASIO : Focusrite USB ASIO";
s.options.numOutputBusChannels = 4;
s.options.memSize = 1000000;
s.reboot;
)


// Just for convenience if switching to internal laptop sound card.
(
s.options.device = "ASIO : Realtek ASIO";
s.options.memSize = 1000000;
s.options.numOutputBusChannels = 2;
s.reboot;
);


// Runs everything! Adjust durations and comment stuff out to run individual parts.
(
var runLoop;

var biosphereFirstPhaseDuration = 64;
var biosphereSecondPhaseDuration = 64;
var biosphereThirdPhaseDuration = 64;

var pause = 8;

var firstPhaseDuration = 64;
var secondPhaseDuration = 64;
var thirdPhaseDuration = 64;
var fourthPhaseDuration = 64;
var fifthPhaseDuration = 64;
var total = biosphereFirstPhaseDuration + biosphereSecondPhaseDuration + biosphereThirdPhaseDuration + pause + firstPhaseDuration + secondPhaseDuration + thirdPhaseDuration + fourthPhaseDuration + fifthPhaseDuration;

TempoClock.default.tempo = 90/60;

"./common.scd".load;
"./osc.scd".load;
"./biosphere.scd".load;
"./ritual.scd".load;

// Chapters follow each other in a pseq since they have a pause in between them.
// Inside chapters, parts are all in a Ppar since they have overlap. If a part needs to wait for
// a previous part to complete, it uses a Pseq with Event.silent.  If a sound needs to bleed into
// the next part, it uses a longer duration, e.g. 'gouttes' lasts for several parts.
runLoop = {
	Pseq([
		// Biosphere
		// I hear weird noise sometimes in the first part here, needs debugging!
		Ppar([
			Ppar([
				Pseq([Event.silent(32), ~gouttes.value(biosphereFirstPhaseDuration + biosphereSecondPhaseDuration - 16)]),
				Pseq([~owlNappe.value(biosphereFirstPhaseDuration + 8)]),
				Pseq([Event.silent(16), ~owls.value(biosphereFirstPhaseDuration - 8)]),
			]),
			Pseq([
				Event.silent(biosphereFirstPhaseDuration),
				Ppar([
					Pseq([~melodie.value(biosphereSecondPhaseDuration)]),
					Pseq([~owls.value(biosphereSecondPhaseDuration + 32, rarement: true)])
				])
			]),
			Pseq([
				Event.silent(biosphereFirstPhaseDuration + biosphereSecondPhaseDuration),
				Ppar([
					Pseq([Event.silent(32), ~birds.value(biosphereThirdPhaseDuration - 32)]),
					Pseq([Event.silent(24), ~frog.value(biosphereSecondPhaseDuration - 24)]),
					Pseq([~water.value(biosphereSecondPhaseDuration)]),
				])
			]),
		]),

		// This pauses longer than expected (too long?. Not 100% sure why.
		Event.silent(pause),

		// Ritual
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
				Pseq([Event.silent(16), ~hiboux.value(fourthPhaseDuration - 16)]),
				~clochettes.value(fourthPhaseDuration + 32, rarement: true),
				~feuillesNappe.value(fourthPhaseDuration + 16),
			])]),
			Pseq([Event.silent(firstPhaseDuration + secondPhaseDuration + thirdPhaseDuration + fourthPhaseDuration), Ppar([
				Pseq([Event.silent(32), ~drumRack.value(fifthPhaseDuration - 32)]),
				~bassVoiceShaman.value(fifthPhaseDuration, withFifth: false)
			])])
		])
	]).play;
};

// Adjust the number inside Array.series() to adjust the number of loops.
Routine({
	~waitForBuffers.value({
		Array.series(1).do { | i |
			TempoClock.default.sched(total * i, runLoop);
		};
	});
}).play;
)


(
TempoClock.default.tempo = 90/60;

"./common.scd".load;
"./osc.scd".load;
"./biosphere.scd".load;
"./ritual.scd".load;

~waitForBuffers.value({
	~melodie.value(64).play;
});
)