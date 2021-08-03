~selectClip = {
    | layer, clip |
    {
        ~resolume.sendMsg("/composition/layers/" ++ layer ++ "/clips/" ++ clip ++ "/connect");
    }
};

~setOpacity = {
    | layer, opacity |
    {
        ~resolume.sendMsg("/composition/layers/" ++ layer ++ "/video/opacity", opacity);
    }
};

~singleActionPattern = {
    | action |
    Pbind(
        \type, \actionEvent,
        \dur, Pseq([1]),
        \action, action
    );
};

~pollActionPattern = {
    | action, duration |
    Pbind(
        \type, \actionEvent,
        \dur, Pseq([1/60], duration * 60),
        \action, action,
        \time, Ptime(inf)
    );
};

~panToRotate = {
    | pan |
    (0.5 + ((pan - 0.25) / 2)) % 1;
}