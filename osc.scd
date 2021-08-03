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
   	~resolume.sendMsg("/composition/layers/1/clips/1/connect", 1); 
};

~removeMurmuresParticles = {
   	~resolume.sendMsg("/composition/layers/1/clear", 1); 
};

~launchRondRouge = {
    ~resolume.sendMsg("/composition/layers/1/clips/1/connect", 1);
};

~launchParticules = {
    ~resolume.sendMsg("/composition/layers/1/clips/1/connect", 1);
};

~clearParticules = {
    ~resolume.sendMsg("/composition/layers/1/clear", 1);
};

~launchBassOndeRouge = {
    ~resolume.sendMsg("/composition/layers/1/clips/1/connect", 1);
};

~launchGrillonsClips = {
    ~resolume.sendMsg("/composition/layers/1/clips/1/connect", 1);
    ~resolume.sendMsg("/composition/layers/2/clips/1/connect", 1);
    ~resolume.sendMsg("/composition/layers/3/clips/1/connect", 1);
    ~resolume.sendMsg("/composition/layers/4/clips/1/connect", 1);
};

~setGrillonsTopLeftOpacity = {
    | amp |
    ~resolume.sendMsg("/composition/layers/1/video/opacity", (amp * 1000));
};

~setGrillonsTopRightOpacity = {
    | amp |
    ~resolume.sendMsg("/composition/layers/1/clips/2/opacity", amp);
};

~setGrillonsBottomRightOpacity = {
    | amp |
    ~resolume.sendMsg("/composition/layers/1/clips/3/opacity", amp);
};

~setGrillonsBottomLeftOpacity = {
    | amp |
    ~resolume.sendMsg("/composition/layers/1/clips/4/opacity", amp);
};

~clearGrillonsClips = {
    ~resolume.sendMsg("/composition/layers/1/clear", 1);
    ~resolume.sendMsg("/composition/layers/2/clear", 1);
    ~resolume.sendMsg("/composition/layers/3/clear", 1);
    ~resolume.sendMsg("/composition/layers/4/clear", 1);
};

~resetGrillonsLayersOpacity = {
    ~resolume.sendMsg("/composition/layers/1/video/opacity", 1);
    ~resolume.sendMsg("/composition/layers/1/video/opacity", 1);
    ~resolume.sendMsg("/composition/layers/1/video/opacity", 1);
    ~resolume.sendMsg("/composition/layers/1/video/opacity", 1);
};

~launchBouleClip = {
    ~resolume.sendMsg("/composition/layers/1/clips/1/connect", 1);
};

~launchFondRougeRitualPart2Clip = {
    ~resolume.sendMsg("/composition/layers/1/clips/1/connect", 1);
};

~launchTotemClip = {
    ~resolume.sendMsg("/composition/layers/1/clips/1/connect", 1);
};

~setTotemLayerOpacity = {
    | amp |
    ~resolume.sendMsg("/composition/layers/1/video/opacity", amp);
};

~clearTotemClip = {
    ~resolume.sendMsg("/composition/layers/1/clear", 1);
};

~resetTotemLayerOpacity = {
    ~resolume.sendMsg("/composition/layers/1/video/opacity", 1);
};

~rotateTotemClip = {
    | pan |
    ~resolume.sendMsg("/composition/layers/1/clips/1/video/effects/transform/rotationz", ~panToRotate.value(pan));
};

~launchHibouxTribalClip = {
    | ev |
    var hardPan = ev[\hardPan];
    if (hardPan == 0, { ~resolume.sendMsg("/composition/layers/1/clips/1/connect", 1) }, 1);
    if (hardPan == 0.5, { ~resolume.sendMsg("/composition/layers/2/clips/1/connect", 1) }, 1);
    if (hardPan == 1, { ~resolume.sendMsg("/composition/layers/3/clips/1/connect", 1) }, 1);
    if (hardPan == 1.5, { ~resolume.sendMsg("/composition/layers/4/clips/1/connect", 1) }, 1);
};

~removeRedBackgroundAtEndOfRitualPart2 = {
    ~resolume.sendMsg("/composition/layers/1/clear", 1);
};

~launchRabbit = {
    ~resolume.sendMsg("/composition/layers/1/clips/1/connect", 1);
};

~launchKickParticles = {
    ~resolume.sendMsg("/composition/layers/1/clips/1/connect", 1);
};

~removeKickParticles = {
    ~resolume.sendMsg("/composition/layers/1/clear", 1);
};

~launchFougeresRondes = {
    ~resolume.sendMsg("/composition/layers/1/clips/1/connect", 1);
};

~removeFougeresRondes = {
    ~resolume.sendMsg("/composition/layers/1/clear", 1);
};

~setFougeresRondesOpacity = {
    | amp |
    ~resolume.sendMsg("/composition/layers/1/video/opacity", amp * 1500);
};

~resetFougeresRondesLayerOpacity = {
    | amp |
    ~resolume.sendMsg("/composition/layers/1/video/opacity", 1);
};

~launchSnakeLoop = {
    ~resolume.sendMsg("/composition/layers/1/clips/1/connect", 1);
};

~setTribalOverlayOpacity = {
    | amp |
    ~resolume.sendMsg("/composition/layers/1/video/opacity", amp * 2000);
};

~clearTribalOverlayLayerOpacity = {
    ~resolume.sendMsg("/composition/layers/1/video/opacity", 1);
};

~launchTribalOverlay = {
    ~resolume.sendMsg("/composition/layers/1/clips/1/connect", 1);
};

~removeTribalOverlay = {
    ~resolume.sendMsg("/composition/layers/1/clear", 1);
};

~launchEndOfRitual4Circle = {
    ~resolume.sendMsg("/composition/layers/1/clips/1/connect", 1);
};

~launchHibouxPart4Clip = {
    | ev |
    ~resolume.sendMsg("/composition/layers/1/clips/1/connect", 1);
    ~resolume.sendMsg("/composition/layers/1/clips/1/video/effects/transform/rotationz", ~panToRotate.value(ev[\hardPan]));
};

~launchFeuillesNappeTribal8 = {
    | ev |
    // TODO: LAUNCH IN CORRECT DIRECTION
    var iphase = ev[\iphase];
    var direction = ev[\direction];
    ~resolume.sendMsg("/composition/layers/1/clear", 1);
    if (iphase == 0, {
        ~resolume.sendMsg("/composition/layers/1/clips/1/connect", 1);
        ~resolume.sendMsg("/composition/layers/1/clips/1/transport/position", if (direction == 1, { 0 }, { 6005.0 }));
    }, 1);
    if (iphase == 0.5, {
        ~resolume.sendMsg("/composition/layers/1/clips/2/connect", 1);
        ~resolume.sendMsg("/composition/layers/1/clips/2/transport/position", if (direction == 1, { 0 }, { 6005.0 }));
    }, 1);
    if (iphase == 1, {
        ~resolume.sendMsg("/composition/layers/1/clips/3/connect", 1);
        ~resolume.sendMsg("/composition/layers/1/clips/3/transport/position", if (direction == 1, { 0 }, { 24023.0 }));
    }, 1);
    if (iphase == 1.5, {
        ~resolume.sendMsg("/composition/layers/1/clips/4/connect", 1);
        ~resolume.sendMsg("/composition/layers/1/clips/4/transport/position", if (direction == 1, { 0 }, { 6005.0 }));
    }, 1);
};

~clearFeuillesNappeTribal8 = {
    ~resolume.sendMsg("/composition/layers/1/clear", 1);
};

~setFeuillesNappeTribal8Opacity = {
    | amp |
    ~resolume.sendMsg("/composition/layers/1/video/opacity", amp * 1000);
};

~resetFeuillesNapeTribal8LayerOpacity = {
    ~resolume.sendMsg("/composition/layers/1/video/opacity", 1);
}
