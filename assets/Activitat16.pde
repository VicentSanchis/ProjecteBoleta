/**
* Activitat 16. Afegim enemics al joc
* -------------------------------------------------------------------------------------------
* Afegim enemics al nostre programa. Hem d'usar arrays unidimensionals i l'objecte PVector
* que ens proporciona l'API de Processing. També afegirem mètodes de control per als enemics:
* actualització i display a banda de la comprovació de colisions entre la boleta i els enemics
* i control del final del joc quan s'haja menjat tots els enemics.
* @author Vicent Sanchis
* @since  2 desembre de 2023
* @version 1.0
*/
// Constants
// ----------------------------------------------------------------------------------------------
final static int TAM        = 30;   // Grandaria de la nostra boleta
final static int NUMENEMICS = 10;   // Número total d'enemics
final static int LAPSE      = 5000; // Temps de latència entre enemics
// ----------------------------------------------------------------------------------------------
// Variables Globals
// ----------------------------------------------------------------------------------------------
int     contEnemics;                // Comptador que m'indica quants enemics han aparegut ja
int     contMorts;                  // Comptador que m'indica el total d'enemics morts que porte
float   vel;                        // Dos enters que ens indicaran la velocitat de la boleta
color   colBoleta;                  // Color amb el que es pintarà la boleta.
color   colEnemics;                 // Color dels enemics
PVector direccio;                   // Vector de direcció de la boleta.
PVector posicio;                    // Vector de posició de la boleta. 
// ----------------------------------------------------------------------------------------------
// Tipus Compostos de Dades - Coleccions (Globals)
// ----------------------------------------------------------------------------------------------
PVector [] posEnemics;              // Array de pVectors on emmagatzememe posició dels enemics
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
  
  // Fase d'actualització
  actualitzaBoleta  ();
  actualitzaEnemics ();
  
  // Display
  dibuixaBoleta   ();
  dibuixaEnemics  ();
  mostraComptador ();
  
  // Lògica del joc
  comprovaColisions ();
  
  if (superaLimits())     // Si la boleta ha superat algun límit, rebota en sentit contrari.
    direccio.mult(-1);    // Per calcular el sentit contrari d'un vector el multipliquem per -1
}
/**
* Mètode inicialitzaApp: S'encarrega de fer part el que abans feia el setup però ara
* ho tenim tot localitzat a un sol mètode.
* @return void
*/
void inicialitzaApp() {
  contEnemics = 0;
  contMorts   = 0;
  posicio     = new PVector ();            // Creem l'objecte posció de tipus PVector
  direccio    = new PVector ();            // Creem l'objecte direcció de tipus PVector
  posicio.x   = random (100, 540);         // Coordenada X inicial aleatòria
  posicio.y   = random (50, 150);          // Coordenada Y inicial aleatòria
  direccio.x  = 0;                         // Velocitat X inicial zero
  direccio.y  = 0;                         // Velocitat Y inicial zero.
  vel         = 3;                         // Velocitat inicial constant
  colBoleta   = color (0, 0, 0);           // Color negre per a la boleta
  colEnemics  = color (255, 0, 0);         // Color roig als enemics
  posEnemics  = new PVector [NUMENEMICS];  // Reservem espai a l'array per a les posicions dels nostres enemics
}
/**
* Mètode actualitzaBoleta: s'encarrega de frame a frame anar actualitzant la posició
* de la boleta en base a la direcció i la velocitat
* @return void
*/
void actualitzaBoleta () {
  if (posicio == null || direccio == null)
    return;
    
  posicio.x = posicio.x + direccio.x*vel;
  posicio.y = posicio.y + direccio.y*vel;
}
/**
* Mêtode acttualitzaEnemics: s'encarrega de gestionar la lògica dels enemics que bàsicament consisteix en decidir
* quan apareix el primer i successius enemics fins l'últim controlant els intervals de temps.
* @return void
*/
void actualitzaEnemics () {
  
  int currentMilis = millis();   // La funció milis ens dona el total de milisegons que ha passat des que ha començat l'aplicació
  if ((currentMilis - contEnemics*LAPSE) > LAPSE && contEnemics < 10) {  // Cada 5 segons creem un enemic
    posEnemics [contEnemics] = new PVector (random(50, 600), random(50,420)); //<>//
    contEnemics ++;
  }
}
/**
* Mètode dibuixaEnemimcs: recorre l'array amb les posicions dels enemics i dibuixa tots aquells que no tingen valor null.
* @return void
*/
void dibuixaEnemics () {
  for (int i=0; i < NUMENEMICS; i++) {
    PVector v = posEnemics[i];
    if (v != null) {
      fill(colEnemics);
      circle(v.x, v.y, TAM);
    }
  }
}
/**
* Mêtode dibuixaBoleta: s'encarrega de mostrar la boleta en forma de cercle
* i amb grandaria TAM i del color que s'indique en la posició que es trobe 
* en el moment de la crida a la funció. Per paràmetre se li indica el color de la boleta.
* @param c color amb el que pintarem la boleta.
* @return void
*/
void dibuixaBoleta() {
  if (posicio == null)
    return;
    
  fill   (colBoleta);
  circle (posicio.x, posicio.y, TAM);
}
/**
* Mètode comprovaColisions per a cadascun dels enemics que s'estan dibuixant, comprova si està tocant
* amb la nostra boleta per tal d'eliminar-lo
* @return void
*/
void comprovaColisions () {
  for (int i = 0; i < NUMENEMICS; i++) {
    PVector v = posEnemics [i];
    
    if (posicio != null && v != null && v.dist(posicio) < TAM) {  
      posEnemics [i] = null; // Amb aquesta instrucció s'elimina l'eneimc.
      contMorts ++;
    }
  }
}
/**
* Mètode mostraComptador: mostra el total d'enemics eliminats
* @return void
*/
void mostraComptador () {
  textAlign (CENTER);
  textSize(22);
  fill (120);
  text ( "ENEMICS MORTS: " + contMorts + "/" + NUMENEMICS , 320, 50);
  
  if (contMorts == NUMENEMICS) {
    textSize(40);
    fill(255,0,0);
    text ("GAME OVER", 320, 240);
    posicio = null;
  }
}
/**
* Mètode superaLimits: aquest mètode comprova si la boleta ha tocat qualsevol dels límits
* del nostre tauler de joc. En cas positiu torna true sino false.
* @return true si ha tocat algun límit i false en cas contrari
*/
boolean superaLimits () {
  
  if (posicio == null)
    return false;
    
  if (posicio.x+TAM/2 > width)
    return true;
    
  else if (posicio.x-TAM/2 < 0)
    return true;
    
  else if (posicio.y+TAM/2 > height)
    return true;
    
  else if (posicio.y-TAM/2 < 0)
    return true;
    
  else
    return false;
}
/**
* Esdeveniment keyPressed: en aquest mètode propi de Processing, es controla quines són les
* tecles que es premem al teclat, podent associar-los alguna funcionalitat concreta.
* En el nostre cas eixa funcionalitat consisteix en canviar la direcció de la boleta.
*/
void keyPressed () {
  switch (keyCode) {
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
