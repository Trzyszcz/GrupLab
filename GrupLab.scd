/command for starting a server
s.boot;

//We will now use GUI to control synths
p = ProxySpace();
p.gui;

//Now we will add first synth, it should appear in Proxy GUI, you can click play there
p[\example1] = {
	SinOsc.ar(freq: 220, phase: 0, mul: 1, add: 0);
};

//You don't need to specify all parameters all the time. See example:

p[\example2] = {
	SinOsc.ar(freq: 55, mul: 1);
};

//In this file we will use freq controlling frequency, and mul controling  loudness (with value between 0 and 1)

//Exercise 1: Make an oscilator playing sine wave with frequency of 110 hz, with full loudness

p[\exercise1] = {
	//place your code here
};

//Exercise 2: Make an oscilator playing sine wave octave higher, and half as loud as the previous one

p[\exercise2] = {
	//place your code here
};

//SuperCollider will play the last line of code in the function. For example, after executing code below we will only hear 660 hz

p[\example3] = {
	SinOsc.ar(freq: 55, mul: 1);
	SinOsc.ar(freq: 660, mul: 1);
};

//If we want to play more than one sound from one function, we can use Mix command, like this:

p[\example4] = {
	Mix.new([SinOsc.ar(freq: 55, mul: 1), SinOsc.ar(freq: 660, mul: 1);]);
};

//But instead of nesting commands like that, we can use variable to make it more readable

p[\example5v1] = {
	var sound1 = SinOsc.ar(freq: 55, mul: 1);
	var sound2 = SinOsc.ar(freq: 660, mul: 1);
	Mix.new([sound1, sound2]);
};

//As you can hear, the result is distorted. That's because we mixed two signals with mul 1. Let's hear the same example with lower mul:

p[\example5v2] = {
	var sound1 = SinOsc.ar(freq: 55, mul: 0.5);
	var sound2 = SinOsc.ar(freq: 660, mul: 0.5);
	Mix.new([sound1, sound2], [sound1, sound2]);
};

//Exercise 3: Make a function which plays three sine waves, with 110, 220, and 440 Hz

p[\exercise3] = {
	//place your code here
};

//The same way we insert output of Sine wave  oscilator to mix, we can insert output of pulse wave oscilator to a LPF

p[\example6] = {
	var pulsewave = LFPulse.ar(freq: 110, mul: 1);
	LPF.ar(in: pulsewave, freq: 440, mul: 1);
};

//Or modulate the loudness of one oscilator with another one

(
p[\example7] = {
	var sinewave = SinOsc.ar(freq: 0.5, mul: 0.5);
	SinOsc.ar(freq: 110, mul: 0.25 + sinewave);
};
)
//Or modulate the frequency of one oscilator with another one

p[\example8] = {
	var sinewave = SinOsc.ar(freq: 0.5, mul: 1);
	SinOsc.ar(freq: 110 + (30 * sinewave), mul: 1);
};

//Till now, all examples here where played in only one channel. If we send the server command to play an array of sounds, it will divide them to channels. See example:

p[\example9] = {
	var sound1 = SinOsc.ar(freq: 55, mul: 0.5);
	var sound2 = SinOsc.ar(freq: 660, mul: 0.5);
	[sound1, sound2];
};

//If we want to change a parameter while playing the synth, we have to use arguments

p[\example10] = { arg freq = 55;
	SinOsc.ar(freq: freq, mul: 0.5);
};

//Now, you should see a freq slider in ProxyMixer, after clicking on "ed" button
