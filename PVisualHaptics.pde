class PVisualHaptics {
  PImage img;
  PImage cursor;

  boolean resizable = false; 
  int index;

  float cursor_x, cursor_y;


  visualHaptics() {

    if (index < 0 || index > 2) index =  0;
  }

  void settings(int _index) {
    index = _index;
    img = loadImage("img/img"+index+".jpg");

    int x_size = 100, y_size = 100;
    String d = P2D;

    if (index == 0) {

      x_size = img.width;
      y_size = img.height;
    }

    if (index == 1) {
      x_size = 300;
      y_size = 300;
      d = P3D;
    }

    if (index == 2) {
      cursor_x = mouseX;
      cursor_y = mouseY;

      x_size = 2 * img.width;
      y_size = img.height;
    }

    if (resizable) surface.setSize(x_size, y_size);
    else size(x_size, y_size, d) ;
  }

  void setup() {
    resizable = true;
    cursor = loadImage("img/cursor.png");
    noCursor();
    surface.setResizable(resizable);
  }


  void draw() {
    if (index == 0)depth();
    if (index == 1)solidity();
    if (index == 2)rough();
  }

  void depth() {
    imageMode(CORNER);
    image(img, 0, 0);


    float size = dist(img.width/2, img.height/2, mouseX, mouseY);

    if (size < 10) size = 10;

    imageMode(CENTER);
    image(cursor, mouseX, mouseY, size, size);
  }

  void solidity() {
    background(-1);
    imageMode(CENTER);
    image(img, width/2, height/2);


    float size = 200 - dist(img.width/2, img.height/2, mouseX, mouseY) ;


    if (dist(width/2, height/2, mouseX, mouseY) > 150) size = 50 ;

    if (size < 10) size = 10;

    image(cursor, mouseX, mouseY, size, size);
  }

  void rough() {
    background(-1);

    imageMode(CORNER);
    image(img, img.width, 0);

    imageMode(CENTER);
    image(cursor, cursor_x, cursor_y, 80, 80);

    cursor_x = mouseX;
    cursor_y = mouseY;
  }

  void mouseMoved() {

    if (index != 2)return;

    if (mouseX < img.width)return;

    int range_x = 5;
    int range_y = 5;

    cursor_x = mouseX + random(-range_x, range_x);
    cursor_y = mouseY + random(-range_y, range_y);
  }
}
