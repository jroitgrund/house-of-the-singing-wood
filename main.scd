// Actual device on PC, need to change for mac.
(
s.options.device = "ASIO : Focusrite USB ASIO";
s.options.numOutputBusChannels = 4;
s.options.memSize = 1000000;
s.reboot;
)

(
s.options.device = "ASIO : Realtek ASIO";
s.options.memSize = 1000000;
s.options.numOutputBusChannels = 2;
s.reboot;
)

(
"./common.scd".load;

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

~birds1Buffer = Buffer.readChannel(s, ~basePath ++ "Chapitre1 - Biosphere/Birds1.aif", action: ~loaded);
~birds2Buffer = Buffer.readChannel(s, ~basePath ++ "Chapitre1 - Biosphere/Birds2.aif", action: ~loaded);
~frogBuffer = Buffer.readChannel(s, ~basePath ++ "Chapitre1 - Biosphere/Frog_1shot_Wrapped.aif", action: ~loaded);
~gouttesBuffer = Buffer.readChannel(s, ~basePath ++ "Chapitre1 - Biosphere/Gouttes.aif", action: ~loaded);
~melodieBuffer = Buffer.readChannel(s, ~basePath ++ "Chapitre1 - Biosphere/Melodie_Wrapped.aif", action: ~loaded);
~owlNappeBuffer = Buffer.readChannel(s, ~basePath ++ "Chapitre1 - Biosphere/OWL_1BAR.aif", action: ~loaded);
~owlsBuffers = [
	Buffer.readChannel(s, ~basePath ++ "Chapitre1 - Biosphere/Owl-Sing1.aif", action: ~loaded),
	Buffer.readChannel(s, ~basePath ++ "Chapitre1 - Biosphere/Owl-Sing2.aif", action: ~loaded)
];
~waterBuffer = Buffer.readChannel(s, ~basePath ++ "Chapitre1 - Biosphere/Water.aif", action: ~loaded);
~waitForBuffers.value({"Done reading buffers".postln;})
)


// Use this code block to test stuff out!
(
TempoClock.default.tempo = 90/60;

"./common.scd".load;
"./osc.scd".load;
"./biosphere.scd".load;
"./ritual.scd".load;

// For example, to play murmures once with a duration of 64 beats:
~bassVoiceShaman.value(256).play;
)


// Runs everything! Adjust durations and comment stuff out to run individual parts.
(
var runLoop, resolume, selectClip, setOpacity, panToRotate;

var biosphereFirstPhaseDuration = 32;
var biosphereSecondPhaseDuration = 32;
var biosphereThirdPhaseDuration = 32;

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

resolume = ~resolume;
selectClip = ~selectClip;
setOpacity = ~setOpacity;
panToRotate = ~panToRotate;

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
				Pseq([~singleActionPattern.value({
					resolume.sendMsg("/composition/layers/3/clips/1/connect", 1);
				})]),
				Pseq([Event.silent(biosphereFirstPhaseDuration), ~singleActionPattern.value({
					resolume.sendMsg("/composition/layers/3/clear", 1);
				})]),
				Pseq([Event.silent(32), ~gouttes.value(biosphereFirstPhaseDuration + biosphereSecondPhaseDuration - 16)]),
				Pseq([~owlNappe.value(biosphereFirstPhaseDuration + 8)]),
				Pseq([Event.silent(16), ~owls.value(biosphereFirstPhaseDuration - 8)]),
			]),
			Pseq([
				Event.silent(biosphereFirstPhaseDuration),
				Ppar([
					Pseq([Event.silent(biosphereSecondPhaseDuration), ~singleActionPattern.value({
						resolume.sendMsg("/composition/layers/2/clips/2/connect", 1);
					})]),
					Pseq([~melodie.value(biosphereSecondPhaseDuration)]),
					Pseq([~owls.value(biosphereSecondPhaseDuration + 32, rarement: true)])
				])
			]),
			Pseq([
				Event.silent(biosphereFirstPhaseDuration + biosphereSecondPhaseDuration),
				Ppar([
					Pseq([Event.silent(biosphereThirdPhaseDuration), ~singleActionPattern.value({
						resolume.sendMsg("/composition/layers/1/clips/3/connect", 1);
					})]),
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
				Pseq([Event.silent(thirdPhaseDuration), ~singleActionPattern.value({
					~selectClip.value(0, 0);
				})]),
				~grillons.value(firstPhaseDuration + 32),
				Pseq([Event.silent(4), ~clochettes.value(firstPhaseDuration - 4)]),
				~bass.value(firstPhaseDuration, rarement: true)
			])]),
			Pseq([Event.silent(firstPhaseDuration), Ppar([
				Pseq([Event.silent(thirdPhaseDuration), ~singleActionPattern.value({
					~selectClip.value(0, 0);
				})]),
				Pseq([Event.silent(16), ~bassVoiceShaman.value(secondPhaseDuration - 8)]),
				Pseq([Event.silent(0), ~murmuresLoops.value(secondPhaseDuration - 0)]),
				Pseq([Event.silent(8), ~hiboux.value(secondPhaseDuration - 8)]),
			])]),
			Pseq([Event.silent(firstPhaseDuration + secondPhaseDuration), Ppar([
				Pseq([Event.silent(thirdPhaseDuration), ~singleActionPattern.value({
					~selectClip.value(0, 0);
				})]),
				~kick.value(thirdPhaseDuration + 1),
				~murmuresLoops.value(thirdPhaseDuration)
			])]),
			Pseq([Event.silent(firstPhaseDuration + secondPhaseDuration + thirdPhaseDuration), Ppar([
				Pseq([Event.silent(thirdPhaseDuration), ~singleActionPattern.value({
					~selectClip.value(0, 0);
				})]),
				~murmures.value(fourthPhaseDuration),
				Pseq([Event.silent(16), ~hiboux.value(fourthPhaseDuration - 16)]),
				~clochettes.value(fourthPhaseDuration + 32, rarement: true),
				~feuillesNappe.value(fourthPhaseDuration + 16),
			])]),
			Pseq([Event.silent(firstPhaseDuration + secondPhaseDuration + thirdPhaseDuration + fourthPhaseDuration), Ppar([
				Pseq([Event.silent(thirdPhaseDuration), ~singleActionPattern.value({
					~selectClip.value(0, 0);
				})]),
				Pseq([Event.silent(32), ~drumRack.value(fifthPhaseDuration - 32)]),
				~bassVoiceShaman.value(fifthPhaseDuration, withFifth: false)
			])])
		])
	]).play;
};

// Adjust the number inside Array.series() to adjust the number of loops.
Array.series(1).do { | i |
	TempoClock.default.sched(total * i, runLoop);
};
)