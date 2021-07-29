(
s.options.device = "ASIO : Focusrite USB ASIO";
s.options.numOutputBusChannels = 4;
s.options.memSize = 1000000;
s.reboot;
)

(
s.options.device = nil;
s.reboot
);

(
var play;
"./common.scd".load;
"./chapter1.scd".load;
"./chapter2.scd".load;
"./chapter3.scd".load;
"./chapter4.scd".load;

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

	loop {
	    play.value(~playChapter1);
		//play(~playChapter2);
		//play(~playChapter3);
		//play(~playChapter4);
    }
}).play;
)