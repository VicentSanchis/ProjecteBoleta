/**
* Activitat 6. Que la boleta no aparega sempre al mateix lloc
* -------------------------------------------------------------------------------------------
* Hem de canviar al setup (inicialització de l'aplicació) els valors inicials de posX i
* posY de tal forma que es generen aleatòriament a l'inici del joc.
* @author Vicent Sanchis
* @since  10 octubre de 2023
* @version 1.0
*/
// Constants
// ------------------------------------------------------------------------------------------
final static float GRV = 0.098f;    // Força de la gravetat
final static int   TAM = 20;        // Grandaria de la nostra boleta
// ------------------------------------------------------------------------------------------
// Variables Globals
// ------------------------------------------------------------------------------------------
int posX, posY;                     // Dos enters que ens indicaran la posició de la boleta
float velX, velY;                   // Dos enters que ens indicaran la velocitat de la boleta
color colorRGB;                     // Tipus especial que ens serveix per establir colors RGB
// ------------------------------------------------------------------------------------------
/**
* Mètode setup: Mètode de cnfiguració i inicialització de la nostra aplicació. 
* Aquest mètode només s'executa una vegada a l'inici de l'aplicaciò.
* @return void
*/
void setup () {
  size (640, 480);
  posX      = (int) random (100, 540);   // Coordenada X inicial aleatòria
  posY      = (int) random (50, 150);    // Coordenada Y inicial aleatòria
  velX      = 0;                         // Velocitat X inicial zero
  velY      = 0;                         // Velocitat Y inicial zero.
  colorRGB  = color (0, 0, 0);           // Color negre
}
/**
* Metode draw: aquest mètode funciona com una espècies de bucle del joc. 
* S'executa a 60Hz, és a dir, 60 vegades o frames per segon.
* És en aquest mètode on s'aprofita per fer animacions
*/
void draw () {
  clear();
  background(255);

  // Actualitzem la posició de la boleta
  velY = velY + GRV*(frameCount/frameRate);
  posY = posY + (int) velY;

  // Dibuixem la boleta
  fill(0);
  circle(posX, posY, TAM);
}
