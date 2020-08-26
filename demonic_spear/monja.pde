//clase de las monjas.
public class Monja extends Enemy{
  int x=0;
    int n;
  public Monja(int num){
    salud=3;
    maestro=false;
    numero=random(num);
    detenerse=false;
    vivo=true;
    tiempo=0;
    contador = 0;
   //la posicion aleatoria de las monjas.
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
    vel=new PVector(0, 10);  
  }//dibuja a las monjas.
  public void display(){
    if(vivo){
      n++;
  if(n==4)
  n=0;
  x+=10;
  if(x>width);
  x=0;
      image(monja[n], pos.x, pos.y);
      
    }else{
      contador++;
      if (contador<16)
        image(explosionAnim[contador], pos.x, pos.y, 64, 64);
    }
  }//el moviemiento aleatorio de las monjas.
  public void move(){
    if(!detenerse && random(pos.y)<parar){
      pos.add(vel);      
    }
    if (!detenerse && pos.y==parar)
      detenerse=true;
    if(detenerse){
      tiempo++;
      if (tiempo>=60*(numero+1) && angulo>-TWO_PI+PI/4 && angulo<TWO_PI-PI/4){
        angulo+=direccionangulo;
        pos.add(random(10*sin(angulo)),random(2*cos(angulo)));
      }
      if (angulo<=-TWO_PI+PI/4 || angulo>=TWO_PI-PI/4){
        if(numero%2==0)
          angulo=PI/4;
        if(numero%2!=0)
          angulo=-PI/4;
        tiempo=-180;
      }
    }
    
  }//los diparos y el daño que reciben.
  public void shoot(){
    int roll = (int) random (0,100);
    if (roll==1 && pos.x>0 && pos.x<width){
      Lanza lanza = new Lanza(this);
      lanzas.add(lanza);
    }
  }//los puntos que otorgan.
  public void addScore(){
    puntaje+=100;
  }
}
