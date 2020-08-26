//es el jefe de los enemigos.
public class Monje extends Enemy{
  private int lados;
  int x=0;
    int n;
  public Monje(int num){
    salud=(int) random(20,50);
    maestro=true;
    detenerse=false;
    vivo=true;
    contador = 0;
      pos=new PVector(random(width/2), -16*(11));
      parar=(height/2)-(16*(11));
    vel=new PVector(0, 10);
    //la aparicion del monje.
    if(num%2==0){
      pos=new PVector(random(width)/6+(16*(num+1)), -16*(num+1));
      parar=(height/2)-(16*(num+1));
      angulo=PI/4;
      direccionangulo=-0.02;
    }
    if(num%2!=0){
      pos=new PVector(random(5*width)/6-(16*(num)), -16*(num));
      parar=(height/2)-(16*(num));
      direccionangulo=0.02;
      angulo=-PI/4;
    }
  }//dibuja al monje y tambien lo situa en posicion aleatoria.
  public void display(){
    if(vivo){
      n++;
  if(n==10)
  n=0;
  x+=20;
  if(x>width);
  x=0;
      image(mago[n], pos.x, pos.y);
    }else{
      contador++;
      if (contador<16)
        image(explosionAnim[contador], pos.x, pos.y, 64, 64);
    }
  }
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
        pos.add(lados*10*cos(angulo),0);
      }
      if (angulo<=-TWO_PI || angulo>=TWO_PI){
        angulo=0;
        tiempo=-180;
      }
    }
  }  
    //la interaccion de los disparos.
  public void shoot(){
    int roll = (int) random (0,800);
    if (roll==1 && pos.x>0 && pos.x<width){
      Lanza lanza = new disparof(this);
      lanzas.add(lanza);
    }
  }//los puntos que dan los enemigos.
  public void addScore(){
    puntaje+=1000;
  }
}
