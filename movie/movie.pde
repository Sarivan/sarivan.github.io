var myMovie; 
var playing = false;

function setup() {
  createCanvas(0, 0);
  myMovie = createVideo(["movie/data/IMG_0680.MP4", "movie/data/IMG_0680_noMusic.MP4", "movie/data/jutan-ot2z9.mov"]);
  myMovie.play();
  myMovie.showControls();
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

