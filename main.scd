// Actual device on PC, need to change for mac.
(
s.options.outDevice = "Scarlett 8i6 USB";
s.options.numOutputBusChannels = 4;
s.options.memSize = 1000000;
s.waitForBoot({
	~volume = 0.3;
	"/Users/lewismurray/house-of-the-singing-wood/common.scd".load;
	"/Users/lewismurray/house-of-the-singing-wood/ritual.scd".load;
	"/Users/lewismurray/house-of-the-singing-wood/biosphere.scd".load;

	~loadBiosphereBuffers.value;
	~loadRitualBuffers.value;
	~waitForBuffers.value({"Done reading buffers".postln;})
});
)

(
s.options.device = nil;
s.options.memSize = 1000000;
s.options.numOutputBusChannels = 4;
s.waitForBoot({
	~volume = 0.3;
	"/Users/lewismurray/house-of-the-singing-wood/common.scd".load;
	"/Users/lewismurray/house-of-the-singing-wood/ritual.scd".load;
	"/Users/lewismurray/house-of-the-singing-wood/biosphere.scd".load;

	~loadBiosphereBuffers.value;
	~loadRitualBuffers.value;
	~waitForBuffers.value({"Done reading buffers".postln;})
});
)

// Use this code block to test stuff out!
(
~volume = 0.8;
TempoClock.default.tempo = 90/60;

"/Users/lewismurray/house-of-the-singing-wood/common.scd".load;
"/Users/lewismurray/house-of-the-singing-wood/osc.scd".load;
"/Users/lewismurray/house-of-the-singing-wood/biosphere.scd".load;
"/Users/lewismurray/house-of-the-singing-wood/ritual.scd".load;
Pseq([
	~singleActionPattern.value(~clearAllLayers.value),
	Rest(1),
	~ritualPart2.value(64)
]).play;
)

// Runs everything! Adjust durations and comment stuff out to run individual parts.
(
var getFullLoop, allLoops, minutesToDuration;
~volume = 1;
TempoClock.default.tempo = 90/60;

"/Users/lewismurray/house-of-the-singing-wood/common.scd".load;
"/Users/lewismurray/house-of-the-singing-wood/osc.scd".load;
"/Users/lewismurray/house-of-the-singing-wood/biosphere.scd".load;
"/Users/lewismurray/house-of-the-singing-wood/ritual.scd".load;

minutesToDuration = {
	| min, max |
	rrand(min * 96 * 1, max * 96 * 1).round(32);
};

getFullLoop = {
	var biosphereFirstPhaseDuration = minutesToDuration.value(8, 10);
	var biosphereSecondPhaseDuration = minutesToDuration.value(6, 8);
	var biosphereThirdPhaseDuration = minutesToDuration.value(6, 8);
	var biosphereTotalDuration = (
		biosphereFirstPhaseDuration
		+ biosphereSecondPhaseDuration
		+ biosphereThirdPhaseDuration
	);

	var pause = 32;
	var ritualFirstPhaseDuration = minutesToDuration.value(1, 2);
	var ritualSecondPhaseDuration = minutesToDuration.value(6, 7);
	var ritualThirdPhaseDuration = minutesToDuration.value(5, 7);
	var ritualFourthPhaseDuration = minutesToDuration.value(6, 8);
	var ritualFifthPhaseDuration = minutesToDuration.value(6, 8);

	var totalDuration = (
		biosphereFirstPhaseDuration
		+ biosphereSecondPhaseDuration
		+ biosphereThirdPhaseDuration
		+ pause
		+ ritualFirstPhaseDuration
		+ ritualSecondPhaseDuration
		+ ritualThirdPhaseDuration
		+ ritualFourthPhaseDuration
		+ ritualFifthPhaseDuration
		+ pause
	);

	[
		Ppar([
			Pseq([
				~singleActionPattern.value(~selectBiosphere),
			    ~biosphere.value(biosphereFirstPhaseDuration, biosphereSecondPhaseDuration, biosphereThirdPhaseDuration)
			]),
			Pseq([
				Event.silent(biosphereTotalDuration),
				Event.silent(pause),
				~singleActionPattern.value(~selectRitual),
				~ritual.value(ritualFirstPhaseDuration, ritualSecondPhaseDuration, ritualThirdPhaseDuration, ritualFourthPhaseDuration, ritualFifthPhaseDuration)
			])
		]),
		totalDuration
	];
};

allLoops = {
	var wait = 0;
	// Adjust the number inside Array.series() to adjust the number of loops.
	~record.value;
	Array.series(1).do { | i |
		var result = getFullLoop.value;
		var fullLoop = result[0];
		var totalDuration = result[1];
		s.record("/Users/lewismurray/house-of-the-singing-wood/loop.aiff", 0, 4);
		TempoClock.default.sched(wait, { fullLoop.play });
		TempoClock.default.sched(wait + totalDuration, { s.stopRecording; ~stopRecording.value });
		wait = wait + totalDuration;
	};
};

allLoops.value;
)
