int posX, posY;

void setup () {
    size(640,480);
    posX = 320;
    posY = 40;
}

void draw () {
    clear();
    background(255);
    fill(0);
    ellipse(posX, posY, 30, 30);

    posY = posY + 2;

}
