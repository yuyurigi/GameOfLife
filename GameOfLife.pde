GOL gol;
PImage img, img2;
import java.util.Calendar;

void setup() {
  size(800, 800);
  gol = new GOL();
  img = loadImage("1.png");
}

void draw() {
  gol.generate();
  gol.display();
  image(img, 0, 0, width, height);
}

// reset board when mouse is pressed
void mousePressed() {
  gol.init();
}

void keyReleased(){
  if(key == 's' || key == 'S')saveFrame(timestamp()+"_####.png");
}

String timestamp(){
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
