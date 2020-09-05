//Este juego fue creado por los estudiantes Juan Sebastian Toloza y Jhorman Maldonado Rey, estudiantes de progamacion 1.es inspirado en el conocido juego galaga con muchas variaciones.
//**************************************************************************************************************************************************************************************
//DATOS DEL JUEGO:
//Imagenes y musica y algunas variables.
import ddf.minim.*;
Minim gestor;
AudioPlayer musica_fondo;
PImage historia;
PImage lanza;
PImage cruz;
PImage vomito;
PImage slogan;
PImage de;
PImage demonio[];
PImage monja[];
PImage m;
PImage mago[];
PImage f;
PImage fantasma[];
PImage mon;
PImage explosion;
PImage[] explosionAnim = new PImage[16];
PImage fondo;
PImage demon[];
PImage d;
PImage j;
PImage frente[];
int x=0;
int n=0;
int k=0;
PImage instrucciones;
PFont fuente;
//variables usadas en todas las clases del juego.

Jugador jugador;
ArrayList<Lanza> lanzas;//conjunto de arreglos.
ArrayList<Enemy> enemies;//conjunto de arreglos.
int niveles, dificultad, tiempog, nivel, tiempon, vidas, reiniciar, enemigocont, tiempouno, puntaje;
boolean nuevonivel, enemigosaparecen, fantasmasaparecen, nuevo;//variables de verdadero y falso.

//carga de imagenes ,sprites y musica tambien es donde se divide el movimiento de los sprites.
void setup() {
  gestor = new Minim(this);
  musica_fondo= gestor.loadFile("musica-suspenso-.mp3");
  musica_fondo.setGain(-20);
  musica_fondo.loop();
  frente=new PImage[4];
  demon=new PImage[10];
  mago= new PImage[10];
  fantasma= new PImage[4];
  demonio= new PImage[4];
  monja= new PImage[4];
  instrucciones= loadImage("instrucciones.png");
  historia= loadImage("Historia.png");
  lanza = loadImage("arma del demonio.png");
  cruz= loadImage("arma de los malos.png");
  vomito = loadImage("cruz grande.png");
  slogan = loadImage("Menu.png");
  de = loadImage("demo.png");
  demonio[0]=de.get(0,0,34,50);
  demonio[1]=de.get(34,0,34,50);
  demonio[2]=de.get(69,0,32,50);
  demonio[3]=de.get(103,0,25,50);
  m = loadImage("bruja.png");
  monja[0]=m.get(6,0,57,63);
  monja[1]=m.get(70,0,51,63);
  monja[2]=m.get(133,0,53,63);
  monja[3]=m.get(70,0,51,63);
  f = loadImage("fantasma.png");
  fantasma[0]=f.get(0,0,15,35);
  fantasma[1]=f.get(16,0,21,41);
  fantasma[2]=f.get(39,0,15,35);
  fantasma[3]=f.get(63,0,21,41);
  mon = loadImage("mago malo.png");
   mago[0]=mon.get(0,0,64,55);
  mago[2]=mon.get(65,2,57,57);
  mago[1]=mon.get(0,0,64,55);
  mago[3]=mon.get(65,2,57,57);
  mago[4]=mon.get(0,0,64,55);
  mago[6]=mon.get(65,2,57,57);
  mago[5]=mon.get(0,0,64,55);
  mago[7]=mon.get(65,2,57,57);
  mago[8]=mon.get(124,0,64,55);
  mago[9]=mon.get(189,0,57,57);
  d= loadImage("Logo.png");
  demon[0]=d.get(0,0,399,391);
  demon[1]=d.get(0,0,399,391);
  demon[2]=d.get(0,0,399,391);
  demon[3]=d.get(0,0,399,391);
  demon[4]=d.get(0,0,399,391);
  demon[5]=d.get(0,392,399,391);
  demon[6]=d.get(0,392,399,391);
  demon[7]=d.get(0,392,399,391);
  demon[8]=d.get(0,392,399,391);
  demon[9]=d.get(0,392,399,391);
  j=loadImage("frente.png");
  frente[0]=j.get(4,2,52,52);
  frente[1]=j.get(4,2,52,52);
  frente[2]=j.get(72,0,49,54);
  frente[3]=j.get(136,0,50,54);
  fondo = loadImage("fondo.png");
  fuente = createFont("Legendaire.ttf",35);
  textFont(fuente);
  explosion = loadImage("sangre.png");
  for (int i=0; i<explosionAnim.length/4;i++){
      for (int j=0; j<explosionAnim.length/4;j++){
        explosionAnim[j+4*i]=explosion.get(j*128, i*128, 128, 128);
      }
  }


//ajustes de la visualizacion del juego.

  size(800, 700);
  imageMode(CENTER);
  textAlign(CENTER);
  
  //configuraciones de todo el juego todo lo que se cambie aqui afecta directamente el juego.
  niveles=0;
  tiempog=0;
  nivel=1;
  tiempon=0;
  nuevonivel=false;
  reiniciar=0;
  vidas=3;
  enemigocont=10;
  nuevo=false;
  tiempouno=0;
  enemigosaparecen=false;
  fantasmasaparecen=false;
  puntaje=0;
}

//Dibuja todo lo del juego.                                                                                  
void draw() {
   frameRate(20); 
  bg();
  if (niveles<2)
    menu();
  if (niveles==2)
    game();
  if (niveles==3)
    gameOver();
} 
                                                                 
//Controles de el teclado del juego y acciones de las etapas.
void keyPressed() {
  //El principio de juego con el menu de opciones.
  if (niveles<2) {
    
    //Next menu
    if (key == ' '){
      niveles++;
    }
      
    //Select diff
    if (keyCode==DOWN) {
      if (dificultad<2)
        dificultad++;
      else
        dificultad=0;
      vidas=3-dificultad;
    }
    if (keyCode==UP) {
      if (dificultad>0)
        dificultad--;
      else
        dificultad=2;
      vidas=3-dificultad;
    }  
    if(keyCode=='C'){
         
      background(0);
        fill(255,255,0);
        textSize(35);
        
        text("CREDITOS", width/2, height/4);
        text("JHORMAN STIVEN MALDONADO REY", width/2, height/4+50);
        text("JUAN SEBASTIAN TOLOZA ORTEGA", width/2, height/4+100);
        text("TATIANA MALDONADO", width/2, height/4+150);
        text("GALAGA", width/2, height/4+200);
        text("PISKEL", width/2, height/4+250);
        text("HOLLOW KNIGHT", width/2, height/4+300);
        text("SONIDOS MP3", width/2, height/4+350);
        text("DOOM",width/2, height/4+400);
        }
       
       
  }
       
     if (key=='x'){
    image(historia,width/2,height/2);
    historia.resize(width,height);
     }
     
if (keyCode=='E'){
         delay(100);
      exit();
}

  //Muestra todo lo que esta pasando mientras estas luchando.
  if (tiempog>150 || nivel>1){
    jugador.move();
    if (tiempog>270)
      jugador.shoot();
  }
  

  
  
 //Muestra lo que aparece cuando mueres.
  if (niveles==3){
    if (keyCode == LEFT || keyCode == RIGHT){
      if (reiniciar==0)
        reiniciar=1;
      else
        reiniciar=0;
    }
    if (key==' '){
      if (reiniciar==0){
        tiempog=0;
        niveles=1;
        nivel=1;
        vidas=3;
        enemigosaparecen=false;
        fantasmasaparecen=false;
        puntaje=0;
      
      
  }if (reiniciar==1){
    exit();
} 
  
  }
  }
}
//Etapas de los niveles.
void keyReleased() {
  if (tiempog>150 || nivel>1){
    jugador.halt();
    jugador.ceaseFire();
  }
}
//Dibuja el fondo del juego.
void bg() {
  
  background(0);
  image(fondo,400,350);
  fondo.resize(width,height);
  

}
//Dibuja el menu pricipal.
void menu() {
  
  
  if (niveles==0) {
    
    //Portada del juego.
   k++;
  if(k==10)
  k=0;
  x+=20;
  if(x>width);
  x=0;
   image(slogan, width/2, height/4+163, width, height);
    image(demon[k], width/2, height-180, 400, 300);
    
    
  //Empieza el juego.
    if (frameCount%100<60) {
      fill(255);  
      textSize(36);
      text("PRESIONE ESPACIO PARA EMPEZAR", width/2, (height/2)-15);
    }
  }

  //Menu de opciones.
  if (niveles==1) {
   
    textSize(36);
    fill(255,0,255);
    
    text("SELECT DIFFICULTY:", width/2, height/3);
     fill(0);
    text("FACIL", width/2, height/3+50);
    text("NORMAL", width/2, height/3+100);
    text("DIFICIL", width/2, height/3+150);
     fill(255);
    if (dificultad==0)
      text("o", width/2-75, height/3+50);
    if (dificultad==1)
      text("o", width/2-75, height/3+100);
    if (dificultad==2)
      text("o", width/2-75, height/3+150);
    fill(0,255,50);
    text("MANTE PULSADO X PARA HISTORIA", width/2, height/3+300); 
    text("PULSE E PARA SALIR", width/2, height/3+400); 
    text("MANTE PULSADO C PARA VER LOS CREDITOS", width/2, height/3+350); 
    
  }

}
//Empieza el juego.
void game(){
  //Tiempo del juego.
  tiempog++;
  
  //Las istrucciones del juego y el nivel.
  if (tiempog<150 && nivel==1){
    nuevonivel=false;
    textAlign(CENTER);
    textSize(48);
    fill(255,255,0);
    image(instrucciones,width/2,height/2);
    instrucciones.resize(width,height);
    text("NIVEL "+nivel, width/2, 80);
    jugador = new Jugador();
    lanzas = new ArrayList<Lanza>();
    enemies = new ArrayList<Enemy>();
  }else if(tiempog<150 && nivel>1){
    nuevonivel=false;
    textAlign(CENTER);
    textSize(48);
    fill(255,255,0);
    text("NIVEL "+nivel, width/2, height/2);
    jugador.display();
    lanzas = new ArrayList<Lanza>();
    enemies = new ArrayList<Enemy>();
  }else if (tiempog<270){
    fill(230,0,0);
    textAlign(CENTER);
    textSize(48);
    text("LISTOS", width/2, height/2);
    jugador.display();
    if (!enemigosaparecen && nivel<4){
      for(int i=0;i<10;i++)
        enemies.add(new Monja(i));
      enemigosaparecen=true;
    }else if (!enemigosaparecen && nivel<6){
      for(int i=0;i<10;i++){
        if(i<6)
          enemies.add(new Monja(i));
        else if(i<10)
          enemies.add(new Fantasma(i));          
      }
      enemigosaparecen=true;
    }else if (!enemigosaparecen && nivel>=6){       
        for(int i=0;i<11;i++){
          if(i<6)
            enemies.add(new Monja(i));
          else if(i<10)
            enemies.add(new Fantasma(i));
          else if (!fantasmasaparecen &&i==10){
            enemies.add(new Monje(i));
            fantasmasaparecen=true;
          }
        }
       enemigosaparecen=true;
      }
  }else if (tiempog>=270 && enemies.size()>0){
    
  //El autmento de niveles y los enemigos.
    nuevonivel=true;
    jugador.display();
    for (int j=0;j<lanzas.size();j++){
      lanzas.get(j).display();
      for (int i=0;i<enemies.size();i++){
        lanzas.get(j).hurt(enemies.get(i));
        if (lanzas.get(j).hitEnemy(enemies.get(i))){
          enemies.remove(i).addScore();
          lanzas.get(j).sangrado=true; 
        }
        lanzas.get(j).hitPlayer(jugador);        
      }
      if (lanzas.get(j).correciondelsangrado())
        lanzas.remove(j);
    }
    for (Enemy e: enemies){
      e.display();
      e.move();
      e.shoot();
    }
    if (enemies.size()==1)
      if (enemies.get(0).maestro)
        for(int i=0;i<10;i++){
          if(i<6)
            enemies.add(new Monja(i));
          else if(i<10)
            enemies.add(new Fantasma(i));          
        }
  }
  if (nuevonivel && enemies.size()==0){
    tiempog=0;
    nivel++;
    enemigosaparecen=false;
    fantasmasaparecen=false;
    jugador.disparo=false;
  }
  if (vidas<=0){
    niveles++;
  }
  
 n++;
  if(n==4)
  n=0;
  x+=20;
  if(x>width);
  x=0;
  
  //Nos muestra las vidas que nos quedan.
  for(int i=1; i<=vidas; i++)
    image(demonio[n], 25*i-12, height-18, 25, 35);
  //Niveles segun su dificultad de enemigos.
  if (tiempog>=270 && enemies.size()>0){
    fill(255);
    textSize(36);
    textAlign(LEFT, TOP);
    text("NIVEL "+nivel, 0, 0);
    textSize(36);
    textAlign(RIGHT, TOP);
    text("PUNTOS : "+puntaje, width, 0); 
  }
  if (nuevo){
    //vida extra
    tiempouno++;
    if(tiempouno<100 && tiempouno>0){
      fill(0);
      textSize(36);
      textAlign(CENTER);
      text("VIDA EXTRA GANADA", width/2,height/2);
    }
    if(tiempouno==100){
      nuevo=false;
      tiempouno=0;
    }
      
  }
  
  
}
//Fin del juego o cuando mueres.
void gameOver(){
  textAlign(CENTER);
  textSize(48);
  fill(255);
  text("FIN DEL JUEGO", width/2, height/3);
  textSize(42);
  text("PUNTAJE: "+puntaje, width/2, height/2);
  text("REINICIAR", width/2, height/2+150);
  textSize(36);
  text("SI     NO", width/2, height/2+180);
  fill(0);{
  if (reiniciar==0)
  text("o         ", width/2-28, height/2+180);
  if (reiniciar==1) 
  text("       o  ", width/2-22, height/2+180);
  }
}
