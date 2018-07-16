visualHaptics vh = new visualHaptics();

int scene = 0;

void settings() {
  vh.settings(scene);
}

void setup() {
  vh.setup();
  
}


void draw() {
  vh.draw();
}

void mouseMoved() {
  vh.mouseMoved();
}

void keyPressed() {
  scene++;
  scene %= 3;

  vh.settings(scene);
 
}