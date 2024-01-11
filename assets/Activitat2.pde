/**
* Activitat 2. Declaració de variables al projecte
* -------------------------------------------------------------------------------
* Basant-nos en els identificadors pensats a l'activitat 1, declarem les
* variables amb els tipus necessaris.
* @author Vicent Sanchis
* @since  10 octubre de 2023
* @version 1.0
*/
// Variables Globals
// ------------------------------------------------------------------------------
int posX, posY;       // Dos enters que ens indicaran la posició de la boleta
float velX, velY;     // Dos decimals que ens indicaran la velocitat de la boleta
color colorRGB;       // Tipus especial que ens serveix per establir colors RGB
// ------------------------------------------------------------------------------
/**
* Mètode setup: Mètode de cnfiguració i inicialització de la nostra aplicació. 
* Aquest mètode només s'executa una vegada a l'inici de l'aplicaciò.
* @return void
*/
void setup () {
  size (640, 480);
}
/**
* Metode draw: aquest mètode funciona com una espècies de bucle del joc. 
* S'executa a 60Hz, és a dir, 60 vegades o frames per segon.
* És en aquest mètode on s'aprofita per fer animacions
*/
void draw () {
  clear ();
  background (255);
}
