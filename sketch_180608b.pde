import gab.opencv.*;
import processing.video.*;

Movie video;
OpenCV opencv;

int filtro = 1;

void setup() {
  size(960,540);
  
  video = new Movie(this,"Plant - 5635.mp4");
 
  opencv = new OpenCV(this,960,540);
  opencv.startBackgroundSubtraction(30,30,0.5);
  
  video.loop();
  video.play();

}

void draw() {
  
  image(video, 0, 0);  
  opencv.loadImage(video);
  
  opencv.updateBackground();
  opencv.dilate();
  opencv.erode();
  
  if (filtro==1){
  filter(GRAY);
  noStroke();
  if (key == 'z'){
    fill(#FF0318,70);
  }
  if (key == 'x'){
    fill(#FF03D6,70);
  }
  if (key == 'c'){
    fill(#3C03FF,70);
  }
  if (key == 'v'){
    fill(#03DBFF,70);
  }
  if (key == 'b'){
    fill(#12FF03,70);
  }
  if (key == 'n'){
    fill(#FFE603,70);
  }
  if (key == 'm'){
    fill(#FF5303,70);
  }
  if (key == ','){
    noFill();
  }
  for (Contour contour : opencv.findContours()) {
    contour.draw();
  }
  }

  fill(255);
  textSize(20);
  text("Haz clic para mostrar el original",330,40);
  text("Presiona las teclas: 'zxcvbnm,' para cambiar el color",250,60);

  
}

void movieEvent(Movie m) {
  m.read();
}


void mousePressed(){
  filtro=0;
}

void mouseReleased(){
  filtro=1;
}
