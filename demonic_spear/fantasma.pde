//clase publica toma detos de la clase iglesia y los usa en sus variables.
public class Fantasma extends Enemy{
  private int ladoos;
  int x=0;
    int n;
  public Fantasma(int num){
    salud=(int) random(5,10);
    maestro=false;
    numero=num;
    detenerse=false;
    vivo=true;
    contador = 0;
    direccionangulo=0.05;
    //aparicion de los personajes y movimiento.
    if(num%2==0){
      pos=new PVector (width/6+16*(num+1), -16*(num+1));
      parar=(height/2)-(16*(num+1));
      ladoos=-1;
    }
    if(num%2!=0){
      pos=new PVector(5*width/6-16*(num), -16*(num));
      parar=(height/2)-(16*(num));
      ladoos=1;
    }
    vel=new PVector(0, 10);
  }
  //Dibuja a los fantasmas en el juego.
  public void display(){
    if(vivo){
      n++;
  if(n==4)
  n=0;
  x+=20;
  if(x>width);
  x=0;
      image(fantasma[n], pos.x, pos.y);
    }else{
      contador++;
      if (contador<16)
        image(explosionAnim[contador], pos.x, pos.y, 64, 64);
    }
  }//movimiento de los fantasmas.
  public void move(){
    if(!detenerse && pos.y<parar){
      pos.add(vel);      
    }
    if (!detenerse && pos.y==parar)
      detenerse=true;
    if(detenerse){
      tiempo++;
      if (tiempo>=0 && angulo>-TWO_PI && angulo<TWO_PI){
        angulo+=direccionangulo;
        pos.add(ladoos*10*cos(angulo),0);
      }
      if (angulo<=-TWO_PI || angulo>=TWO_PI){
        angulo=0;
        tiempo=-180;
      }
    }
  }  //disparos de vomito.
  public void shoot(){
    int roll = (int) random (0,300);
    if (roll==1 && pos.x>0 && pos.x<width){
      Lanza lanza = new disparof(this);
      lanzas.add(lanza);
    }
  }//los puntos por asesinato.
  public void addScore(){
    puntaje+=500;
  }
}
