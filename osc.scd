~sendMsg = {
    | msg, value |
    ~resolume.sendMsg(msg, value);
    1
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
    | pan, panAdjust = 0.25 |
    (0.5 + ((pan - panAdjust) / 2)) % 1;
};

~selectRitual = {
    ~sendMsg.value("/composition/decks/1/select", 1);
};

~launchClipWithClochettesInRitualPart1 = {
    ~sendMsg.value("/composition/layers/8/clips/1/connect", 1);
};

~launchSecondClipWithClochettesInRitualPart1 = {
    ~sendMsg.value("/composition/layers/7/clips/1/connect", 1);
};

~launchClipForLastThirdOfRitualpart1 = {
    ~sendMsg.value("/composition/layers/6/clips/1/connect", 1);
};

~launchGrillonsClips = {
    ~sendMsg.value("/composition/layers/3/clips/1/connect", 1);
    ~sendMsg.value("/composition/layers/4/clips/1/connect", 1);
    ~sendMsg.value("/composition/layers/5/clips/1/connect", 1);
    ~sendMsg.value("/composition/layers/11/clips/1/connect", 1);
};

~setGrillonsTopLeftOpacity = {
    | amp |
    ~sendMsg.value("/composition/layers/3/video/opacity", 0.5 + (amp * 100));
};

~setGrillonsTopRightOpacity = {
    | amp |
    ~sendMsg.value("/composition/layers/4/video/opacity", 0.5 + (amp * 100));
};

~setGrillonsBottomLeftOpacity = {
    | amp |
    ~sendMsg.value("/composition/layers/5/video/opacity", 0.5 + (amp * 100));
};

~setGrillonsBottomRightOpacity = {
    | amp |
    ~sendMsg.value("/composition/layers/11/video/opacity", 0.5 + (amp * 100));
};

~clearGrillonsClips = {
    ~sendMsg.value("/composition/layers/3/clear", 1);
    ~sendMsg.value("/composition/layers/4/clear", 1);
    ~sendMsg.value("/composition/layers/5/clear", 1);
    ~sendMsg.value("/composition/layers/11/clear", 1);
};

~resetGrillonsLayersOpacity = {
    ~sendMsg.value("/composition/layers/1/video/opacity", 1);
    ~sendMsg.value("/composition/layers/1/video/opacity", 1);
    ~sendMsg.value("/composition/layers/1/video/opacity", 1);
    ~sendMsg.value("/composition/layers/1/video/opacity", 1);
};

~launchBassOndeRouge = {
    Routine {
        ~sendMsg.value("/composition/layers/9/clips/1/connect", 1);
    }.play;
};

~launchMurmuresRitualPart2Clip = {
    ~sendMsg.value("/composition/layers/8/clips/2/connect", 1);
    ~sendMsg.value("/composition/layers/12/clips/6/connect", 1);
};

~setParticulesOpacity = {
    | amp |
    ~sendMsg.value("/composition/layers/12/video/opacity", 0.5 + (amp * 50));
};

~clearMurmuresParticles = {
    ~sendMsg.value("/composition/layers/12/clear", 1);
};

~resetMurmuresParticlesOpacity = {
    ~sendMsg.value("/composition/layers/12/video/opacity", 1);
};

~launchTotemClip = {
    ~sendMsg.value("/composition/layers/8/clips/6/connect", 1);
};

~setTotemLayerOpacity = {
    | amp |
    ~sendMsg.value("/composition/layers/8/video/opacity", 0.5 + (0.5 * amp));
};

~clearTotemClip = {
    ~sendMsg.value("/composition/layers/8/clear", 1);
};

~resetTotemLayerOpacity = {
    ~sendMsg.value("/composition/layers/8/video/opacity", 1);
};

~rotateTotemClip = {
    | pan |
    // ~sendMsg.value("/composition/layers/8/video/effects/transform/rotationz", ~panToRotate.value(pan));
};

~resetTotemClipRotation = {
    ~sendMsg.value("/composition/layers/8/video/effects/transform/rotationz", 0.5);
};

~launchHibouxTribalClip = {
    | ev |
    var hardPan = ev[\hardPan];
    if (hardPan == 0, { ~sendMsg.value("/composition/layers/10/clips/9/connect", 1) }, 1);
    if (hardPan == 0.5, { ~sendMsg.value("/composition/layers/7/clips/9/connect", 1) }, 1);
    if (hardPan == 1, { ~sendMsg.value("/composition/layers/6/clips/9/connect", 1) }, 1);
    if (hardPan == 1.5, { ~sendMsg.value("/composition/layers/5/clips/9/connect", 1) }, 1);
};

~launchHibouxRandomClip1 = {
    ~sendMsg.value("/composition/layers/9/clips/6/connect", 1);
};

~launchHibouxRandomClip2 = {
    ~sendMsg.value("/composition/layers/9/clips/7/connect", 1);
};

~launchHibouxRandomClip3 = {
    ~sendMsg.value("/composition/layers/9/clips/8/connect", 1);
};

~launchHibouxRandomClip4 = {
    ~sendMsg.value("/composition/layers/9/clips/9/connect", 1);
};

~launchRitualPart3InitialClip = {
    ~sendMsg.value("/composition/layers/13/clips/14/connect", 1);
};

~launchRitualPart3KickClip = {
    ~sendMsg.value("/composition/layers/9/clips/15/connect", 1);
};

~launchMurmuresPart3Clip = {
    ~sendMsg.value("/composition/layers/11/clips/15/connect", 1);
};

~setMurmuresPart3ClipOpacity = {
    | amp |
    ~sendMsg.value("/composition/layers/11/video/opacity", 0.5 + (amp * 100));
};

~launchFougeresRondes = {
    ~sendMsg.value("/composition/layers/10/clips/15/connect", 1);
};

~removeFougeresRondes = {
    ~sendMsg.value("/composition/layers/10/clear", 1);
};

~setFougeresRondesOpacity = {
    | amp |
    ~sendMsg.value("/composition/layers/10/video/opacity", 0.5 + (amp * 200));
};

~setFougeresRondesRotation = {
    | pan |
    // ~sendMsg.value("/composition/layers/10/video/effects/transform/rotationz", ~panToRotate.value(pan));
};

~resetFougeresRondesLayerOpacity = {
    | amp |
    ~sendMsg.value("/composition/layers/10/video/opacity", 1);
};

~launchSnakeLoop = {
    ~sendMsg.value("/composition/layers/8/clips/20/connect", 1);
};

~setTribalOverlayOpacity = {
    | amp |
    ~sendMsg.value("/composition/layers/10/video/opacity", 0.2 + (amp * 300));
};

~clearTribalOverlayLayerOpacity = {
    ~sendMsg.value("/composition/layers/10/video/opacity", 1);
};

~launchTribalOverlay = {
    ~sendMsg.value("/composition/layers/10/clips/20/connect", 1);
};

~removeTribalOverlay = {
    ~sendMsg.value("/composition/layers/10/clear", 1);
};

~launchHibouxPart4Clip = {
    | ev |
    var hardPan = ev[\hardPan];
    var pan = 0;
    if (hardPan == 0, { pan = 0.25 }, 1);
    if (hardPan == 0.5, { pan = 0.5 }, 1);
    if (hardPan == 1, { pan = 0.75 }, 1);
    if (hardPan == 1.5, { pan = 1 }, 1);
    ~sendMsg.value("/composition/layers/7/clips/20/connect", 1);
    ~sendMsg.value("/composition/layers/7/clips/20/video/effects/transform/rotationz", pan);
};

~resetHibouxPart4ClipRotation = {
    ~sendMsg.value("/composition/layers/7/clips/20/video/effects/transform/rotationz", 0.5);
};

~launchRootsClip = {
    var clipOffset = rrand(0, 2);
    ~sendMsg.value("/composition/layers/9/clips/" ++ (20 + clipOffset) ++ "/connect", 1);
};

~launchFeuillesNappeTribal8 = {
    | ev |
    var iphase = ev[\iphase];
    ~sendMsg.value("/composition/layers/11/clips/20/connect", 1);
    ~sendMsg.value("/composition/layers/11/clips/20/transport/position", (iphase / 2) * 3236.6);
};

~clearFeuillesNappeTribal8 = {
    ~sendMsg.value("/composition/layers/11/clear", 1);
};

~setFeuillesNappeTribal8Opacity = {
    | amp |
    ~sendMsg.value("/composition/layers/11/video/opacity", 0.5 + (amp * 200));
};

~resetFeuillesNapeTribal8LayerOpacity = {
    ~sendMsg.value("/composition/layers/11/video/opacity", 1);
};

~launchRitualPart5InitialClips = {
    ~sendMsg.value("/composition/layers/8/clips/23/connect", 1);
};

~launchRitualPart5SecondClip = {
    ~sendMsg.value("/composition/layers/8/clear", 1);
    ~sendMsg.value("/composition/layers/9/clips/24/connect", 1);
};

~launchRitualPart5KickClips = {
    ~sendMsg.value("/composition/layers/9/clips/25/connect", 1);
    ~sendMsg.value("/composition/layers/10/clips/25/connect", 1);
};

~launchRitualPart5StabsClip = {
    ~sendMsg.value("/composition/layers/8/clips/25/connect", 1);
};

~setRitualPart5Layer8Opacity = {
    | amp |
    ~sendMsg.value("/composition/layers/8/video/opacity", 0 + (amp * 500));
};

~setRitualPart5Layer9Opacity = {
    | amp |
    ~sendMsg.value("/composition/layers/9/video/opacity", 0.6 + (amp  * 2.5));
};

~setBassVoicePart5Rotation = {
    | pan |
    // ~sendMsg.value("/composition/layers/9/video/effects/transform/rotationz", ~panToRotate.value(pan));
};

~resetBassVoicePart5Rotation = {
    ~sendMsg.value("/composition/layers/9/video/effects/transform/rotationz", 0.5);
};

~clearAllClips = {
    ~sendMsg.value("/composition/disconnectall", 1);
};

// BIOSPHERE

~selectBiosphere = {
    ~sendMsg.value("/composition/decks/2/select", 1);
};

~launchBiospherePart1Clips = {
    ~sendMsg.value("/composition/layers/10/clips/1/connect", 1);
    ~sendMsg.value("/composition/layers/10/video/opacity", 0.75);
};

~launchBiospherePart1LaterClip = {
    ~sendMsg.value("/composition/layers/7/clips/1/connect", 1);
};

~setBaleineClipOpacity = {
    | iteration |
        var progress = 2 * (iteration / 60);
        var opacity = (1 - ((progress - 1).abs));
        ~sendMsg.value("/composition/layers/10/video/opacity", 0.75 + (opacity / 4));
};

~launchBiospherePart1SecondClip = {
    ~sendMsg.value("/composition/layers/8/clips/1/connect", 1);
};

~setBiospherePart1SecondClipRotation = {
    | pan |
    // ~sendMsg.value("/composition/layers/8/video/effects/transform/rotationz", ~panToRotate.value(pan));
};

~launchBiospherePart1SireneClip = {
    | ev |
    var hardPan = ev[\hardPan];
    var clip = rrand(1, 2);
    var pan = 0;
    if (hardPan == 0, { pan = 0.25 }, 1);
    if (hardPan == 0.5, { pan = 0.5 }, 1);
    if (hardPan == 1, { pan = 0.75 }, 1);
    if (hardPan == 1.5, { pan = 1 }, 1);
    ~sendMsg.value("/composition/layers/6/clips/" ++ clip ++ "/connect", 1);
    ~sendMsg.value("/composition/layers/6/video/effects/transform/rotationz", pan);
};

~launchBiospherePart1HibouxClip = {
    | ev |
    var hardPan = ev[\hardPan];
    var clip = rrand(1, 2);
    var pan = 0;
    if (hardPan == 0, { pan = 0.25 }, 1);
    if (hardPan == 0.5, { pan = 0.5 }, 1);
    if (hardPan == 1, { pan = 0.75 }, 1);
    if (hardPan == 1.5, { pan = 1 }, 1);
    ~sendMsg.value("/composition/layers/5/clips/" ++ clip ++ "/connect", 1);
    ~sendMsg.value("/composition/layers/5/video/effects/transform/rotationz", pan);
};

~launchBiospherePart1Gouttes = {
    ~sendMsg.value("/composition/layers/9/clips/5/connect", 1);
};

~setGouttesClipOpacity = {
    | amp |
    ~sendMsg.value("/composition/layers/9/video/opacity", 0.5 + (amp * 150));
};

~selectBiospherePart1FinalClip = {
    ~sendMsg.value("/composition/layers/9/clips/12/connect", 1);
};

~launchBiospherePart2InitialClips = {
    ~sendMsg.value("/composition/layers/7/clips/13/connect", 1);
    ~sendMsg.value("/composition/layers/8/clips/13/connect", 1);
};

~launchBiospherePart2HalfwayClips = {
    ~sendMsg.value("/composition/layers/9/clips/15/connect", 1);
};

~setBiospherePart2MelodyClipOpacity = {
    | amp |
    ~sendMsg.value("/composition/layers/7/video/opacity", amp);
};

~launchBiospherePart2HibouxClip = {
    | ev |
    Routine {
        var hardPan = ev[\hardPan];
        var layer = 3 + (rrand(0, 1) * 2);
        var pan = 0;
        if (layer == 3, {
            if (hardPan == 0, { pan = 0.75 }, 1);
            if (hardPan == 0.5, { pan = 1 }, 1);
            if (hardPan == 1, { pan = 0.25 }, 1);
            if (hardPan == 1.5, { pan = 0.5 }, 1);
        }, 1);
        if (layer == 5, {
            if (hardPan == 0, { pan = 1 }, 1);
            if (hardPan == 0.5, { pan = 0.25 }, 1);
            if (hardPan == 1, { pan = 0.5 }, 1);
            if (hardPan == 1.5, { pan = 0.75 }, 1);
        }, 1);
        ~sendMsg.value("/composition/layers/" ++ layer ++ "/clips/13/connect", 1);
        ~sendMsg.value("/composition/layers/" ++ layer ++ "/video/effects/transform/rotationz", pan);
        (2 / TempoClock.default.tempo).wait;
        ~sendMsg.value("/composition/layers/" ++ (layer + 1) ++ "/clips/13/connect", 1);
        ~sendMsg.value("/composition/layers/" ++ (layer + 1) ++ "/video/effects/transform/rotationz", pan);
    }.play;
};

~launchBiospherePart3InitialClips = {
    ~sendMsg.value("/composition/layers/8/clips/19/connect", 1);
};

~launchBiospherePart3BirdClip = {
    ~sendMsg.value("/composition/layers/9/clips/21/connect", 1);
};

~launchFrogClip = {
    | ev |
    var hardPan = ev[\hardPan];
    var layer = 4 + rrand(0, 3);
    var pan = 0;
    if (hardPan == 0, { pan = 0 }, 1);
    if (hardPan == 0.5, { pan = 0.25 }, 1);
    if (hardPan == 1, { pan = 0.5 }, 1);
    if (hardPan == 1.5, { pan = 0.75 }, 1);
    ~sendMsg.value("/composition/layers/" ++ layer ++ "/clips/20/connect", 1);
    ~sendMsg.value("/composition/layers/" ++ layer ++ "/video/effects/transform/rotationz", pan);
};

~setBiospherePart3BirdClipOpacity = {
    | amp |
    ~sendMsg.value("/composition/layers/9/video/opacity", 0.75 + (amp * 25));
};

~launchUduClip = {
    | ev |
    Routine {
        var amp = ev[\amp];
        var layer = (1 + ev[\iteration]);
        var distance = rrand(0.5, 0.7);
        var pan = ev[\hardPan];
        var angle = ((pan * pi) + (3/4 * pi));
        var x = 0.5 + (cos(angle) * 0.5 * (600 / 16384) * distance);
        var y = 0.5 + (sin(angle) * 0.5 * (600 / 16384) * distance);
        var time = 0;
        if (layer == 4, {layer = 10}, 1);
        ~sendMsg.value("/composition/layers/" ++ layer ++ "/clips/23/connect", 1);
        ~sendMsg.value("/composition/layers/" ++ layer ++ "/video/effects/transform/positionx", x);
        ~sendMsg.value("/composition/layers/" ++ layer ++ "/video/effects/transform/positiony", y);
        while ({time < 1}, {
            ~sendMsg.value("/composition/layers/" ++ layer ++ "/video/opacity", time);
            ((1/10) / TempoClock.default.tempo).wait;
            time = time + (1/10);
        });
        ~sendMsg.value("/composition/layers/" ++ layer ++ "/clear", 1);
    }.play;
};

~clearAllLayers = {
    ~clearLayers.value([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]);
};

~clearLayers = {
    | layers |
    {
      "clearing layers".postln;
        layers.do { | layer |
            ~setLayerTransitionsOn.value(layer, 2);
            ~sendMsg.value("/composition/layers/" ++ layer ++ "/clear", 1);
            ~sendMsg.value("/composition/layers/" ++ layer ++ "/video/effects/transform/positionx", 0.5);
            ~sendMsg.value("/composition/layers/" ++ layer ++ "/video/effects/transform/positiony", 0.5);
            ~sendMsg.value("/composition/layers/" ++ layer ++ "/video/effects/transform/rotationz", 0.5);
            ~sendMsg.value("/composition/layers/" ++ layer ++ "/video/opacity", 1);
            Routine {
                2.wait;
                ~setLayerTransitionsOff.value(layer);
            }.play;
        }
    };
};

~setLayerTransitionsOn = {
    | layer, duration = 1 |
    ~sendMsg.value("/composition/layers/" ++ layer ++ "/transition/duration", duration / 10);
};

~setLayerTransitionsOff = {
    | layer |
    ~sendMsg.value("/composition/layers/" ++ layer ++ "/transition/duration", 0);
};

~record = {
    ~sendMsg.value("/composition/recorder/record", 1);
};

~stopRecording = {
    ~sendMsg.value("/composition/recorder/record", 0);
};