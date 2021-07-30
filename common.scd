(
var makeSynthDef = {
	|name, numChannels|
	SynthDef.new(name, {
		| out, buf, amp = 1.0, ampBus = -1, pitchRatio = 0, window = 0.2, hpf = 0, rate = 1, panBus = -1, atk = -1, sus = -1, rel = -1, lpfBus = -1, revTime = 0, delayTime = 0, lfoSpeed = 0, duration, loop = 0, loopAtk = -1, loopSus = -1, loopRel = -1, loopEnvOutBus = nil, envOutBus = nil |
		var envelope, sound, ampBusEnvelope, loopEnvelope, pan, left, right, middle;

		// Load buffer
		sound = PlayBuf.ar(2, buf, rate, loop: loop);

		// Apply pitch shift if set
		sound = Select.ar(pitchRatio > 0, [sound, PitchShift.ar(sound, windowSize: window, pitchRatio: pitchRatio)]);

		// Apply HPF if set
		sound = Select.ar(hpf > 0, [sound, HPF.ar(sound, hpf)]);

		/**
		 * TODO-LEWIS: I don't get what this is doing, looks like a low pass with the values being set by a sin osc going from 0 to 1.
		 * This means it will filter all sounds above 1khz, or all sounds above 0khz. That doesn't sound right.
		 */
		sound = Select.ar(lpfBus >= 0, [sound, LPF.ar(sound, In.kr(lpfBus))]);

		// Apply delay and reverb if set.
		sound =  Select.ar(delayTime > 0, [sound, AllpassC.ar(sound, 2, delayTime)]);

		// Get envelope if set.
		envelope = Select.kr(atk >= 0, [EnvGen.kr(Env([1, 1], [duration]), doneAction: 2), EnvGen.kr(Env([0, 1, 1, 0, 0], [atk, sus, rel, duration]), doneAction: 2)]);

		loopEnvelope = Select.kr(loopAtk >=0, [1, EnvGen.kr(Env([0, 0, 1, 1, 0, 0], [0, loopAtk, loopSus, loopRel, 0], loopNode: 0, releaseNode: 4))]);

		// Get global envelope from control amp if set.
		ampBusEnvelope = Select.kr(ampBus >= 0, [1, In.kr(ampBus)]);

		// Apply envelopes.
		sound = sound * envelope * ampBusEnvelope * loopEnvelope;

		// Split into two channels.
		left = sound[0];
		right = sound[1];

		/**
		 * Set middle and left channels.
		 * Middle is two stereo channels split evenly across four speakers, and used when we don't pan.
		 * Left and right are a 4-speaker pan of each stereo channel, offset by 0.25
		 * We play either middle or both left and right.
		 */
		pan = In.kr(panBus);
		middle = [sound[0] * 0.25, sound[0] * 0.25, sound[1] * 0.25, sound[1] * 0.25];
		left = PanAz.ar(4, left, pan, orientation: -0.25);
		right = PanAz.ar(4, right, pan, orientation: 0.25);

		Out.ar(out, Select.ar(panBus >= 0, [middle, left + right]));

		// Write to OSC buses.
		Out.kr(loopEnvOutBus, loopEnvelope);
		Out.kr(envOutBus, envelope);
	}).add;
};

makeSynthDef.value(\play, 2);

SynthDef.new(\control, {
	|controlBus, silence, attack, sustainTime, release|
	Out.kr(controlBus, EnvGen.kr(Env([0, 0, 1, 1, 0], [silence, attack, sustainTime, release]), doneAction: 2))
}).add;

SynthDef.new(\panControl, {
	| controlBus, freq |
	Out.kr(controlBus, LFSaw.kr(freq));
}).add;

SynthDef.new(\lpfControl, {
	| controlBus, min, max, freq |
	Out.kr(controlBus, SinOsc.kr(freq, mul: (max - min) / 2, add: min + (max - min) / 2));
}).add;

~readContentsAsBuffers = {
	|path|
	PathName(path).entries.collect { |fn| Buffer.read(s, fn.fullPath); };
};

~getPollBufferAndSendAsOscRoutine = {
	| oscServer, bus, oscMessage, multiply = 1, add = 0 |
	Routine({
		loop {
			bus.get({
				| value |
				value = value * multiply + add;
				oscServer.sendMsg(oscMessage, value);
			});
			(1/60).wait;
		}
	});
};

~touchDesigner = NetAddr.new("localhost", 10000);

Event.addEventType(\oscEvent, {
	var noteEvent;
	~oscServer.sendMsg(~eventName, ~eventValue);
	if (
		~playSynth != nil && ~playSynth == true,
		{
		noteEvent = currentEnvironment.copy;
		noteEvent.use { 
			~type = \note;
		};
		noteEvent.play;
		},
		{}
	);

	if (~offEventValue != nil) {
		Routine({
			((2/16)/TempoClock.default.tempo).wait;
			~oscServer.sendMsg(~eventName, ~offEventValue);
		}).play;
	}
});
)