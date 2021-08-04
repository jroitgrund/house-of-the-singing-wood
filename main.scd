// Actual device on PC, need to change for mac.
(
s.options.device = "ASIO : Focusrite USB ASIO";
s.options.numOutputBusChannels = 4;
s.options.memSize = 1000000;
s.waitForBoot({
	~volume = 0.3;
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
	~volume = 0.3;
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
TempoClock.default.tempo = 90/60;

"./common.scd".load;
"./osc.scd".load;
"./biosphere.scd".load;
"./ritual.scd".load;
)

// Runs everything! Adjust durations and comment stuff out to run individual parts.
(
var fullLoop, biosphere, ritual;

var biosphereFirstPhaseDuration = 448;
var biosphereSecondPhaseDuration = 448;
var biosphereThirdPhaseDuration = 448;
var biosphereTotalDuration = (
	biosphereFirstPhaseDuration
	+ biosphereSecondPhaseDuration
	+ biosphereThirdPhaseDuration
);

var pause = 8;

var ritualFirstPhaseDuration = 448;
var ritualSecondPhaseDuration = 448;
var ritualThirdPhaseDuration = 448;
var ritualFourthPhaseDuration = 448;
var ritualFifthPhaseDuration = 448;

var total = (
	biosphereFirstPhaseDuration
	+ biosphereSecondPhaseDuration
	+ biosphereThirdPhaseDuration
	+ pause
	+ ritualFirstPhaseDuration
	+ ritualSecondPhaseDuration
	+ ritualThirdPhaseDuration
	+ ritualFourthPhaseDuration
	+ ritualFifthPhaseDuration
);


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
	Pseq([
		Event.silent(0),
		~biospherePart1.value(biosphereFirstPhaseDuration, biosphereSecondPhaseDuration)
	]),
	Pseq([
		Event.silent(biosphereFirstPhaseDuration),
		~biospherePart2.value(biosphereSecondPhaseDuration)
	]),
	Pseq([
		Event.silent(biosphereFirstPhaseDuration + biosphereSecondPhaseDuration),
		~biospherePart3.value(biosphereThirdPhaseDuration)
	])
]);

ritual = Ppar([
	Pseq([
		Event.silent(0),
		~ritualPart1.value(ritualFirstPhaseDuration)
	]),
	Pseq([
		Event.silent(ritualFirstPhaseDuration),
		~ritualPart2.value(ritualSecondPhaseDuration)
	]),
	Pseq([
		Event.silent(ritualFifthPhaseDuration + ritualSecondPhaseDuration),
		~ritualPart3.value(ritualThirdPhaseDuration)
	]),
	Pseq([
		Event.silent(ritualFifthPhaseDuration + ritualSecondPhaseDuration + ritualThirdPhaseDuration),
		~ritualPart4.value(ritualFourthPhaseDuration)
	]),
	Pseq([
		Event.silent(ritualFirstPhaseDuration + ritualSecondPhaseDuration + ritualThirdPhaseDuration + ritualFourthPhaseDuration),
		~ritualPart5.value(ritualFifthPhaseDuration)
	]),
]);


fullLoop = {
	Ppar([
		biosphere,
		Pseq([Event.silent(biosphereTotalDuration), Event.silent(pause), ritual]);
	]).play;
};

// Adjust the number inside Array.series() to adjust the number of loops.
Array.series(1).do { | i |
	s.record("C:/Users/jonathan/Desktop/scc/loop.aiff", 0, 4);
	TempoClock.default.sched(total * i, fullLoop);
	TempoClock.default.sched(total, { s.stopRecording });
};
)
