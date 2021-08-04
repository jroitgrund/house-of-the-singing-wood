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
var getFullLoop, allLoops;
~volume = 1;
TempoClock.default.tempo = 90/60;

"./common.scd".load;
"./osc.scd".load;
"./biosphere.scd".load;
"./ritual.scd".load;

getFullLoop = {
	var biosphereFirstPhaseDuration = 64;
	var biosphereSecondPhaseDuration = 64;
	var biosphereThirdPhaseDuration = 64;
	var biosphereTotalDuration = (
		biosphereFirstPhaseDuration
		+ biosphereSecondPhaseDuration
		+ biosphereThirdPhaseDuration
	);

	var pause = 8;

	var ritualFirstPhaseDuration = 64;
	var ritualSecondPhaseDuration = 64;
	var ritualThirdPhaseDuration = 64;
	var ritualFourthPhaseDuration = 64;
	var ritualFifthPhaseDuration = 64;

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
		s.record("C:/Users/jonathan/Desktop/scc/loop.aiff", 0, 4);
		TempoClock.default.sched(wait, { fullLoop.play });
		TempoClock.default.sched(wait + totalDuration, { s.stopRecording });
		wait = wait + totalDuration;
	};
};

allLoops.value;
)
