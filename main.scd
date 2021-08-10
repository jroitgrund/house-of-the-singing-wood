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
~volume = 1.0;
TempoClock.default.tempo = 90/60;

"./common.scd".load;
"./osc.scd".load;
"./biosphere.scd".load;
"./ritual.scd".load;
//~clearBiospherePart1.value;
//~clearBiospherePart2.value;
//~clearBiospherePart3.value;
~biospherePart3.value(128).play;
)

// Runs everything! Adjust durations and comment stuff out to run individual parts.
(
var getFullLoop, allLoops, minutesToDuration;
~volume = 1;
TempoClock.default.tempo = 90/60;

"./common.scd".load;
"./osc.scd".load;
"./biosphere.scd".load;
"./ritual.scd".load;

minutesToDuration = {
	| min, max |
	rrand(min * 96 * 0.25, max * 96 * 0.25).round(32);
};

getFullLoop = {
	var biosphereFirstPhaseDuration = minutesToDuration.value(6, 8);
	var biosphereSecondPhaseDuration = minutesToDuration.value(4, 6);
	var biosphereThirdPhaseDuration = minutesToDuration.value(2, 5);
	var biosphereTotalDuration = (
		biosphereFirstPhaseDuration
		+ biosphereSecondPhaseDuration
		+ biosphereThirdPhaseDuration
	);

	var pause = 32;
	var ritualFirstPhaseDuration = minutesToDuration.value(4, 7);
	var ritualSecondPhaseDuration = minutesToDuration.value(4, 7);
	var ritualThirdPhaseDuration = minutesToDuration.value(3, 5);
	var ritualFourthPhaseDuration = minutesToDuration.value(3, 5);
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
	);

	[
		Ppar([
			~biosphere.value(biosphereFirstPhaseDuration, biosphereSecondPhaseDuration, biosphereThirdPhaseDuration),
			Pseq([
				Event.silent(biosphereTotalDuration),
				Event.silent(pause),
				~ritual.value(ritualFirstPhaseDuration, ritualSecondPhaseDuration, ritualThirdPhaseDuration, ritualFourthPhaseDuration, ritualFifthPhaseDuration)
			])
		]),
		totalDuration
	];
};

allLoops = {
	var wait = 0;
	// Adjust the number inside Array.series() to adjust the number of loops.
	Array.series(1).do { | i |
		var result = getFullLoop.value;
		var fullLoop = result[0];
		var totalDuration = result[1];
		s.record("C:/Users/jonathan/Desktop/scc/loop.aiff", 0, 2);
		TempoClock.default.sched(wait, { fullLoop.play });
		TempoClock.default.sched(wait + totalDuration, { s.stopRecording });
		wait = wait + totalDuration;
	};
};

allLoops.value;
)
