var myMovie; 
var playing = false;

function setup() {
  createCanvas(0, 0);
  var myMovie = createVideo(["movie/IMG_0680.MP4", "movie/jutan-ot2z9.mov"]);
  myMovie.loop();
}

function draw() {

}

function mouseClicked(event) {
  if (playing) {
     myMovie.pause();
  } else {
     myMovie.play();
  }
  playing = !playing;
}

