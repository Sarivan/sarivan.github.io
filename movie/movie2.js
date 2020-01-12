var video;
var isFadeout = false;
var isFadein = false;
var rectAlpha = 0;
var fadeSpeed = 1;
var isPaused = false;

var videoWidth = 710;
var videoHeight = 400;
var now_frame;

function setup() {
  createCanvas(videoWidth, videoHeight);
  video = createVideo(['assets/fingers.mov', 'assets/fingers.webm']);
  video.hide();
  video.loop();
}

function draw() {
  background(150);
  if(!isPaused)
  {
    now_frame = video;
    image(now_frame, 0, 0);
  }
  else
  {
    image(now_frame, 0, 0);
  }
    noStroke();
    fill(0, 0, 0, rectAlpha);
    rect(0, 0, videoWidth, videoHeight);

    if(isFadeout)
    {
      fadeout();
    }
  
  if(isFadein)
  {
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
  if(!isFadeout)
  {
    isFadeout = true;
  }
  else if(!isFadein && isPaused)
  {
    isPaused = false;
    isFadein = true;
  }
}

function mousePressed()
{
}