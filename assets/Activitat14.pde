/**
* Activitat 14. Ús d'objectes i funcions
* -------------------------------------------------------------------------------------------
* Introduim el concepte d'objecte i per això utilitzarem un objecte de l'API de Processing
* que és el PVector. Aquest objecte ens servirà per emmagatzemar informació relativa a
* posició de la boleta, direcció de la boleta. Que al final són parells de coordenades (vectors)
* @author Vicent Sanchis
* @since  25 octubre de 2023
* @version 1.0
*/
// Constants
// ------------------------------------------------------------------------------------------
final static float GRV = 0.098f;    // Força de la gravetat
final static int   TAM = 30;        // Grandaria de la nostra boleta
// ------------------------------------------------------------------------------------------
// Variables Globals
// ------------------------------------------------------------------------------------------
float   vel;                        // Dos enters que ens indicaran la velocitat de la boleta
color   colorRGB;                   // Tipus especial que ens serveix per establir colors RGB
PVector direccio;                   // Vector de direcció de la boleta.
PVector posicio;                    // Vector de posició de la boleta.
// ------------------------------------------------------------------------------------------
/**
* Mètode setup: Mètode de cnfiguració i inicialització de la nostra aplicació. 
* Aquest mètode només s'executa una vegada a l'inici de l'aplicaciò.
* @return void
*/
void setup () {
  size (640, 480);
  inicialitzaApp ();
}
/**
* Metode draw: aquest mètode funciona com una espècies de bucle del joc. 
* S'executa a 60Hz, és a dir, 60 vegades o frames per segon.
* És en aquest mètode on s'aprofita per fer animacions
*/
void draw () {
  clear();
  background(255);
  actualitzaBoleta();
  dibuixaBoleta(color(0,255,0));  // Cridem a dibuixaBoleta però amb un argument de color //<>//
}
/**
* Mètode inicialitzaApp: S'encarrega de fer part el que abans feia el setup però ara
* ho tenim tot localitzat a un sol mètode.
* @return void
*/
void inicialitzaApp() {
  posicio    = new PVector ();      // Creem l'objecte posció de tipus PVector
  direccio   = new PVector ();      // Creem l'objecte direcció de tipus PVector
  posicio.x  = random (100, 540);   // Coordenada X inicial aleatòria
  posicio.y  = random (50, 150);    // Coordenada Y inicial aleatòria
  direccio.x = 0;                   // Velocitat X inicial zero
  direccio.y = 0;                   // Velocitat Y inicial zero.
  vel        = 3;                   // Velocitat inicial constant
  colorRGB   = color (0, 0, 0);     // Color negre
}
/**
* Mètode actualitzaBoleta: s'encarrega de frame a frame anar actualitzant la posició
* de la boleta en base a la direcció i la velocitat
* @return void
*/
void actualitzaBoleta() {
  posicio.x = posicio.x + direccio.x*vel;
  posicio.y = posicio.y + direccio.y*vel;
}
/**
* Mêtode dibuixaBoleta: s'encarrega de mostrar la boleta en forma de cercle
* i amb grandaria TAM i del color que s'indique en la posició que es trobe 
* en el moment de la crida a la funció. Per paràmetre se li indica el color de la boleta.
* @param c color amb el que pintarem la boleta.
* @return void
*/
void dibuixaBoleta(color c) {
  fill   (c);
  circle (posicio.x, posicio.y, TAM);
}
/**
* Esdeveniment keyPressed: en aquest mètode propi de Processing, es controla quines són les
* tecles que es premem al teclat, podent associar-los alguna funcionalitat concreta.
* En el nostre cas eixa funcionalitat consisteix en canviar la direcció de la boleta.
*/
void keyPressed () {
  switch (keyCode) { //<>//
    case UP:
      direccio.x = 0;
      direccio.y = -1;
    break;
    
    case DOWN:
      direccio.x = 0;
      direccio.y = 1;
    break;
    
    case LEFT:
      direccio.x = -1;
      direccio.y = 0;
    break;
    
    case RIGHT:
      direccio.x = 1;
      direccio.y = 0;
    break;
  }
}
