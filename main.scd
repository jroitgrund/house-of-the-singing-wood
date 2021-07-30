(
// s.options.device = "ASIO : Focusrite USB ASIO";
s.options.numOutputBusChannels = 4;
s.options.memSize = 1000000;
s.reboot;
)

(
s.options.device = "ASIO : Realtek ASIO";
s.options.memSize = 1000000;
s.reboot;
);

(
var play;
TempoClock.default.tempo = 91.43/60;
"./common.scd".load;
"./chapter1.scd".load;
// "./chapter2.scd".load;
"./chapter3.scd".load;
// "./chapter4.scd".load;*/

Routine({
	var chapter1, chapter2, chapter3, chapter4, routines;
	1.wait;

	// var chapter1 = ~playChapter1.value;
	// var chapter2 = ~playChapter2.value;
	chapter3 = ~playChapter3.value;
	// var chapter4 = ~playChapter4.value;

	routines = chapter3[1].collect { | routine | routine.play; };

	Pseq([
		//Ppar(~playChapter1.value)
		//Ppar(~playChapter2.value)
		Ppar(chapter3[0])
		//Ppar(~playChapter4.value)
	], repeats: 1).play;
}).play;
)