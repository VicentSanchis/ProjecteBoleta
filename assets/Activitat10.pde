/**
* Activitat 10. Modifica el codi anterior
* -------------------------------------------------------------------------------------------
* Canviar el codi anterior per tal que tindre dues estructures condicionals en tinga una 
* només niada. if .. else if .. else
* @author Vicent Sanchis
* @since  20 octubre de 2023
* @version 1.0
*/
// Constants
// ------------------------------------------------------------------------------------------
final static float GRV = 0.098f;    // Força de la gravetat
final static int   TAM = 30;        // Grandaria de la nostra boleta
// ------------------------------------------------------------------------------------------
// Variables Globals
// ------------------------------------------------------------------------------------------
float posX, posY;                   // Dos enters que ens indicaran la posició de la boleta
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
  posX      = random (100, 540);   // Coordenada X inicial aleatòria
  posY      = random (50, 150);    // Coordenada Y inicial aleatòria
  velX      = 0;                   // Velocitat X inicial zero
  velY      = 0;                   // Velocitat Y inicial zero.
  colorRGB  = color (0, 0, 0);     // Color negre
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
  posY = posY + velY;
  
  // Comprovem si ha tocat terra i no ha desaparegut
  if (posY >= 480 - TAM/2 && posY <= 480 + TAM/2) {
    colorRGB = color(255,0,0);
    velY = velY * 0.5;
  }
  else if (posY >= 480+TAM/2) {  // Si ha desaparegut //<>//
    posY = -TAM/2;
    velY = 0;
    frameCount = 0;
  }
  else
    colorRGB = color(0,0,0);
  //<>//
  // Dibuixem la boleta
  fill(colorRGB);
  circle(posX, posY, TAM);
}
