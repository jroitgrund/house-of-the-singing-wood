(
var loadedBuffers;
var makeSynthDef = {
	|name, numChannels|
	SynthDef.new(name, {
		| out, buf, amp = 1.0, ampBus = -1, pitchRatio = 0, window = 0.2, hpf = 0, rate = 1, hardPan = -1, panBus = -1, atk = -1, sus = -1, rel = 1000000, lpfBus = -1, lpf = 20000, revTime = 0, delayTime = 0, delayRepeat = 40, lfoSpeed = 0, loop = 0, loopAtk = -1, loopSus = -1, loopRel = -1, gate = 1, gateRelease = 0, lpfRq = 1, loopEnvOutBus = nil, envOutBus = nil, ampOutBus = nil, amp0OutBus = nil, amp1OutBus = nil, amp2OutBus = nil, amp3OutBus = nil |
		var envelope, sound, ampBusEnvelope, loopEnvelope, pan, left, right, middle, linen, delay;

		// Used to release synths when a pattern event ends and triggers a note off event, setting gate to zero.
		linen = Linen.kr(gate, releaseTime: gateRelease, doneAction: 2);

		// Load buffer
		sound = PlayBuf.ar(2, buf, rate, loop: loop);

		// Apply pitch shift if set
		sound = Select.ar(pitchRatio > 0, [sound, PitchShift.ar(sound, windowSize: window, pitchRatio: pitchRatio)]);

		// Apply HPF if set
		sound = Select.ar(hpf > 0, [sound, HPF.ar(sound, hpf)]);

		// Apply LPF from bus if set.
		sound = Select.ar(lpfBus >= 0, [sound, RLPF.ar(sound, In.kr(lpfBus), lpfRq)]);

		// Apply delay if set. Both number of repeats and delay time are configurable.
		delay = Select.ar(delayTime > 0, [
			Silent.ar,
			AllpassC.ar(
				sound,
				delayTime * delayRepeat,
				delayTime,
				delayTime * delayRepeat)
		]);

		sound = sound + delay;

		// Dead code, this is supposed to be used for the ping pong delay.
		// delay = (delay[0] + delay[1]) * 0.5;
		// delay = PanAz.ar(4, delay, hardPan + ~getPanPositionEnvelope.value(delayTime));

		// Get envelope if set.
		envelope = Select.kr(atk >= 0, [1, EnvGen.kr(Env([0, 1, 1, 0], [atk, sus, rel]))]);

		// An envelope which loops throughout the sample. Can be used to fade the sample in and out.
		// We don't use this much, maybe we should, the extra dynamics could liven things up.
		loopEnvelope = Select.kr(loopAtk >=0, [1, EnvGen.kr(Env([0, 0, 1, 1, 0, 0], [0, loopAtk, loopSus, loopRel, 0], loopNode: 0, releaseNode: 4))]);

		// Get envelope from control amp if set.
		ampBusEnvelope = Select.kr(ampBus >= 0, [1, In.kr(ampBus)]);

		// Apply envelopes.
		sound = sound * envelope * ampBusEnvelope * loopEnvelope * amp * linen * 0.3;

		// Split into two channels.
		left = sound[0];
		right = sound[1];

		/**
		 * Set middle and left channels.
		 * Middle is two stereo channels split evenly across four speakers, and used when we don't pan.
		 * Left and right are a 4-speaker pan of each stereo channel, offset by 0.25
		 * We play either middle or both left and right.
		 */
		pan = Select.kr(hardPan >= 0, [In.kr(panBus), hardPan]);
		middle = [sound[0] * 0.25, sound[0] * 0.25, sound[1] * 0.25, sound[1] * 0.25];
		left = PanAz.ar(4, left, pan + 0.01, orientation: 0);
		right = PanAz.ar(4, right, pan - 0.01, orientation: 0);

		Out.ar(out, Splay.ar(Select.ar(
			panBus >= 0,
			[Select.ar(hardPan >= 0, [middle, left + right]),
			left + right])));

		// Write to OSC buses.
		Out.kr(loopEnvOutBus, loopEnvelope);
		Out.kr(envOutBus, envelope);
		Out.kr(ampOutBus, WAmp.kr(Amplitude.ar(sound), 1 / 10));
		Out.kr(amp0OutBus, WAmp.kr(Amplitude.ar(left[0] + right[0]), 1 / 10));
		Out.kr(amp1OutBus, WAmp.kr(Amplitude.ar(left[1] + right[1]), 1 / 10));
		Out.kr(amp2OutBus, WAmp.kr(Amplitude.ar(left[2] + right[2]), 1 / 10));
		Out.kr(amp3OutBus, WAmp.kr(Amplitude.ar(left[3] + right[3]), 1 / 10));
	}).add;
};

makeSynthDef.value(\play, 2);

// In all these control synths, linen is just used to free the synth with a pattern node off event.
SynthDef.new(\ampControl, {
	|controlBus, atk, sus, rel, gate = 1|
	var linen = Linen.kr(gate, doneAction: 2);
	Out.kr(controlBus, EnvGen.kr(Env([0, 1, 1, 0], [atk, sus, rel])));
}).add;

// This is a bit tricky to use because you can't retrigger this with a different direction and
// phase, as this would cause the sound to "jump". We get around this by having the duration of
// each panControl note be a multiple of the frequency, so that the audio is always at e.g. '0'
// when changing direction.
// waver is used to add a glitchy back and forth LFO to the pan, this is used on the melody
// in part 2 of biosphere.
SynthDef.new(\panControl, {
	| controlBus, freq, iphase, direction = 1, gate = 1, waver = 0 |
	var linen = Linen.kr(gate, doneAction: 2);
	Out.kr(controlBus, LFSaw.kr(freq, iphase, direction) + SinOsc.kr(freq * 20, mul: waver));
}).add;


// This low pass is mostly useless except on the cave tom, because many of our sounds don't span
// large frequency ranges.
SynthDef.new(\lpfControl, {
	| controlBus, min, max, freq, duration, phase = 0, gate = 1 |
	var linen = Linen.kr(gate, doneAction: 2);
	Out.kr(controlBus, SinOsc.kr(freq, mul: (max - min) / 2, add: min + (max - min) / 2, phase: phase));
}).add;

~readContentsAsBuffers = {
	|path|
	PathName(path).entries.collect { |fn| Buffer.read(s, fn.fullPath); };
};

// This creates a function "loaded" which buffers call when they're done loading a sample.
// Then, in main, we use "waitForBuffers" to make sure all 21 samples are loaded before playing.
// Without this the buffer ugen bug happens all the time.
// This prevents it from happening after rebooting the server, although it still ends up happening
// eventually. See also https://scsynth.org/t/buffer-ugen-no-buffer-data/4319
loadedBuffers = 0;
~loaded = { loadedBuffers = loadedBuffers + 1; };
~waitForBuffers = {
	| action |
	Routine({
		while({ loadedBuffers < 21 }, {
			("Loaded" + loadedBuffers + "buffers").postln;
			1.wait;
		});
		("Loaded" + loadedBuffers + "buffers").postln;
		1.wait;
		action.value;
	}).play;
};

// Everything under here is unused for now, mostly OSC stuff.
~resolume = NetAddr.new("localhost", 7000);

Event.addEventType(\action, {});

~getPanPositionEnvelope = {
	| twentiethJumpDuration |
	EnvGen.kr(Env(
		[0, 0, 0.1, -0.2, 0.3, -0.4, 0.5, -0.6, 0.7, -0.8, 0.9, -1, -1.1, 1.2, -1.3, 1.4, -1.5, 1.6, -1.7, 1.8, -1.9, 0],
		[0] + (twentiethJumpDuration!19) + [0],
		loopNode: 0,
		releaseNode: 20,
		curve: 'hold'
	));
};

~basePath = "C:/Users/jonathan/Desktop/scc/sons/";
)