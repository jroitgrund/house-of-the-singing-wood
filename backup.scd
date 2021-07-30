~kick = Buffer.readChannel(s,"C:/Users/jonathan/Desktop/scc/Sons pour Supercollider 2/_DOME SOUNDS/_Dome-Sounds/kick/0004-FRAGMENTS_01_KICK_04.wav" );

~caveTom = Buffer.readChannel(s, "C:/Users/jonathan/Desktop/scc/Sons pour Supercollider 2/_DOME SOUNDS/_Samples-Transfer-Chapter/2-Crépuscule/_OneShot/TomCave.aif");

~murmures = ~readContentsAsBuffers("/Users/lewismurray/Desktop/DomeSupercollider/Chapitre3 - Rituel/MurmuresOneShot";
~clochettes = ~readContentsAsBuffers("/Users/lewismurray/Desktop/DomeSupercollider/Chapitre3 - Rituel/ClochetteOneShot/ClochetteReverb");
~clochettesDelay = ~readContentsAsBuffers("/Users/lewismurray/Desktop/DomeSupercollider/Chapitre3 - Rituel/ClochetteOneShot/ClochetteDelay");

(
Routine({
	1.wait;

	//Envelope control Synths
    Synth.new(\control, [
		\controlBus, ~bassIntroAmp,   // sustain until 1min50s, then release until 3min10sec
		\silence, 0,
		\attack, 0,
		\sustainTime, 100,
		\release, 80
	]);
	   Synth.new(\control, [
		\controlBus, ~murmuresAmp,   // sustain until 1min50s, then release until 3min10sec
		\silence, 0,
		\attack, 0,
		\sustainTime, 100,
		\release, 80
	]);
	   Synth.new(\control, [
		\controlBus, ~throatAmp,   // sustain until 1min50s, then release until 3min10sec
		\silence, 0,
		\attack, 0,
		\sustainTime, 100,
		\release, 80
	]);

t = TempoClock.new(90 / 60);

~pclochetteDelay = Pbind(
	\instrument, \play,
	\dur, Pwrand([
	Pseq([1,1,1,5], 1),
		Pseq([4,4], 8),
	], [0.3, 0.7], inf),
	\buf, Pxrand(c[\clochettesDelay] , inf),
	\amp, 0.3,
	\duration, 0,
	\stayMiddle, 1,
	\panSpeed, Prand([0.01,0.03],inf),
	\rate, 1,
	\out, Pxrand([0,1,2,3], inf),
).play(t, quant:1);


~pmurmures = Pbind(
	\instrument, \play,
	\dur, 10,
	\buf, Pxrand(a[\murmures], inf),
	\amp, 0.2,
	\ampBus, ~murmuresAmp,
	\duration, 0,
	\stayMiddle, 1,
	\panSpeed, Prand([0.01,0.03],inf),
	\rate, 1,
	\out, Pseq([0,1,2,3], inf),//Pxrand([0,1,2,3], inf),
		/*\window, Prand([0.05,0.3,0.08], inf),
		\hpf, Pwrand([60,500,1000,1400],[0.7,0.1,0.1,0.1], inf)*/
).play(t, quant:1);


/*	Pbind(
	\instrument, \play,
	\dur, Pxrand([
		Pseq([1,1,1,Rest(5)], 1),
		Pseq([0.5,0.5,0.5, Rest(6.5)], 1),
		Pseq([0.25,0.25,0.25,0.25,0.25],1),
		Pseq([0.125,0.125,0.125,0.125,0.25,0.5,1], 1)
	],
		inf),
	\buf, Pxrand(b[\clochettes] , inf),
	\amp, 0.3,
		\ampBus, ~clochettesAmp,
		\duration, 0,
	    \stayMiddle, 1,
	\panSpeed, Prand([0.01,0.03],inf),
	\rate, Pwrand([0,-7].midiratio,[0.7,0.3], inf),
	\out, Pxrand([0,1,2,3], inf),
		/*\window, Prand([0.05,0.3,0.08], inf),
		\hpf, Pwrand([60,500,1000,1400],[0.7,0.1,0.1,0.1], inf)*/
		\hpf, Pxrand([3000,100,80,500], inf)
).play(t, quant:4);*/


~pkick = Pbind(
	\instrument, \play,
		\dur, Pseq([0.5, 0.5, Rest(3), 0.5,0.5, Rest(1), 1.5, 0.5], inf),
	\buf, ~kick,
	\amp, 0.3,
	\duration, 0,
	\stayMiddle, 1,
	\panSpeed, Prand([0.01,0.03],inf),
	\rate, Pwrand([0,-7].midiratio,[0.7,0.3], inf),
	\out, Pxrand([0,1,2,3], inf),
).play(t, quant:1);

~caveTom = Pbind(
	\instrument, \play,
    \dur, Pseq([Rest(1),1, Rest(2.5), 0.25,0.25,1,Rest(2)], inf),
	\buf, ~caveTom,
	\amp, 0.3,
	\duration, 0,
	\stayMiddle, 1,
	\panSpeed, Prand([0.01,0.03],inf),
	\rate, Pwrand([0,-7].midiratio,[0.7,0.3], inf),
	\out, Pxrand([0,1,2,3], inf),
	\delayTime, 0,
).play(t, quant:1);

	//40.wait;

~pthroat = Pbind(
	\instrument, \play,
	\dur, 5,
	\buf, ~throat,
	\amp, 0.2,
	\duration, 0,
	\stayMiddle, 1,
	\panSpeed, Prand([0.01,0.03],inf),
	\rate, Prand([1.8,1.2,1], inf),
	\out, Pseq([0,1,2,3], inf),
	\lpf, 0,
).play(t, quant:1);




}).play;
)

/*
	Pbind(
		\dur, ~insects1.duration/3,
		\instrument, \play,
		\buf, ~insects1.duration,
		\amp, 0.3,
		\ampBus, ~insects1Amp,
		\duration, ~insects1.duration,
	    \stayMiddle, 0,
	\panSpeed, Prand([0.09,0.1], inf),
	\rate, Pxrand([0.95, 1.07], inf),/*Prand([
		Pseq([0],  2);
		Pseq([1], 2);
	], inf),*/
	    \out, 0,
		/*\window, Prand([0.05,0.3,0.08], inf),
		\hpf, Pwrand([60,500,1000,1400],[0.7,0.1,0.1,0.1], inf)*/
	).play;


	Pbind(
		\dur, ~bass.duration/3,
		\instrument, \playMono,
		\buf, ~bass,
		\amp, 0.3,
		\ampBus, ~bassAmp,
		\duration, ~bass.duration,
	    \stayMiddle, 0,
	\panSpeed, Prand([0.03, 0.07], inf),
	\rate, Pxrand([0.95, 1.8], inf),/*Prand([
		Pseq([0],  2);
		Pseq([1], 2);
	], inf),*/
	    \out, 0,
		/*\window, Prand([0.05,0.3,0.08], inf),
		\hpf, Pwrand([60,500,1000,1400],[0.7,0.1,0.1,0.1], inf)*/
	).play;*/


*/

	/*Pbind(
		\dur, ~water.duration/8,
		\instrument, \playMono,
		\buf, ~water,
		\amp, 0.7,
		\ampBus, ~waterAmp,
		\duration, ~water.duration,
	    \stayMiddle, 0,
	\panSpeed, Pxrand([0.03, 0.07, 0.06], inf),
	\rate, Pxrand([0.5, 0.6, 1], inf),/*Prand([
		Pseq([0],  2);
		Pseq([1], 2);
	], inf),*/
	    \out, 0,
		/*\window, Prand([0.05,0.3,0.08], inf),
		\hpf, Pwrand([60,500,1000,1400],[0.7,0.1,0.1,0.1], inf)*/
	).play;


	Pbind(
		\dur, ~owlLoop.duration/3,
		\instrument, \playMono,
		\buf, ~owlLoop,
		\amp, 0.6,
		\ampBus, ~owlLoopAmp,
		\duration,  1,
	    \stayMiddle, 1,
	\panSpeed, Pxrand([0.07,0.3], inf),
	//\rate, Prand([30, 25,37],inf).midiratio,
	/*Prand([
		Pseq([0],  2);
		Pseq([1], 2);
	], inf),*/
	    \out, 0,
		/*\window, Prand([0.05,0.3,0.08], inf),
		\hpf, Pwrand([60,500,1000,1400],[0.7,0.1,0.1,0.1], inf)*/
	).play;



	Pbind(
		\dur, 10,
		\instrument, \playMono,
	\buf, Pxrand([~cloche1,~cloche2, ~cloche3],inf),
		\amp, 0.3,
		\ampBus, ~cloche1Amp,
		\duration, 0,
	    \stayMiddle, 1,
	\out, Pxrand([0,1,2,3], inf),
	//\rate, Prand([30, 25,37],inf).midiratio,
	/*Prand([
		Pseq([0],  2);
		Pseq([1], 2);
	], inf),*/
	    \out, 0,
		/*\window, Prand([0.05,0.3,0.08], inf),
		\hpf, Pwrand([60,500,1000,1400],[0.7,0.1,0.1,0.1], inf)*/
).play(t, quant:1);

	Pbind(
		\instrument, \playMono,
	\dur, Pwrand([
		Pseq([2/1,8/1], 3),
		Pseq([1/8,4/1], 1),
	], [0.7, 0.3], inf),
	\buf, ~cloche2,
		\amp, 0.3,
		\ampBus, ~cloche1Amp,
		\duration, 0,
	    \stayMiddle, 0,
	\out, Pxrand([0,1,2,3], inf),
	\rate, Pxrand([
		Pxrand([-8,-6],4).midiratio,
	], inf),
	/*Prand([
		Pseq([0],  2);
		Pseq([1], 2);
	], inf),*/
	    \out, 0,
		/*\window, Prand([0.05,0.3,0.08], inf),
		\hpf, Pwrand([60,500,1000,1400],[0.7,0.1,0.1,0.1], inf)*/
).play(t, quant:1);

//~semiTone = 1.0594630944;