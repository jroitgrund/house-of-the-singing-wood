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

play = {
	| playFunc |
	var playInfo, patterns, duration;
	playInfo = playFunc.value;
	duration = playInfo[0];
	patterns = playInfo[1];
	duration.wait;
	patterns.do { | pattern | pattern.stop; };
};

Routine({
	1.wait;

	Pseq([
		//Ppar(~playChapter1.value)
		//Ppar(~playChapter2.value)
		Ppar(~playChapter3.value)
		//Ppar(~playChapter4.value)
	], repeats: 1).play;
}).play;
)