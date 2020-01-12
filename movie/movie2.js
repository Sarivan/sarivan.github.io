// PlayVideo
var video;

function setup() {
  createCanvas(640, 320);
  video = createVideo([ "movie.webm", "movie.mp4"]);
  video.hide();
  video.loop();
}

function draw() {
  image(video, 0, 0, width, height);
   filter(INVERT);
}
