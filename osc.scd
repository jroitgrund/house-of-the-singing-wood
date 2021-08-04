~sendMsg = {
    | msg, value |
    // ~resolume.sendMsg(msg, value);
};

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
    );
};

~panToRotate = {
    | pan |
    (0.5 + ((pan - 0.25) / 2)) % 1;
};

~launchMurmuresParticles = {
   	~sendMsg.value("/composition/layers/1/clips/1/connect", 1); 
};

~removeMurmuresParticles = {
   	~sendMsg.value("/composition/layers/1/clear", 1); 
};

~launchRondRouge = {
    ~sendMsg.value("/composition/layers/1/clips/1/connect", 1);
};

~launchParticules = {
    ~sendMsg.value("/composition/layers/1/clips/1/connect", 1);
};

~clearParticules = {
    ~sendMsg.value("/composition/layers/1/clear", 1);
};

~launchBassOndeRouge = {
    ~sendMsg.value("/composition/layers/1/clips/1/connect", 1);
};

~launchGrillonsClips = {
    ~sendMsg.value("/composition/layers/1/clips/1/connect", 1);
    ~sendMsg.value("/composition/layers/2/clips/1/connect", 1);
    ~sendMsg.value("/composition/layers/3/clips/1/connect", 1);
    ~sendMsg.value("/composition/layers/4/clips/1/connect", 1);
};

~setGrillonsTopLeftOpacity = {
    | amp |
    ~sendMsg.value("/composition/layers/1/video/opacity", (amp * 1000));
};

~setGrillonsTopRightOpacity = {
    | amp |
    ~sendMsg.value("/composition/layers/1/clips/2/opacity", amp);
};

~setGrillonsBottomRightOpacity = {
    | amp |
    ~sendMsg.value("/composition/layers/1/clips/3/opacity", amp);
};

~setGrillonsBottomLeftOpacity = {
    | amp |
    ~sendMsg.value("/composition/layers/1/clips/4/opacity", amp);
};

~clearGrillonsClips = {
    ~sendMsg.value("/composition/layers/1/clear", 1);
    ~sendMsg.value("/composition/layers/2/clear", 1);
    ~sendMsg.value("/composition/layers/3/clear", 1);
    ~sendMsg.value("/composition/layers/4/clear", 1);
};

~resetGrillonsLayersOpacity = {
    ~sendMsg.value("/composition/layers/1/video/opacity", 1);
    ~sendMsg.value("/composition/layers/1/video/opacity", 1);
    ~sendMsg.value("/composition/layers/1/video/opacity", 1);
    ~sendMsg.value("/composition/layers/1/video/opacity", 1);
};

~launchBouleClip = {
    ~sendMsg.value("/composition/layers/1/clips/1/connect", 1);
};

~launchFondRougeRitualPart2Clip = {
    ~sendMsg.value("/composition/layers/1/clips/1/connect", 1);
};

~launchTotemClip = {
    ~sendMsg.value("/composition/layers/1/clips/1/connect", 1);
};

~setTotemLayerOpacity = {
    | amp |
    ~sendMsg.value("/composition/layers/1/video/opacity", amp);
};

~clearTotemClip = {
    ~sendMsg.value("/composition/layers/1/clear", 1);
};

~resetTotemLayerOpacity = {
    ~sendMsg.value("/composition/layers/1/video/opacity", 1);
};

~rotateTotemClip = {
    | pan |
    ~sendMsg.value("/composition/layers/1/clips/1/video/effects/transform/rotationz", ~panToRotate.value(pan));
};

~launchHibouxTribalClip = {
    | ev |
    var hardPan = ev[\hardPan];
    if (hardPan == 0, { ~sendMsg.value("/composition/layers/1/clips/1/connect", 1) }, 1);
    if (hardPan == 0.5, { ~sendMsg.value("/composition/layers/2/clips/1/connect", 1) }, 1);
    if (hardPan == 1, { ~sendMsg.value("/composition/layers/3/clips/1/connect", 1) }, 1);
    if (hardPan == 1.5, { ~sendMsg.value("/composition/layers/4/clips/1/connect", 1) }, 1);
};

~removeRedBackgroundAtEndOfRitualPart2 = {
    ~sendMsg.value("/composition/layers/1/clear", 1);
};

~launchRabbit = {
    ~sendMsg.value("/composition/layers/1/clips/1/connect", 1);
};

~launchKickParticles = {
    ~sendMsg.value("/composition/layers/1/clips/1/connect", 1);
};

~removeKickParticles = {
    ~sendMsg.value("/composition/layers/1/clear", 1);
};

~launchFougeresRondes = {
    ~sendMsg.value("/composition/layers/1/clips/1/connect", 1);
};

~removeFougeresRondes = {
    ~sendMsg.value("/composition/layers/1/clear", 1);
};

~setFougeresRondesOpacity = {
    | amp |
    ~sendMsg.value("/composition/layers/1/video/opacity", amp * 1500);
};

~resetFougeresRondesLayerOpacity = {
    | amp |
    ~sendMsg.value("/composition/layers/1/video/opacity", 1);
};

~launchSnakeLoop = {
    ~sendMsg.value("/composition/layers/1/clips/1/connect", 1);
};

~setTribalOverlayOpacity = {
    | amp |
    ~sendMsg.value("/composition/layers/1/video/opacity", amp * 2000);
};

~clearTribalOverlayLayerOpacity = {
    ~sendMsg.value("/composition/layers/1/video/opacity", 1);
};

~launchTribalOverlay = {
    ~sendMsg.value("/composition/layers/1/clips/1/connect", 1);
};

~removeTribalOverlay = {
    ~sendMsg.value("/composition/layers/1/clear", 1);
};

~launchEndOfRitual4Circle = {
    ~sendMsg.value("/composition/layers/1/clips/1/connect", 1);
};

~launchHibouxPart4Clip = {
    | ev |
    ~sendMsg.value("/composition/layers/1/clips/1/connect", 1);
    ~sendMsg.value("/composition/layers/1/clips/1/video/effects/transform/rotationz", ~panToRotate.value(ev[\hardPan]));
};

~launchFeuillesNappeTribal8 = {
    | ev |
    // TODO: LAUNCH IN CORRECT DIRECTION
    var iphase = ev[\iphase];
    var direction = ev[\direction];
    ~sendMsg.value("/composition/layers/1/clear", 1);
    if (iphase == 0, {
        ~sendMsg.value("/composition/layers/1/clips/1/connect", 1);
        ~sendMsg.value("/composition/layers/1/clips/1/transport/position", if (direction == 1, { 0 }, { 6005.0 }));
    }, 1);
    if (iphase == 0.5, {
        ~sendMsg.value("/composition/layers/1/clips/2/connect", 1);
        ~sendMsg.value("/composition/layers/1/clips/2/transport/position", if (direction == 1, { 0 }, { 6005.0 }));
    }, 1);
    if (iphase == 1, {
        ~sendMsg.value("/composition/layers/1/clips/3/connect", 1);
        ~sendMsg.value("/composition/layers/1/clips/3/transport/position", if (direction == 1, { 0 }, { 24023.0 }));
    }, 1);
    if (iphase == 1.5, {
        ~sendMsg.value("/composition/layers/1/clips/4/connect", 1);
        ~sendMsg.value("/composition/layers/1/clips/4/transport/position", if (direction == 1, { 0 }, { 6005.0 }));
    }, 1);
};

~clearFeuillesNappeTribal8 = {
    ~sendMsg.value("/composition/layers/1/clear", 1);
};

~setFeuillesNappeTribal8Opacity = {
    | amp |
    ~sendMsg.value("/composition/layers/1/video/opacity", amp * 1000);
};

~resetFeuillesNapeTribal8LayerOpacity = {
    ~sendMsg.value("/composition/layers/1/video/opacity", 1);
}
