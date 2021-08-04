// Actual device on PC, need to change for mac.
(
s.options.device = "ASIO : Focusrite USB ASIO";
s.options.numOutputBusChannels = 4;
s.options.memSize = 1000000;
s.waitForBoot({
	"./common.scd".load;
	"./ritual.scd".load;
	"./biosphere.scd".load;

	~loadBiosphereBuffers.value;
	~loadRitualBuffers.value;
	~waitForBuffers.value({"Done reading buffers".postln;})
});
)

(
s.options.device = "ASIO : Realtek ASIO";
s.options.memSize = 1000000;
s.options.numOutputBusChannels = 2;
s.waitForBoot({
	"./common.scd".load;
	"./ritual.scd".load;
	"./biosphere.scd".load;

	~loadBiosphereBuffers.value;
	~loadRitualBuffers.value;
	~waitForBuffers.value({"Done reading buffers".postln;})
});
)


// Use this code block to test stuff out!
(
~volume = 0.3;
TempoClock.default.tempo = 90/60;

"./common.scd".load;
"./osc.scd".load;
"./biosphere.scd".load;
"./ritual.scd".load;
)

// Runs everything! Adjust durations and comment stuff out to run individual parts.
(
var runLoop, biosphere, ritual;

var biosphereFirstPhaseDuration = 192;
var biosphereSecondPhaseDuration = 192;
var biosphereThirdPhaseDuration = 192;
var biosphereTotal = biosphereFirstPhaseDuration + biosphereSecondPhaseDuration + biosphereThirdPhaseDuration;

var pause = 8;

var firstPhaseDuration = 192;
var secondPhaseDuration = 192;
var thirdPhaseDuration = 192;
var fourthPhaseDuration = 192;
var fifthPhaseDuration = 192;
var total = biosphereFirstPhaseDuration + biosphereSecondPhaseDuration + biosphereThirdPhaseDuration + pause + firstPhaseDuration + secondPhaseDuration + thirdPhaseDuration + fourthPhaseDuration + fifthPhaseDuration;


~volume = 0.3;
TempoClock.default.tempo = 90/60;

"./common.scd".load;
"./osc.scd".load;
"./biosphere.scd".load;
"./ritual.scd".load;

// Chapters follow each other in a pseq since they have a pause in between them.
// Inside chapters, parts are all in a Ppar since they have overlap. If a part needs to wait for
// a previous part to complete, it uses a Pseq with Event.silent.  If a sound needs to bleed into
// the next part, it uses a longer duration, e.g. 'gouttes' lasts for several parts.

biosphere = Ppar([
	Ppar([
		Pseq([Event.silent(32), ~gouttes.value(biosphereFirstPhaseDuration + biosphereSecondPhaseDuration - 16)]),
		Pseq([~nappeBaleine.value(biosphereFirstPhaseDuration + 8)]),
		Pseq([Event.silent(16), ~owls.value(biosphereFirstPhaseDuration - 8)]),
		Pseq([Event.silent(8), ~sirens.value(biosphereFirstPhaseDuration - 8)]),
	]),
	Pseq([
		Event.silent(biosphereFirstPhaseDuration),
		Ppar([
			Pseq([~melodie.value(biosphereSecondPhaseDuration)]),
			Pseq([~owls.value(biosphereSecondPhaseDuration + 32)])
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
]);

ritual = Pseq([Event.silent(biosphereTotal + pause), Ppar([
	Pseq([Event.silent(0), Ppar([
		~singleActionPattern.value(~launchRondRouge),
		~singleActionPattern.value(~launchParticules),
		~grillons.value(firstPhaseDuration + 32, grillonsClips: true),
		Pseq([Event.silent(4), ~clochettes.value(firstPhaseDuration - 4)]),
		~bass.value(firstPhaseDuration, rarement: true, launchBassOndeRouge: true)
	])]),
	Pseq([Event.silent(firstPhaseDuration), Ppar([
		Pseq([Event.silent(16), ~bassVoiceShaman.value(secondPhaseDuration - 8, totem: true)]),
		Pseq([Event.silent(0), ~murmuresLoops.value(secondPhaseDuration - 0)]),
		Pseq([
			Event.silent(8),
			Ppar([
				~singleActionPattern.value(~clearParticules),
				~hiboux.value(secondPhaseDuration - 8, tribalClip: true),
				~singleActionPattern.value(~launchBouleClip),
				~singleActionPattern.value(~launchFondRougeRitualPart2Clip)
			])
		]),
	])]),
	Pseq([Event.silent(firstPhaseDuration + secondPhaseDuration), Ppar([
		~kick.value(thirdPhaseDuration + 1),
		~murmuresLoops.value(thirdPhaseDuration, fougeresRondes: true),
		~singleActionPattern.value(~removeRedBackgroundAtEndOfRitualPart2),
		~singleActionPattern.value(~launchRabbit),
		~singleActionPattern.value(~launchKickParticles),
	])]),
	Pseq([Event.silent(firstPhaseDuration + secondPhaseDuration + thirdPhaseDuration), Ppar([
		~murmures.value(fourthPhaseDuration, tribalOverlay: true),
		Pseq([Event.silent(16), ~hiboux.value(fourthPhaseDuration - 16)]),
		~clochettes.value(fourthPhaseDuration + 32, rarement: true),
		~feuillesNappe.value(fourthPhaseDuration + 16, tribal8: true),
		~singleActionPattern.value(~removeKickParticles),
		~singleActionPattern.value(~launchSnakeLoop),
		Pseq([Event.silent(fourthPhaseDuration - 16), ~singleActionPattern.value(~launchEndOfRitual4Circle)])
	])]),
	Pseq([Event.silent(firstPhaseDuration + secondPhaseDuration + thirdPhaseDuration + fourthPhaseDuration), Ppar([
		Pseq([Event.silent(32), ~drumRack.value(fifthPhaseDuration - 32)]),
		~bassVoiceShaman.value(fifthPhaseDuration, withFifth: false)
	])])
])]);


runLoop = {
	Ppar([biosphere, ritual]).play;
};

// Adjust the number inside Array.series() to adjust the number of loops.
Array.series(1).do { | i |
	s.record("C:/Users/jonathan/Desktop/scc/loop.aiff", 0, 4);
	TempoClock.default.sched(total * i, runLoop);
	TempoClock.default.sched(total, { s.stopRecording });
};
)

