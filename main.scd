(
s.options.device = "ASIO : Focusrite USB ASIO";
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
TempoClock.default.tempo = 90/60;
"./common.scd".load;
"./playLoop.scd".load;

Routine({
	var loop, routines;
	1.wait;

	loop = ~playLoop.value;

	routines = loop[1].collect { | routine | routine.play; };

	Pseq([
		Ppar(loop[0])
	], repeats: 1).play;
}).play;
)
