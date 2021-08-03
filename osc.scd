~singleActionPattern = {
    | action |
    Pbind(
        \type, \action,
        \dur, Pseq([1]),
        \pfunc, Pfuncn(action, inf)
    );
};

~pollActionPattern = {
    | action, duration |
    Pbind(
        \type, \action,
        \dur, Pseq([1/10], duration * 10),
        \pfunc, Pfuncn(action, inf),
        \time, Ptime(inf)
    );
};

~panToRotate = {
    | pan |
    (0.5 + ((pan - 0.25) / 2)) % 1;
}