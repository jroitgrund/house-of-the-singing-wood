(
var drumRackAmpBus = Bus.control(s, 1);

var stabsAmpOutBus = Bus.control(s, 1);
var stabsPanBus = Bus.control(s, 1);
	
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

var batonPluiePanBus = Bus.control(s, 1);
var batonPluieAmpBus = Bus.control(s, 1);
var batonPluieLowPassBus = Bus.control(s, 1);
var batonPluieAmpOutBus = Bus.control(s, 1);

var bolTibetainPanBus = Bus.control(s, 1);
var bolTibetainAmpBus = Bus.control(s, 1);
var bolTibetainLowPassBus = Bus.control(s, 1);
var bolTibetainAmpOutBus = Bus.control(s, 1);

var rootsPanBus = Bus.control(s, 1);
var rootsAmpBus = Bus.control(s, 1);
var rootsAmpBus2 = Bus.control(s, 1);
var rootsLowPassBus = Bus.control(s, 1);
var rootsAmpOutBus = Bus.control(s, 1);

var guimbardeStabPanBus = Bus.control(s, 1);
var guimbardeStabAmpBus = Bus.control(s, 1);
var guimbardeStabLowPassBus = Bus.control(s, 1);
var guimbardeStabAmpOutBus = Bus.control(s, 1);

var windChimesPanBus = Bus.control(s, 1);
var windChimesAmpBus = Bus.control(s, 1);
var windChimesLowPassBus = Bus.control(s, 1);
var windChimesAmpOutBus = Bus.control(s, 1);

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
	~bolTibetainBuffer = Buffer.readChannel(s, ~basePath ++ "Chapitre3 - Rituel/bol-tibetain.wav", action: ~loaded);
	~batonPluieBuffer = Buffer.readChannel(s, ~basePath ++ "Chapitre3 - Rituel/baton-pluie.wav", action: ~loaded);

	~murmuresBuffers = ~readContentsAsBuffers.value(~basePath ++ "Chapitre3 - Rituel/MurmuresOneShot");
	~hibouxBuffers = ~readContentsAsBuffers.value(~basePath ++ "Chapitre3 - Rituel/Hiboux");
	~clochettesBuffers = ~readContentsAsBuffers.value(~basePath ++ "Chapitre3 - Rituel/ClochetteOneShot/ClochetteReverb");
	~murmuresLoopsBuffers = ~readContentsAsBuffers.value(~basePath ++ "Chapitre3 - Rituel/Murmures");
	~stabBuffers = ~readContentsAsBuffers.value(~basePath ++ "Chapitre3 - Rituel/stabs");
	~guimbardeStabBuffers = ~readContentsAsBuffers.value(~basePath ++ "Chapitre3 - Rituel/guimbarde-stab");
	~rootsBuffers = ~readContentsAsBuffers.value(~basePath ++ "Chapitre3 - Rituel/roots");
	// ~windChimesBuffers = ~readContentsAsBuffers.value(~basePath ++ "Chapitre3 - Rituel/chimes");
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
			\amp, 0.2
		),
		Pif(grillonsClips, ~pollActionPattern.value({
			grillonOneShotAmp0OutBus.get(~setGrillonsTopLeftOpacity);
			grillonOneShotAmp1OutBus.get(~setGrillonsTopRightOpacity);
			grillonOneShotAmp2OutBus.get(~setGrillonsBottomRightOpacity);
			grillonOneShotAmp3OutBus.get(~setGrillonsBottomLeftOpacity);
		}, duration - (4/10)), 1),
		Pif(grillonsClips, ~singleActionPattern.value(~launchGrillonsClips), 1),
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
					\iphase, Pwhite(0.0, 2.0, inf),
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
			\ampOutBus, feuillesNappeAmpOutBus,
			\ampBus, feuillesNappeAmpBus,
			\amp, 0.2
		),
		Pbind(
			\dur, Pseq([duration]),
			\instrument, \panControl,
			\legato, 1,
			\iphase, 0.5,
			\freq, TempoClock.default.tempo / 8,
			\controlBus, feuillesNappePanBus,
			\direction, 1,
			\pfunc, Pif(tribal8, Pfuncn(~launchFeuillesNappeTribal8, inf), 1),
		),
		Pif(tribal8, ~pollActionPattern.value({
			feuillesNappeAmpOutBus.get(~setFeuillesNappeTribal8Opacity);
		}, duration - (4/10)), 1),
		Pif(tribal8, Pseq([
			Event.silent(duration),
			~singleActionPattern.value(~clearFeuillesNappeTribal8),
			~singleActionPattern.value(~resetFeuillesNapeTribal8LayerOpacity)
		]), 1),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \ampControl,
			\atk, 16 / TempoClock.default.tempo,
			\sus, (duration -  32) / TempoClock.default.tempo,
			\rel, 16 / TempoClock.default.tempo,
			\controlBus, feuillesNappeAmpBus
		)
	]);
};

// These samples are quite long, so this feels like a loop.
// This has a global fade in and out to help with transitions
// since this sound takes up a lot of space.
~murmures = {
	| duration, tribalOverlay = false, rarement = false |
	Ppar([
		Pbind(
			\dur, Pif(rarement, Prand([24, 32], repeats: inf), Prand([24, 12], repeats: inf)),
			\legato, 1,
			\instrument, Pif(Ptime() < duration, \play),
			\buf, Pxrand(~murmuresBuffers, repeats: inf),
			\panBus, murmuresPanBus,
			\ampBus, murmuresAmpBus,
			\gateRelease, 7,
			\ampOutBus, murmuresAmpOutBus,
			\amp, 0.3
		),
		Pif(tribalOverlay, ~singleActionPattern.value(~launchTribalOverlay), 1),
		Pif(tribalOverlay, ~pollActionPattern.value({
			murmuresAmpOutBus.get(~setTribalOverlayOpacity);
		}, duration - (4/10)), 1),
		Pif(tribalOverlay, Pseq([
			Event.silent(duration),
			~singleActionPattern.value(~removeTribalOverlay),
			~singleActionPattern.value(~clearTribalOverlayLayerOpacity),
		]), 1),
		Pbind(
			\dur, Pseq([12], repeats: inf),
			\legato, 1,
			\instrument, Pif(Ptime() < duration, \panControl),
			\freq, TempoClock.default.tempo / 24,
			\iphase, Pwhite(0.0, 2.0, inf),
			\controlBus, murmuresPanBus,
			\direction, Prand([1, -1], inf)
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
	| duration, fougeresRondes = false, affectParticleOpacity = false |
	Ppar([
		Pif(affectParticleOpacity, ~pollActionPattern.value({
			murmuresLoopsAmpOutBus.get(~setParticulesOpacity)
		}, duration - (4/10)), 1),
		Pif(affectParticleOpacity, Pseq([Event.silent(duration), ~singleActionPattern.value(~resetMurmuresParticlesOpacity), ~singleActionPattern.value(~clearMurmuresParticles)]), 1),
		Pif(fougeresRondes, ~singleActionPattern.value(~launchFougeresRondes), 1),
		Pif(fougeresRondes, ~pollActionPattern.value({
			murmuresLoopsAmpOutBus.get(~setFougeresRondesOpacity);
		}, duration - (4/10)), 1),
		Pif(fougeresRondes, Pseq([
			Event.silent(duration),
			~singleActionPattern.value(~removeFougeresRondes),
			~singleActionPattern.value(~resetFougeresRondesLayerOpacity)
		]), 1),
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
			\amp, 0.3,
			\gateRelease, 7
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \panControl,
			\freq, TempoClock.default.tempo / 24,
			\iphase, Pwhite(0.0, 2.0, inf),
			\controlBus, murmuresLoopsPanBus,
			\direction, Prand([-1, 1], inf)
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
			\amp, 0.5,
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
				\loop, 1,
				\amp, 0.2
			),
			Pif(totem, ~singleActionPattern.value(~launchTotemClip), 1),
			Pif(totem, ~pollActionPattern.value({
				bassVoiceShamanPanBus.get(~rotateTotemClip);
				bassVoiceShamanAmpBus.get(~setTotemLayerOpacity);
			}, duration - (4/10)), 1),
			Pif(totem, Pseq([
				Event.silent(duration),
				~singleActionPattern.value(~clearTotemClip),
				~singleActionPattern.value(~resetTotemLayerOpacity),
				~singleActionPattern.value(~resetTotemClipRotation)
			]), 1),
			Pbind(
				\dur, Pseq([duration]),
				\legato, 1,
				\instrument, \panControl,
				\freq, TempoClock.default.tempo / 64,
				\directionChangeRate, TempoClock.default.tempo / 32,
				\iphase, 0,
				\controlBus, bassVoiceShamanPanBus,
				\direction, 1,
			),
			Pbind(
				\dur, Pseq([duration]),
				\legato, 1,
				\instrument, \ampControl,
				\atk, 64 / TempoClock.default.tempo,
				\sus, (duration - 128) / TempoClock.default.tempo,
				\rel, 64 / TempoClock.default.tempo,
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
					\ampBus2, bassVoiceShamanAmpBus,
					\rate, 7.midiratio,
					\amp, 0.05,
					\loop, 1
				),
				Pbind(
					\dur, Pseq([Rest(16), 32], inf),
					\legato, 1,
					\instrument, Pif(Ptime() < duration, \panControl),
					\freq, TempoClock.default.tempo / 32,
					\iphase, Pwhite(0.0, 2.0, inf),
					\controlBus, bassVoiceShaman2PanBus,
					\direction, Prand([1, -1], inf)
				),
				Pbind(
					\dur, Pseq([Rest(16), 32], inf),
					\legato, 1,
					\instrument, Pif(Ptime() < duration, \ampControl),
					\atk, 16 / TempoClock.default.tempo,
					\sus, 0,
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
			\amp, 0.25,
			\ampBus, hibouxAmpBus,
			\hardPan, Pif(tribalClip, Prand([0, 0.5, 1, 1.5], inf), Pwhite(0.0, 2.0, inf)),
			\pfunc, Pif(tribalClip, Pfuncn(~launchHibouxTribalClip, inf), 1),
			\pfunc2, Pif(part4Clip, Pfuncn(~launchHibouxPart4Clip, inf), 1),
			\pfunc3, Pif(tribalClip, Pwrand([
				Prand([
					Pfunc(~launchHibouxRandomClip1),
					Pfunc(~launchHibouxRandomClip2),
					Pfunc(~launchHibouxRandomClip3),
					Pfunc(~launchHibouxRandomClip4)]),
				Pfunc({1})],
				[1, 3].normalizeSum), 1),
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
		Pif(part4Clip, Pseq([Event.silent(duration), ~singleActionPattern.value(~resetHibouxPart4ClipRotation)]), 1)
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
			\amp, 0.3,
			\hardPan, Pwhite(0.0, 2.0),
			\pfunc, Pif(launchBassOndeRouge, Pfuncn(~launchBassOndeRouge, inf), 1)
		),
	]);
};

~bolTibetain = {
	| duration |
	Ppar([
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \play,
			\buf, ~bolTibetainBuffer,
			\loop, 1,
			\panBus, bolTibetainPanBus,
			\loopAtk, 4 / TempoClock.default.tempo,
			\loopSus, 24,
			\loopRel, 4 / TempoClock.default.tempo,
			\ampOutBus, bolTibetainAmpOutBus,
			\ampBus, bolTibetainAmpBus,
			\amp, 0.14
		),
		Pbind(
			\dur, Pseq([32], inf),
			\instrument, Pif(Ptime() < duration, \panControl),
			\legato, 1,
			\iphase, Pwhite(0.0, 2.0, inf),
			\freq, TempoClock.default.tempo / 24,
			\controlBus, bolTibetainPanBus,
			\direction, Prand([1, -1], inf),
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \ampControl,
			\atk, 16 / TempoClock.default.tempo,
			\sus, (duration -  48) / TempoClock.default.tempo,
			\rel, 32 / TempoClock.default.tempo,
			\controlBus, bolTibetainAmpBus
		),
	]);
};

~batonPluie = {
	| duration |
	Ppar([
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \play,
			\buf, ~batonPluieBuffer,
			\loop, 1,
			\panBus, batonPluiePanBus,
			\loopAtk, 8 / TempoClock.default.tempo,
			\loopSus, 48,
			\loopRel, 8 / TempoClock.default.tempo,
			\amp, 0.1,
			\ampBus, batonPluieAmpBus,
			\ampOutBus, batonPluieAmpOutBus
		),
		Pbind(
			\dur, Pseq([duration]),
			\instrument, \panControl,
			\legato, 1,
			\iphase, 0,
			\freq, TempoClock.default.tempo / 32,
			\directionChangeRate, TempoClock.default.tempo / 16,
			\controlBus, batonPluiePanBus,
			\direction, Pseq([1, -1], inf),
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \ampControl,
			\atk, 16 / TempoClock.default.tempo,
			\sus, (duration -  48) / TempoClock.default.tempo,
			\rel, 32 / TempoClock.default.tempo,
			\controlBus, batonPluieAmpBus
		),
	]);
};

~roots = {
	| duration |
	var iter = 1;
	Ppar([
		Pbind(
			\buf, Pxrand(~rootsBuffers, repeats: inf),
			\dur, Prand(
				[8, 9, 10, 11, 12].collect {
					| waitBeats |
					Pfuncn({
						| ev |
						(ev[\buf].duration * TempoClock.default.tempo).round(2) + waitBeats
					}, inf)
				}),
			\legato, 1,
			\instrument, Pif(Ptime() < duration, \play),
			\hardPan, Pwhite(0.0, 2.0, inf),
			\gateRelease, 60,
            \ampBus, rootsAmpBus,
			\ampBus2, rootsAmpBus2,
            \ampOutBus, rootsAmpOutBus,
			\amp, 0.6,
			\pfunc, Pfuncn(~launchRootsClip, inf),
			\pfunc2, Pfuncn({
				| ev |
				var dur = ev[\buf].duration;
				Pbind(
					\dur, Pseq([dur]),
					\legato, 1,
					\instrument, \ampControl,
					\atk, 0.5 * dur,
					\sus, 0,
					\rel, 0.5 * dur,
					\controlBus, rootsAmpBus
				).play;
			}, inf)
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \ampControl,
			\atk, 16 / TempoClock.default.tempo,
			\sus, (duration - 32) / TempoClock.default.tempo,
			\rel, 16 / TempoClock.default.tempo,
			\controlBus, rootsAmpBus2
		)
		]);
};

// ~windChimes = {
// 	| duration |
// 	Ppar([
// 		Pbind(
// 			\buf, Pxrand(~windChimesBuffers, repeats: inf),
// 			\dur, Prand(
// 				[-1, -2, 0, 4, 8, 12].collect {
// 					| waitBeats |
// 					Pfuncn({
// 						| ev |
// 						(ev[\buf].duration * TempoClock.default.tempo).round(2) + waitBeats
// 					}, inf)
// 				}),
// 			\legato, 1,
// 			\instrument, Pif(Ptime() < duration, \play),
// 			\hardPan, Pwhite(0.0, 2.0, inf),
// 			\gateRelease, 30,
//             \ampBus, windChimesAmpBus,
//             \ampOutBus, windChimesAmpOutBus
// 		),
// 		Pbind(
// 			\dur, Pseq([duration]),
// 			\legato, 1,
// 			\instrument, \ampControl,
// 			\atk, 0,
// 			\sus, (duration -  16) / TempoClock.default.tempo,
// 			\rel, 16 / TempoClock.default.tempo,
// 			\controlBus, windChimesAmpBus
// 		),
// 	]);
// };

	/**
	 *************************
	 * DRUM RACK STARTS HERE *
	 *************************
	 */

// No panning, single rhythmic pattern.
~kick = {
	| duration, fadeOut = true |
	Ppar([
		Pbind(
			\dur, Pseq([1.5, 0.5, 2], repeats: inf),
			\legato, 1,
			\instrument, Pif(Ptime() < duration, \play),
			\amp, 0.8,
			\buf, ~kickBuffer,
			\ampBus, Pif(fadeOut, kickAmpBus, -1),
			\ampOutBus, kickAmpOutBus,
			\gateRelease, 4
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \ampControl,
			\atk, 0,
			\sus, (duration - 32) / TempoClock.default.tempo,
			\rel, 32 / TempoClock.default.tempo,
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
		\ampBus, drumRackAmpBus,
		\amp, 0.6
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
		\ampBus, drumRackAmpBus,
		\amp, 0.2
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
			\ampBus, drumRackAmpBus,
			\lpfBus, cricket2LowPassBus,
			\amp, 0.4
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \panControl,
			\freq, TempoClock.default.tempo / 4,
			\controlBus, cricket2PanBus
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \lpfControl,
			\freq, 4 * TempoClock.default.tempo / 24,
			\min, 4000,
			\max, 20000,
			\controlBus, cricket2LowPassBus,
		),
	]);
};

~hhdelay = {
	| duration |
	Pbind(
		\dur, Pseq([
				Rest(14),
				Prand([78, 93, 35, 23, 14, 17], inf)
			]),
		\legato, 1,
		\instrument, Pif(Ptime() < duration, \play),
		\buf, ~hhdelayBuffer,
		\hardPan, Pwhite(0.0, 2.0, inf),
		\ampBus, drumRackAmpBus,
		\amp, 0.6
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
		\ampBus, drumRackAmpBus,
		\amp, 0.2
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
			\amp, Pfunc( { | ev | 0.1 + (ev[\dur] / 10) } ),
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
			\atk, 16 / TempoClock.default.tempo,
			\sus, (duration - 48) / TempoClock.default.tempo,
			\rel, 32 / TempoClock.default.tempo,
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
		\ampBus, drumRackAmpBus,
		\amp, 0.2
	);
};

~stabs = {
	| duration |
	Ppar([
		Pbind(
			\dur, Pxrand([4, 12, 16, 8], inf),
			\legato, 1,
			\instrument, Pif(Ptime() < duration, \play),
			\buf, Pxrand(~stabBuffers, inf),
			\gateRelease, 1,
			// \ampBus, drumRackAmpBus,
			\ampOutBus, stabsAmpOutBus,
			\amp, 0.3,
			\panBus, stabsPanBus
		),
		Pbind(
			\dur, Pseq([duration]),
			\legato, 1,
			\instrument, \panControl,
			\freq, TempoClock.default.tempo / 4,
			\controlBus, stabsPanBus
		)
	]);
};

~guimbardeStabs = {
	| duration |
	Pbind(
		\dur, Pseq([
			Rest(21/4),
			Pxrand([33, 76, 22, 5, 17], inf)
		]),
		\legato, 1,
		\instrument, Pif(Ptime() < duration, \play),
		\buf, Pxrand(~guimbardeStabBuffers, inf),
		\gateRelease, 1,
		\hardPan, Pwhite(0.0, 2.0, inf),
		\ampBus, drumRackAmpBus,
		\amp, 0.4
	);
};

~drumRack = {
	| duration, coilDuration |
	Ppar([
		~kick.value(duration),
		// ~coil.value(coilDuration),
		~cricket.value(duration),
		// ~hhdelay.value(duration),
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

~ritualPart1 = {
	| firstPhaseDuration |
	var bassIn = (0 * firstPhaseDuration / 6).round(4);
	var grillonsIn = (1 * firstPhaseDuration / 6).round(4);
	var clochettesIn = (2 * firstPhaseDuration / 6).round(4);
	var finalClipIn = (2 * firstPhaseDuration / 3).round(4);
	Ppar([
		Pseq([Event.silent(grillonsIn), ~grillons.value(firstPhaseDuration + 32 - grillonsIn, grillonsClips: true)]),
		Pseq([Event.silent(bassIn), ~bass.value(firstPhaseDuration - bassIn, rarement: true, launchBassOndeRouge: true)]),
		Pseq([Event.silent(clochettesIn), Ppar([
			// ~clochettes.value(firstPhaseDuration - clochettesIn),
			~singleActionPattern.value(~launchClipWithClochettesInRitualPart1),
			Pseq([Event.silent(16), ~singleActionPattern.value(~launchSecondClipWithClochettesInRitualPart1)])
		])]),
		Pseq([Event.silent(finalClipIn), ~singleActionPattern.value(~launchClipForLastThirdOfRitualpart1)]),

		// clear layers
		Pseq([Event.silent(firstPhaseDuration - (2/10)), ~singleActionPattern.value(~clearLayers.value([6, 7, 8, 9, 10]))]),
		Pseq([Event.silent(firstPhaseDuration + 32), ~singleActionPattern.value(~clearGrillonsClips), ~singleActionPattern.value(~resetGrillonsLayersOpacity)])
	]);
};

~ritualPart2 = {
	| secondPhaseDuration |
	var bassVoiceShamanIn = (1 * secondPhaseDuration / 6).round(4);
	var hibouxIn = (2 * secondPhaseDuration / 6).round(4);
	Ppar([
		~singleActionPattern.value(~launchMurmuresRitualPart2Clip),
		Pseq([Event.silent(0), ~murmuresLoops.value(secondPhaseDuration, affectParticleOpacity: true)]),
		Pseq([Event.silent(bassVoiceShamanIn), ~bassVoiceShaman.value(secondPhaseDuration + 4 - bassVoiceShamanIn, totem: true)]),
		Pseq([Event.silent(bassVoiceShamanIn), ~singleActionPattern.value({
			~setLayerTransitionsOn.value(8, 2);
		})]),
		Pseq([
			Event.silent(hibouxIn),
			Ppar([
				~hiboux.value(secondPhaseDuration - hibouxIn, tribalClip: true),
			])
		]),
		Pseq([Event.silent(secondPhaseDuration - 16), ~singleActionPattern.value(~launchRitualPart3InitialClip)]),
		Pseq([Event.silent(secondPhaseDuration - (2/10)), ~singleActionPattern.value(~clearLayers.value([1, 2, 3, 4, 5, 6, 7, 8, 10, 11, 12]))])
	]);
};

~ritualPart3 = {
	| thirdPhaseDuration |
	var batonPluieIn = (1 * thirdPhaseDuration / 6).round(4);
	Ppar([
		~kick.value(thirdPhaseDuration + 1, fadeOut: false),
		~murmuresLoops.value(thirdPhaseDuration),
		~singleActionPattern.value(~launchMurmuresPart3Clip),
		~pollActionPattern.value({
			murmuresLoopsAmpOutBus.get(~setMurmuresPart3ClipOpacity)
		}, thirdPhaseDuration - (4/10)),
		~singleActionPattern.value(~launchRitualPart3KickClip),
		Pseq([Event.silent(batonPluieIn), ~batonPluie.value(thirdPhaseDuration - batonPluieIn)]),
		Pseq([Event.silent(batonPluieIn), ~singleActionPattern.value(~launchFougeresRondes)]),
		Pseq([Event.silent(batonPluieIn), ~pollActionPattern.value({
			batonPluieAmpOutBus.get(~setFougeresRondesOpacity)
		}, thirdPhaseDuration - batonPluieIn - (4/10))]),
		Pseq([Event.silent(batonPluieIn), ~pollActionPattern.value({
			batonPluiePanBus.get(~setFougeresRondesRotation)
		}, thirdPhaseDuration - batonPluieIn - (4/10))]),
		Pseq([Event.silent(thirdPhaseDuration - (2/10)), ~singleActionPattern.value(~clearAllLayers.value)])
	]);
};

~ritualPart4 = {
	| fourthPhaseDuration |
	var bolTibetainIn = (fourthPhaseDuration / 6).round(4);
	var rootsIn = (2 * fourthPhaseDuration / 6).round(4);
	var hibouxIn = (3 * fourthPhaseDuration / 6).round(4);
	Ppar([
		~singleActionPattern.value(~launchSnakeLoop),
		~murmures.value(fourthPhaseDuration, tribalOverlay: true, rarement: true),
		~feuillesNappe.value(fourthPhaseDuration + 16, tribal8: true),
		~clochettes.value(fourthPhaseDuration, rarement: true),
		// Pseq([Event.silent(bolTibetainIn), ~bolTibetain.value(fourthPhaseDuration + 8 - bolTibetainIn)]),
		Pseq([Event.silent(rootsIn), ~roots.value(fourthPhaseDuration - rootsIn)]),
		Pseq([Event.silent(hibouxIn), ~hiboux.value(fourthPhaseDuration - hibouxIn, part4Clip: true)]),
		Pseq([Event.silent(fourthPhaseDuration - (2/10)), ~singleActionPattern.value(~clearAllLayers.value)])
	]);
};

~ritualPart5 = {
	| fifthPhaseDuration |
	var drumRackIn = 64;
	var stabsIn = drumRackIn + (2 * (fifthPhaseDuration - drumRackIn) / 6).round(4);
	var grillonsIn = drumRackIn + (3 * (fifthPhaseDuration - drumRackIn) / 6).round(4);
	Ppar([
		~singleActionPattern.value(~launchRitualPart5InitialClips),
		~bassVoiceShaman.value(fifthPhaseDuration, withFifth: false),
		Pseq([Event.silent(16), ~singleActionPattern.value(~launchRitualPart5SecondClip)]),
		Pseq([Event.silent(drumRackIn), ~drumRack.value(fifthPhaseDuration - drumRackIn, stabsIn - drumRackIn)]),
		Pseq([Event.silent(drumRackIn), ~singleActionPattern.value(~launchRitualPart5KickClips)]),
		Pseq([Event.silent(drumRackIn), ~pollActionPattern.value({
			bassVoiceShamanPanBus.get(~setBassVoicePart5Rotation)
		}, fifthPhaseDuration - drumRackIn - (4/10))]),
		Pseq([Event.silent(drumRackIn), ~pollActionPattern.value({
			kickAmpOutBus.get(~setRitualPart5Layer9Opacity)
		}, fifthPhaseDuration - drumRackIn - (4/10))]),
		Pseq([Event.silent(stabsIn), ~stabs.value(fifthPhaseDuration - stabsIn)]),
		Pseq([Event.silent(stabsIn), ~singleActionPattern.value(~launchRitualPart5StabsClip)]),
		Pseq([Event.silent(stabsIn), ~pollActionPattern.value({
			stabsAmpOutBus.get(~setRitualPart5Layer8Opacity)
		}, fifthPhaseDuration - stabsIn - (4/10))]),
		Pseq([Event.silent(grillonsIn), ~cricket2.value(fifthPhaseDuration - grillonsIn)]),
		Pseq([Event.silent(fifthPhaseDuration - (2/10)), ~singleActionPattern.value(~clearAllLayers.value)])
	]);
};

~ritual = {
	| ritualFirstPhaseDuration, ritualSecondPhaseDuration, ritualThirdPhaseDuration, ritualFourthPhaseDuration, ritualFifthPhaseDuration |
	Ppar([
		Pseq([
			Event.silent(0),
			~ritualPart1.value(ritualFirstPhaseDuration)
		]),
		Pseq([
			Event.silent(ritualFirstPhaseDuration),
			~ritualPart2.value(ritualSecondPhaseDuration)
		]),
		Pseq([
			Event.silent(ritualFirstPhaseDuration + ritualSecondPhaseDuration),
			~ritualPart3.value(ritualThirdPhaseDuration)
		]),
		Pseq([
			Event.silent(ritualFirstPhaseDuration + ritualSecondPhaseDuration + ritualThirdPhaseDuration),
			~ritualPart4.value(ritualFourthPhaseDuration)
		]),
		Pseq([
			Event.silent(ritualFirstPhaseDuration + ritualSecondPhaseDuration + ritualThirdPhaseDuration + ritualFourthPhaseDuration),
			~ritualPart5.value(ritualFifthPhaseDuration)
		]),
	]);
};

)