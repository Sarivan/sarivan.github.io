var myMovie; 
function setup() {
  createCanvas(0, 0);
  myMovie = createVideo(["movie/IMG_0680.MP4", "movie/jutan-ot2z9.mov"]);
  myMovie.loop();
}
