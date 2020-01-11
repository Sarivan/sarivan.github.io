import processing.video.*;
Movie myMovie;

int movieWidth = 720;
int movieHeight = 1280;

boolean isPaused = false;

protected enum Mode {
  FadeOut,
  CrossDissolve,
  WhiteOut,
  BlackOut,
  Wipe_side,
  Wipe_middle,
  Extrusion, 
  iris_ellipse,
  SmoothZoom,
  Spin,
  SmoothSlide,
  CubeSpin,
  VRKuromariku,
  VRBura,
  VRMebiusuBeam,
  VRLightReak,
  VRRandomBlock,
  VRKosen,
  PageTurn,
  CrossZoom,  
}

Mode mode = Mode.FadeOut;
boolean isFadeout = false;
boolean isFadein = false;
float rectAlpha = 0;
float fadeSpeed = 1;


void settings() {
  size(movieWidth, movieHeight);
}
 
void setup() {
  myMovie = new Movie(this, "IMG_0680.MP4");
  myMovie.loop();
  myMovie.play();
  }

void draw() {
  image(myMovie, 0, 0, width, height);

  noStroke();
  fill(0, 0, 0, rectAlpha);
  rect(0, 0, width, height);

  if (mode == Mode.FadeOut && isFadeout) {
    fadeout();
  }
  if (mode == Mode.FadeOut && isFadein) {
    fadein();
  }
}

void movieEvent(Movie m) {
  m.read();
}

void fadeout() {
  rectAlpha += fadeSpeed;
  myMovie.volume(map(rectAlpha, 0, 255, 1, 0));

  if (rectAlpha > 255) {
    rectAlpha = 255;
    myMovie.pause();
    isFadeout = false;
    isPaused = true;
  }
}

void fadein() {
  rectAlpha -= fadeSpeed;
  myMovie.volume(map(rectAlpha, 255, 0, 0, 1));

  if (rectAlpha < 0) {
    rectAlpha = 0;
    isFadein = false;
  }
}

void keyPressed() {
  if (!isFadeout) {
    isFadeout = true;
  }
}

void mousePressed() {
  if (!isFadein && isPaused) {
    myMovie.play();
    isPaused = false;
    isFadein = true;
  }
}

//void keyPressed() {
//  myMovie.pause();
//}
//
//void mousePressed() {
//  myMovie.play();
//}
