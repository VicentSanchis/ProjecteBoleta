/**
* Activitat 4. Ús de constants al nostre projecte
* -------------------------------------------------------------------------------------------
* Ja tenim variables declarades i inicialitzades. Ara usem les constants.
* @author Vicent Sanchis
* @since  10 octubre de 2023
* @version 1.0
*/
// Constants
// ------------------------------------------------------------------------------------------
final static float GRV = 0.098f;  // Força de la gravetat
final static int   TAM = 20;      // Grandaria de la nostra boleta
// ------------------------------------------------------------------------------------------
// Variables Globals
// ------------------------------------------------------------------------------------------
int posX, posY;       // Dos enters que ens indicaran la posició de la boleta
float velX, velY;     // Dos decimals que ens indicaran la velocitat de la boleta
color colorRGB;       // Tipus especial que ens serveix per establir colors RGB
// ------------------------------------------------------------------------------------------
/**
* Mètode setup: Mètode de cnfiguració i inicialització de la nostra aplicació. 
* Aquest mètode només s'executa una vegada a l'inici de l'aplicaciò.
* @return void
*/
void setup () {
  size (640, 480);
  posX = 320;                 // Coordenada X inicial
  posY = 50;                  // Coordenada Y inicial
  velX = 0;                   // Velocitat X inicial
  velY = 0;                   // Velocitat Y inicial
  colorRGB  = color (0,0,0);  // Li assignem a colorRGB el color negre
}
/**
* Metode draw: aquest mètode funciona com una espècies de bucle del joc. 
* S'executa a 60Hz, és a dir, 60 vegades o frames per segon.
* És en aquest mètode on s'aprofita per fer animacions
*/
void draw () {
  clear();
  background(255);
}
