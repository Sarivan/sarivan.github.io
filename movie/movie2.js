var video;
var isFadeout = false;
var isFadein = false;
var rectAlpha = 0;
var fadeSpeed = 1;
var isPaused = false;

var videoWidth = 720;
var videoHeight = 1280;
var now_frame;

function setup() {
  createCanvas(videoWidth, videoHeight);
  video = createVideo(["movie/data/IMG_0680.MP4", "movie/data/IMG_0680_noMusic.MP4", "movie/data/jutan-ot2z9.mov"]);
  video.elt.muted = true;
  video.loop();
  video.hide();
}

function draw() {
  if(!isPaused)
  {
    print("playing");
    background(150);
    image(video, 0, 0);
  }
  
  noStroke();
  fill(0, 0, 0, rectAlpha);
  rect(0, 0, videoWidth, videoHeight);

  if(isFadeout)
  {
    print("fadeout");
    fadeout();
  }
  
  if(isFadein)
  {
    print("fadein");
    fadein();
  }
}

function fadeout()
{
  rectAlpha += fadeSpeed;
  if(rectAlpha > 255)
  {
    rectAlpha = 255;
    isFadeout = false;
    isPaused = true;
  }
}

function fadein()
{
  rectAlpha -= fadeSpeed; 
  if(rectAlpha < 0)
  {
    rectAlpha = 0;
    isFadein = false;
  }
}

function keyPressed()
{
  if(!isFadeout && !isPaused)
  {
    print("fadeout_when keyPressed");
    isFadeout = true;
  }
  else if(!isFadein && isPaused)
  {
    print("fadein_when keyPressed");
    isPaused = false;
    isFadein = true;
  }
}

// function mousePressed()
//{
  // vid.elt.muted = true;
  // video.loop();
// }