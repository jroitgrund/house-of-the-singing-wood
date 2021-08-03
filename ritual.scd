(
var drumRackAmpBus = Bus.control(s, 1);
	
var coilPanBus = Bus.control(s, 1);
var coilAmpBus = Bus.control(s, 1);
var coilLowPassBus = Bus.control(s, 1);
var coilAmpOutBus = Bus.control(s, 1);

var cricket1PanBus = Bus.control(s, 1);
var cricket1AmpBus = Bus.control(s, 1);
var cricket1LowPassBus = Bus.control(s, 1);
var cricket1AmpOutBus = Bus.control(s, 1);

var cricket2PanBus = Bus.control(s, 1);
var cricket2AmpBus = Bus.control(s, 1);
var cricket2LowPassBus = Bus.control(s, 1);
var cricket2AmpOutBus = Bus.control(s, 1);

var hhdelayPanBus = Bus.control(s, 1);
var hhdelayAmpBus = Bus.control(s, 1);
var hhdelayLowPassBus = Bus.control(s, 1);
var hhdelayAmpOutBus = Bus.control(s, 1);

var kickPanBus = Bus.control(s, 1);
var kickAmpBus = Bus.control(s, 1);
var kickLowPassBus = Bus.control(s, 1);
var kickAmpOutBus = Bus.control(s, 1);

var kickDelayPanBus = Bus.control(s, 1);
var kickDelayAmpBus = Bus.control(s, 1);
var kickDelayLowPassBus = Bus.control(s, 1);
var kickDelayAmpOutBus = Bus.control(s, 1);

var snareTomPanBus = Bus.control(s, 1);
var snareTomAmpBus = Bus.control(s, 1);
var snareTomLowPassBus = Bus.control(s, 1);
var snareTomAmpOutBus = Bus.control(s, 1);

var tom1PanBus = Bus.control(s, 1);
var tom1AmpBus = Bus.control(s, 1);
var tom1LowPassBus = Bus.control(s, 1);
var tom1AmpOutBus = Bus.control(s, 1);

var grillonOneShotPanBus = Bus.control(s, 1);
var grillonOneShotPanBus2 = Bus.control(s, 1);
var grillonOneShotAmpBus = Bus.control(s, 1);
var grillonOneShotLowPassBus = Bus.control(s, 1);
var grillonOneShotLowPassBus2 = Bus.control(s, 1);
var grillonOneShotAmp0OutBus = Bus.control(s, 1);
var grillonOneShotAmp1OutBus = Bus.control(s, 1);
var grillonOneShotAmp2OutBus = Bus.control(s, 1);
var grillonOneShotAmp3OutBus = Bus.control(s, 1);

var feuillesNappePanBus = Bus.control(s, 1);
var feuillesNappeAmpBus = Bus.control(s, 1);
var feuillesNappeLowPassBus = Bus.control(s, 1);
var feuillesNappeAmpOutBus = Bus.control(s, 1);

var murmuresPanBus = Bus.control(s, 1);
var murmuresAmpBus = Bus.control(s, 1);
var murmuresLowPassBus = Bus.control(s, 1);
var murmuresAmpOutBus = Bus.control(s, 1);

var hibouxPanBus = Bus.control(s, 1);
var hibouxAmpBus = Bus.control(s, 1);
var hibouxLowPassBus = Bus.control(s, 1);
var hibouxAmpOutBus = Bus.control(s, 1);

var bassPanBus = Bus.control(s, 1);
var bassAmpBus = Bus.control(s, 1);
var bassLowPassBus = Bus.control(s, 1);
var bassAmpOutBus = Bus.control(s, 1);

var bassVoiceShamanPanBus = Bus.control(s, 1);
var bassVoiceShamanAmpBus = Bus.control(s, 1);
var bassVoiceShamanLowPassBus = Bus.control(s, 1);
var bassVoiceShamanAmpOutBus = Bus.control(s, 1);

var bassVoiceShaman2PanBus = Bus.control(s, 1);
var bassVoiceShaman2AmpBus = Bus.control(s, 1);
var bassVoiceShaman2LowPassBus = Bus.control(s, 1);
var bassVoiceShaman2AmpOutBus = Bus.control(s, 1);

var clochettesPanBus = Bus.control(s, 1);
var clochettesAmpBus = Bus.control(s, 1);
var clochettesLowPassBus = Bus.control(s, 1);
var clochettesAmpOutBus = Bus.control(s, 1);

var murmuresLoopsPanBus = Bus.control(s, 1);
var murmuresLoopsAmpBus = Bus.control(s, 1);
var murmuresLoopsLowPassBus = Bus.control(s, 1);
var murmuresLoopsAmpOutBus = Bus.control(s, 1);

~loadRitualBuffers = {
	~coilBuffer = Buffer.readChannel(s, ~basePath ++ "Chapitre3 - Rituel/DrumRackOneShot/coil.aif", action: ~loaded);
	~cricket1Buffer = Buffer.readChannel(s, ~basePath ++ "Chapitre3 - Rituel/DrumRackOneShot/cricket1.aif", action: ~loaded);
	~cricket2Buffer = Buffer.readChannel(s, ~basePath ++ "Chapitre3 - Rituel/DrumRackOneShot/cricket2.aif", action: ~loaded);
	~hhdelayBuffer = Buffer.readChannel(s, ~basePath ++ "Chapitre3 - Rituel/DrumRackOneShot/hhdelay.aif", action: ~loaded);
	~kickBuffer = Buffer.readChannel(s, ~basePath ++ "Chapitre3 - Rituel/DrumRackOneShot/kick.aif", action: ~loaded);
	~kickDelayBuffer = Buffer.readChannel(s, ~basePath ++ "Chapitre3 - Rituel/DrumRackOneShot/kickDelay.aif", action: ~loaded);
	~snareTomBuffer = Buffer.readChannel(s, ~basePath ++ "Chapitre3 - Rituel/DrumRackOneShot/snareTom.wav", action: ~loaded);
	~tom1Buffer = Buffer.readChannel(s, ~basePath ++ "Chapitre3 - Rituel/DrumRackOneShot/tom1.aif", action: ~loaded);
	~grillonOneShotBuffer = Buffer.readChannel(s, ~basePath ++ "Chapitre3 - Rituel/Grillons/GrillonOneShot.aif", action: ~loaded);
	~feuillesNappeBuffer = Buffer.readChannel(s, ~basePath ++ "Chapitre3 - Rituel/feuillesNappe.aif", action: ~loaded);
	~bassBuffer = Buffer.readChannel(s, ~basePath ++ "Chapitre3 - Rituel/Baaaaass.wav", action: ~loaded);
	~bassVoiceShamanBuffer = Buffer.readChannel(s, ~basePath ++ "Chapitre3 - Rituel/BassVoiceShaman.aif", action: ~loaded);

	~murmuresBuffers = ~readContentsAsBuffers.value(~basePath ++ "Chapitre3 - Rituel/MurmuresOneShot");
	~hibouxBuffers = ~readContentsAsBuffers.value(~basePath ++ "Chapitre3 - Rituel/Hiboux");
	~clochettesBuffers = ~readContentsAsBuffers.value(~basePath ++ "Chapitre3 - Rituel/ClochetteOneShot/ClochetteReverb");
	~murmuresLoopsBuffers = ~readContentsAsBuffers.value(~basePath ++ "Chapitre3 - Rituel/Murmures");
};

// Four different grillons loops, differing in their octave or in their pan direction.
~grillons = {
	| duration, grillonsClips = false |
	Ppar([
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \ampControl,
			\atk, 0,
			\sus, (duration - 32) / TempoClock.default.tempo,
			\rel, 32 / TempoClock.default.tempo,
			\controlBus, grillonOneShotAmpBus,
			\amp0OutBus, grillonOneShotAmp0OutBus,
			\amp1OutBus, grillonOneShotAmp1OutBus,
			\amp2OutBus, grillonOneShotAmp2OutBus,
			\amp3OutBus, grillonOneShotAmp3OutBus,
		),
		Pif(grillonsClips, ~pollActionPattern.value({
			grillonOneShotAmp0OutBus.get(~setGrillonsTopLeftOpacity);
			grillonOneShotAmp1OutBus.get(~setGrillonsTopRightOpacity);
			grillonOneShotAmp2OutBus.get(~setGrillonsBottomRightOpacity);
			grillonOneShotAmp3OutBus.get(~setGrillonsBottomLeftOpacity);
		}, duration), 0),
		Pif(grillonsClips, ~singleActionPattern.value(~launchGrillonsClips), 0),
		Pif(grillonsClips, Pseq([
			Event.silent(duration),
			Ppar([~singleActionPattern.value(~clearGrillonsClips), ~singleActionPattern.value(~resetGrillonsLayersOpacity)])
		]), 0),
		Ppar([
				[1, grillonOneShotPanBus, grillonOneShotLowPassBus, 12, 0, -12.midiratio, false, 0.05],
				[-1, grillonOneShotPanBus2,  grillonOneShotLowPassBus2, 16, pi, -12.midiratio, false, 0.05],
				[1, grillonOneShotPanBus, grillonOneShotLowPassBus, 0, 0, 1, true, 0.1],
				[-1, grillonOneShotPanBus2,  grillonOneShotLowPassBus2, 4, pi, 1, true, 0.1]
			].collect {
			| args |
			var direction, panBus, lpfBus, initialRest, phase, pattern, rate, triggerControlSynths, amp;
			direction = args[0];
			panBus = args[1];
			lpfBus = args[2];
			initialRest = args[3];
			phase = args[4];
			rate = args[5];
			triggerControlSynths = args[6];
			amp = args[7];
			pattern = Prand([
				Pseq([Pseq([1/2], repeats: 4), Rest(6)]),
				Pseq([Pseq([1/3], repeats: 6), Rest(2)]),
				Pseq([Pseq([1/3], repeats: 3), Rest(3)]),
				Pseq([Pseq([1/2], repeats: 10), Rest(3)])
			], repeats: inf);
			Ppar([
				Pbind(
					\dur, Pif(initialRest > 0, Pseq([Rest(initialRest), pattern]), pattern),
					\legato, 1,
					\instrument, Pif(Ptime() < duration, \play),
					\buf, ~grillonOneShotBuffer,
					\panBus, panBus,
					\lpfBus, lpfBus,
					\ampBus, grillonOneShotAmpBus,
					\rate, rate,
					\gateRelease, 3,
					\amp, amp,
					\amp0OutBus, grillonOneShotAmp0OutBus,
					\amp1OutBus, grillonOneShotAmp1OutBus,
					\amp2OutBus, grillonOneShotAmp2OutBus,
					\amp3OutBus, grillonOneShotAmp3OutBus
				),
				Pif(triggerControlSynths, Pbind(
					\dur, Pseq([duration]),
					\legato, 1,
					\instrument, \panControl,
					\freq, TempoClock.default.tempo / 12,
					\iphase, 0,
					\controlBus, panBus,
					\direction, direction
				)),
				Pif(triggerControlSynths, Pbind(
					\dur, Pseq([duration]),
					\legato, 1,
					\instrument, \lpfControl,
					\freq, TempoClock.default.tempo / 16,
					\phase, phase,
					\min, 100,
					\max, 10000,
					\controlBus, lpfBus,
				)),
			])
		})
	]);
};


// Long sample with fade in and out.
~feuillesNappe = {
	| duration, tribal8 = false |
	Ppar([
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \play,
			\buf, ~feuillesNappeBuffer,
			\loop, 1,
			\panBus, feuillesNappePanBus,
			\loopAtk, 16 / TempoClock.default.tempo,
			\loopSus, 0 / TempoClock.default.tempo,
			\loopRel, 16 / TempoClock.default.tempo,
			\ampOutBus, feuillesNappeAmpOutBus
		),
		Pbind(
			\dur, Pseq([8], inf),
			\instrument, Pif(Ptime() < duration, \panControl),
			\legato, 1,
			\iphase, Prand([0, 0.5, 1, 1.5], inf),
			\freq, TempoClock.default.tempo / 24,
			\controlBus, feuillesNappePanBus,
			\direction, Prand([1, -1], inf),
			\pfunc, Pif(tribal8, Pfuncn(~launchFeuillesNappeTribal8, inf), 0),
		),
		Pif(tribal8, ~pollActionPattern.value({
			feuillesNappeAmpOutBus.get(~setFeuillesNappeTribal8Opacity);
		}, duration), 0),
		Pif(tribal8, Pseq([
			Event.silent(duration),
			~singleActionPattern.value(~clearFeuillesNappeTribal8),
			~singleActionPattern.value(~resetFeuillesNapeTribal8LayerOpacity)
		]), 0)
	]);
};

// These samples are quite long, so this feels like a loop.
// This has a global fade in and out to help with transitions
// since this sound takes up a lot of space.
~murmures = {
	| duration, tribalOverlay = false |
	Ppar([
		Pbind(
			\dur, Prand([24, 12], repeats: inf),
			\legato, 1,
			\instrument, Pif(Ptime() < duration, \play),
			\buf, Pxrand(~murmuresBuffers, repeats: inf),
			\panBus, murmuresPanBus,
			\ampBus, murmuresAmpBus,
			\gateRelease, 7,
			\ampOutBus, murmuresAmpOutBus,
			\resolume, ~resolume
		),
		Pif(tribalOverlay, ~singleActionPattern.value(~launchTribalOverlay), 0),
		Pif(tribalOverlay, ~pollActionPattern.value({
			murmuresAmpOutBus.get(~setTribalOverlayOpacity);
		}, duration), 0),
		Pif(tribalOverlay, Pseq([
			Event.silent(duration),
			~singleActionPattern.value(~removeTribalOverlay),
			~singleActionPattern.value(~clearTribalOverlayLayerOpacity),
		]), 0),
		Pbind(
			\dur, Pseq([12], repeats: inf),
			\legato, 1,
			\instrument, Pif(Ptime() < duration, \panControl),
			\freq, TempoClock.default.tempo / 24,
			\iphase, Prand([0, 0.5, 1, 1.5], inf),
			\controlBus, murmuresPanBus,
			\direction, Prand([Pseq([1], 4), Pseq([-1], 4)], inf)
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \ampControl,
			\atk, 16 / TempoClock.default.tempo,
			\sus, (duration -  32) / TempoClock.default.tempo,
			\rel, 16 / TempoClock.default.tempo,
			\controlBus, murmuresAmpBus
		)
	]);
};

// We use pfunc to adapt the duration to the length of the loop we're playing.
// Global fade in and out to help with transitions as this takes up a lot of space.
~murmuresLoops = {
	| duration, fougeresRondes = false |
	Ppar([
		Pif(fougeresRondes, ~singleActionPattern.value(~launchFougeresRondes), 0),
		Pif(fougeresRondes, ~pollActionPattern.value({
			murmuresLoopsAmpOutBus.get(~setFougeresRondesOpacity);
		}, duration), 0),
		Pif(fougeresRondes, Pseq([
			Event.silent(duration),
			~singleActionPattern.value(~removeFougeresRondes),
			~singleActionPattern.value(~resetFougeresRondesLayerOpacity)
		]), 0),
		Pbind(
			\buf, Pxrand(~murmuresLoopsBuffers, repeats: inf),
			\dur, Pxrand([0, 8, 12].collect {
				| waitBeats |
				Pfunc({
					| ev |
					(ev[\buf].duration * TempoClock.default.tempo).round(2) + waitBeats
				})
			}),
			\legato, 1,
			\instrument, Pif(Ptime() < duration, \play),
			\panBus, murmuresLoopsPanBus,
			\ampBus, murmuresLoopsAmpBus,
			\ampOutBus, murmuresLoopsAmpOutBus,
			\amp, 0.15,
			\gateRelease, 7
		),
		Pbind(
			\dur, Pseq([12], repeats: inf),
			\legato, 1,
			\instrument, Pif(Ptime() < duration, \panControl),
			\freq, TempoClock.default.tempo / 24,
			\iphase, Prand([0, 0.5, 1, 1.5], inf),
			\controlBus, murmuresLoopsPanBus,
			\direction, Prand([Pseq([1], 4), Pseq([-1], 4)], inf)
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \ampControl,
			\atk, 32 / TempoClock.default.tempo,
			\sus, (duration -  48) / TempoClock.default.tempo,
			\rel, 16 / TempoClock.default.tempo,
			\controlBus, murmuresLoopsAmpBus
		),
	])
};

// Short samples hard-panned to one random speaker.
// When played rarely, we add delay.
// Low pass is probably useless, although can experiment with resonance.
~clochettes = {
	| duration, rarement = false |
	Ppar([
		Pbind(
			\dur, Pif(
				rarement,
				Pxrand([
					Pseq([12, 12, 24]),
					Pseq([18, 6, 24]),
					Pseq([18, 12, 18]),
					Pseq([30, 6, 12]),
				], repeats: inf),
				Pxrand([
					Pseq([4, 4, 8]),
					Pseq([6, 2, 8]),
					Pseq([6, 4, 6]),
					Pseq([10, 2, 4]),
				], repeats: inf)),
				\legato, 1,
			\instrument, Pif(Ptime() < duration, \play),
			\buf, Pxrand(~clochettesBuffers, repeats: inf),
			\hardPan, Pwhite(0.0, 2.0, inf),
			\lpfBus, clochettesLowPassBus,
			\amp, Pwhite(0.8, 1.1, inf),
			\gateRelease, 10,
			\delayTime, Pif(rarement, Prand([TempoClock.default.tempo / 9, TempoClock.default.tempo / 10], inf), 0),
			\delayRepeat, Pwhite(20, 40, inf)
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \lpfControl,
			\freq, TempoClock.default.tempo / 16,
			\min, 100,
			\max, 10000,
			\controlBus, clochettesLowPassBus,
		)
	]);
};

// Long sample with 4 bar fade in and out.
// Can optionally add a second sample a fifth above, which fades in and out using loopEnv.
~bassVoiceShaman = {
	| duration, withFifth = true, totem = false |
	Ppar([
		Ppar([
			Pbind(
				\dur, Pseq([duration]),
				\legato, 1,
				\instrument, \play,
				\buf, ~bassVoiceShamanBuffer,
				\panBus, bassVoiceShamanPanBus,
				\ampBus, bassVoiceShamanAmpBus,
				\ampOutBus, bassVoiceShamanAmpOutBus,
				\loop, 1
			),
			Pif(totem, ~singleActionPattern.value(~launchTotemClip), 0),
			Pif(totem, ~pollActionPattern.value({
				bassVoiceShamanPanBus.get(~rotateTotemClip);
				bassVoiceShamanAmpBus.get(~setTotemLayerOpacity);
			}, duration), 0),
			Pif(totem, Pseq([
				Event.silent(duration),
				~singleActionPattern.value(~clearTotemClip),
				~singleActionPattern.value(~resetTotemLayerOpacity)
			])),
			Pbind(
				\dur, Pseq([64], repeats: inf),
				\legato, 1,
				\instrument, Pif(Ptime() < duration, \panControl),
				\freq, TempoClock.default.tempo / 64,
				\iphase, 0,
				\controlBus, bassVoiceShamanPanBus,
				\direction, 1,
			),
			Pbind(
				\dur, Pseq([duration]),
				\legato, 1,
				\instrument, \ampControl,
				\atk, 32 / TempoClock.default.tempo,
				\sus, (duration - 64) / TempoClock.default.tempo,
				\rel, 32 / TempoClock.default.tempo,
				\controlBus, bassVoiceShamanAmpBus
			)]),
			Pif(withFifth, Ppar([
				Pbind(
					\dur, Pseq([Rest(16), 32], inf),
					\legato, 1,
					\instrument, Pif(Ptime() < duration, \play),
					\buf, ~bassVoiceShamanBuffer,
					\panBus, bassVoiceShaman2PanBus,
					\ampBus, bassVoiceShaman2AmpBus,
					\rate, 7.midiratio,
					\amp, 0.05,
					\loop, 1,
					\atk, 16 / TempoClock.default.tempo,
					\sus, 0,
					\rel, 16 / TempoClock.default.tempo,
				),
				Pbind(
					\dur, Pseq([Rest(16), 32], inf),
					\legato, 1,
					\instrument, Pif(Ptime() < duration, \panControl),
					\freq, TempoClock.default.tempo / 32,
					\iphase, Prand([0, 0.5, 1, 1.5], inf),
					\controlBus, bassVoiceShaman2PanBus,
					\direction, Prand([1, -1], inf)
				),
				Pbind(
					\dur, Pseq([duration]),
					\legato, 1,
					\instrument, \ampControl,
					\atk, 16 / TempoClock.default.tempo,
					\sus, (duration -  32) / TempoClock.default.tempo,
					\rel, 16 / TempoClock.default.tempo,
					\controlBus, bassVoiceShaman2AmpBus
				)]
			)),
	]);
};

// Short-ish samples, long enough to use regular panning and not hard-pan to one speaker.
~hiboux = {
	| duration, tribalClip = false, part4Clip = false |
	Ppar([
		Pbind(
			\dur, Prand([24, 16], repeats: inf),
			\legato, 1,
			\instrument, Pif(Ptime() < duration, \play),
			\buf, Pwrand(~hibouxBuffers, [0.2, 0.2, 0.6], inf),
			\rate, Pwrand([1, -8.midiratio, -6.midiratio], [0.5, 0.25, 0.25], inf),
			\gateRelease, 13,
			\amp, 0.275,
			\ampBus, hibouxAmpBus,
			\hardPan, Pif(tribalClip, Prand([0, 0.5, 1, 1.5], inf), Pwhite(0.0, 2.0, inf), 0),
			\pfunc, Pif(tribalClip, Pfuncn(~launchHibouxTribalClip, inf), 0),
			\pfunc2, Pif(part4Clip, Pfuncn(~launchHibouxPart4Clip, inf), 0)
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \ampControl,
			\atk, 32 / TempoClock.default.tempo,
			\sus, (duration -  48) / TempoClock.default.tempo,
			\rel, 16 / TempoClock.default.tempo,
			\controlBus, hibouxAmpBus
		),
	]);
};

// No panning, single rhythmic pattern.
~bass = {
	| duration, rarement = false, launchBassOndeRouge = false |
	Ppar([
		Pbind(
			\dur, Pif(rarement, Prand([16, 24], inf), 8),
			\legato, 1,
			\instrument, Pif(Ptime() < duration, \play),
			\buf, ~bassBuffer,
			\amp, 0.7,
			\action, Pif(launchBassOndeRouge, Pfuncn(~launchBassOndeRouge, inf), 0)
		),
	]);
};

	/**
	 *************************
	 * DRUM RACK STARTS HERE *
	 *************************
	 */

// No panning, single rhythmic pattern.
~kick = {
	| duration |
	Ppar([
		Pbind(
			\dur, Pseq([1.5, 0.5, 2], repeats: inf),
			\legato, 1,
			\instrument, Pif(Ptime() < duration, \play),
			\amp, 0.6,
			\buf, ~kickBuffer,
			\ampBus, kickAmpBus,
			\gateRelease, 4
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \ampControl,
			\atk, 0,
			\sus, (duration - 16) / TempoClock.default.tempo,
			\rel, 16,
			\controlBus, kickAmpBus
		)
	]);
};

// All drumrack elements below are randomly hard-panned to one speaker
// and have a fixed pattern.
~coil = {
	| duration |
	Pbind(
		\dur, Pseq([Rest(47/4), 17/4], repeats: inf),
		\legato, 1,
		\instrument, Pif(Ptime() < duration, \play),
		\buf, ~coilBuffer,
		\gateRelease, 8,
		\hardPan, Pwhite(0.0, 2.0, inf),
		\ampBus, drumRackAmpBus
	);
};

~cricket = {
	| duration |
	Pbind(
		\dur, Pseq([Rest(8), 8], repeats: inf),
		\legato, 1,
		\instrument, Pif(Ptime() < duration, \play),
		\buf, ~cricket1Buffer,
		\gateRelease, 2,
		\hardPan, Pwhite(0.0, 2.0, inf),
		\ampBus, drumRackAmpBus
	);
};

~cricket2 = {
	| duration |
	Ppar([
		Pbind(
			\dur, Pseq([Pseq([1/4], repeats: 57), Rest(1/4), Pseq([1/4], repeats: 6)], repeats: inf),
			\legato, 1,
			\instrument, Pif(Ptime() < duration, \play),
			\buf, ~cricket2Buffer,
			\panBus, cricket2PanBus,
			\gateRelease, 1,
			\controlBus, drumRackAmpBus
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \panControl,
			\freq, TempoClock.default.tempo / 4,
			\controlBus, cricket2PanBus
		)
	]);
};

~hhdelay = {
	| duration |
	Pbind(
		\dur, Pseq([Rest(14), 22], repeats: inf),
		\legato, 1,
		\instrument, Pif(Ptime() < duration, \play),
		\buf, ~hhdelayBuffer,
		\hardPan, Pwhite(0.0, 2.0, inf),
		\ampBus, drumRackAmpBus
	);
};

~kickDelay = {
	| duration |
	Pbind(
		\dur, Pseq([Rest(10), 6], repeats: inf),
		\legato, 1,
		\instrument, Pif(Ptime() < duration, \play),
		\buf, ~kickDelayBuffer,
		\gateRelease, 3,
		\hardPan, Pwhite(0.0, 2.0, inf),
		\ampBus, drumRackAmpBus
	);
};

~snareTom = {
	| duration |
	Ppar([
		Pbind(
			\dur, Pseq([Rest(2), 5, 2/4, 2, 2/4, 14/4, 1/4, 1/4, 2], repeats: inf),
			\legato, 1,
			\instrument, Pif(Ptime() < duration, \play),
			\buf, ~snareTomBuffer,
			\gateRelease, 3,
			\amp, Pfunc( { | ev | 0.05 + (ev[\dur] / 20) } ),
			\hardPan, Pwhite(0.0, 2.0, inf),
			\lpfBus, snareTomLowPassBus,
			\lpfRq, 0.5,
			\ampBus, snareTomAmpBus,
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \lpfControl,
			\freq, TempoClock.default.tempo / 8,
			\min, 2500,
			\max, 4000,
			\controlBus, snareTomLowPassBus,
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \ampControl,
			\atk, 16,
			\sus, (duration - 32) / TempoClock.default.tempo,
			\rel, 16,
			\controlBus, snareTomAmpBus
		),
	]);
};

~tom1 = {
	| duration |
	Pbind(
		\dur, Pseq([Rest(26/4), 38/4], repeats: inf),
		\legato, 1,
		\instrument, Pif(Ptime() < duration, \play),
		\buf, ~tom1Buffer,
		\gateRelease, 1,
		\hardPan, Pwhite(0.0, 2.0, inf),
		\controlBus, drumRackAmpBus
	);
};

~drumRack = {
	| duration |
	Ppar([
		~kick.value(duration),
		~coil.value(duration),
		~cricket.value(duration),
		~cricket2.value(duration),
		~hhdelay.value(duration),
		~kickdelay.value(duration),
		~snareTom.value(duration),
		~tom.value(duration),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \ampControl,
			\atk, 0,
			\sus, (duration - 16) / TempoClock.default.tempo,
			\rel, 16 / TempoClock.default.tempo,
			\controlBus, drumRackAmpBus
		),
	]);
};
)