/**
* Activitat 12. Modularitza el codi de projecte
* -------------------------------------------------------------------------------------------
* Apliquem els coneixements assolits al tema de programació modular i dividim el nostre codi
* en funcions.
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
int   dirX, dirY;                   // Vector de direcció de la boleta.
float posX, posY;                   // Dos enters que ens indicaran la posició de la boleta
float vel;                          // Dos enters que ens indicaran la velocitat de la boleta
color colorRGB;                     // Tipus especial que ens serveix per establir colors RGB
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
  dibuixaBoleta(); //<>//
}
/**
* Mètode inicialitzaApp: S'encarrega de fer part el que abans feia el setup però ara
* ho tenim tot localitzat a un sol mètode.
* @return void
*/
void inicialitzaApp() {
  posX      = random (100, 540);   // Coordenada X inicial aleatòria
  posY      = random (50, 150);    // Coordenada Y inicial aleatòria
  dirX      = 0;                   // Velocitat X inicial zero
  dirX      = 0;                   // Velocitat Y inicial zero.
  vel       = 3;                   // Velocitat inicial constant
  colorRGB  = color (0, 0, 0);     // Color negre
}
/**
* Mètode actualitzaBoleta: s'encarrega de frame a frame anar actualitzant la posició
* de la boleta en base a la direcció i la velocitat
* @return void
*/
void actualitzaBoleta() {
  // Actualitzem la posició de la boleta
  posX = posX + dirX*vel;
  posY = posY + dirY*vel;
}
/**
* Mêtode dibuixaBoleta: s'encarrega de mostrar la boleta en forma de cercle
* i amb grandaria TAM i del color que s'indique en la posició que es trobe 
* en el moment de la crida a la funció.
* @return void
*/
void dibuixaBoleta() {
  fill   (colorRGB);
  circle (posX, posY, TAM);
}
/**
* Esdeveniment keyPressed: en aquest mètode propi de Processing, es controla quines són les
* tecles que es premem al teclat, podent associar-los alguna funcionalitat concreta.
* En el nostre cas eixa funcionalitat consisteix en canviar la direcció de la boleta.
*/
void keyPressed () {
  switch (keyCode) { //<>//
    case UP:
      dirX = 0;
      dirY = -1;
    break;
    
    case DOWN:
      dirX = 0;
      dirY = 1;
    break;
    
    case LEFT:
      dirX = -1;
      dirY = 0;
    break;
    
    case RIGHT:
      dirX = 1;
      dirY = 0;
    break;
  }
}
