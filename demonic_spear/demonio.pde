//Clase de el jugador.
public class Jugador {
  //Las variables a considerar.
  PVector pos, vel;
  int x=0;
  int n;
  private boolean izquierda, derecha, disparo;
  public Jugador() {
    pos= new PVector(width/2, height-80);
    vel= new PVector(7, 0);
  }
  //Dibuja al personaje principal.
  public void display() {
    n++;
  if(n==4)
  n=0;
  x+=20;
  if(x>width);
  x=0;
  image(frente[n],pos.x, pos.y);
    
    if (izquierda && pos.x>20){ 
      pos.sub(vel);
    }
  
     if (derecha && pos.x<width-20){
      pos.add(vel);
     }
  
     if (disparo && frameCount%5==0){
      Lanza lanza = new Lanza();
      lanzas.add(lanza);
      
   
  }
  }
  
  //Movimiento del personaje principal.
  public void move() {
       
    if (keyCode == LEFT) {
      izquierda=true;
      derecha=false;
      
    }
     if (keyCode == RIGHT) {
      derecha=true;
      izquierda=false;
     
    }
  }//las condiciones de los extremos de la pantalla.
  public void halt(){
    if (keyCode == LEFT){
       izquierda=false;
       
     }
     if (keyCode == RIGHT){
       derecha=false;
        
     }
  }//el disparo.
  public void shoot(){
    if (key == ' ')
      disparo=true;
  }//parar de disparar
  public void ceaseFire(){
    if (key == ' ')
      disparo=false;
  }
}
