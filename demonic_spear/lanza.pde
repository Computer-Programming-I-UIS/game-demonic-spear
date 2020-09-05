//Es el arma del demonio.
public class Lanza{
  private PVector pos, vel;
  boolean sangrado, tipodevillano, golpe;
  private int contadorl;
  public Lanza(){
   golpe=false;
    tipodevillano=false;
    contadorl=0;
    sangrado=false;
    pos = new PVector(jugador.pos.x-1,jugador.pos.y-28);
    vel= new PVector(0, 20);
  }
  public Lanza(Enemy e){
    tipodevillano=true;
    contadorl=0;
    sangrado=false;
    pos = new PVector(e.pos.x, e.pos.y+16);
    vel= new PVector(0, -8);
  }
  public PVector getPos(){
    return pos;
  }
//Dibuja el arma y las condiciones.
  public void display(){
    if(!tipodevillano && pos.y>0 && !sangrado){
      image(lanza, pos.x, pos.y, 15, 20);
    pos.sub(vel);
    //dibuja el arma de las monjas.
    }else if(tipodevillano && pos.y>0 && !sangrado){
      image(cruz, pos.x, pos.y, 15, 20);
    pos.sub(vel);
    }else if (sangrado){
      contadorl++;
      if (contadorl<16)
        image(explosionAnim[contadorl], pos.x, pos.y, 64, 64);
    }
  }//son las condiciones de los golpes o de la interracion de objetos.
  public boolean hitEnemy(Enemy e){
    if (e.maestro && e.salud==0){
      vidas++;
      nuevo=true;
      return true;
    }
    return (e.salud==0 && !sangrado && !tipodevillano && pos.x>e.pos.x-16 && pos.x<e.pos.x+16 && pos.y<e.pos.y+16 && pos.y>e.pos.y-16);
  }//los disparos y el daño que causan.
  public void hitPlayer(Jugador p){
    if (!golpe && !sangrado&& tipodevillano && pos.x>p.pos.x-19 && pos.x<p.pos.x+19 && pos.y<p.pos.y+26 && pos.y>p.pos.y-26){
      golpe=true;
      vidas--;
      sangrado=true;
    }
  }//las heridas que recibe de los enemigos.
  public void hurt(Enemy d){
    if (d.salud>0 && !golpe && !tipodevillano && pos.x>d.pos.x-19 && pos.x<d.pos.x+19 && pos.y<d.pos.y+26 && pos.y>d.pos.y-26){
      golpe=true;
      d.salud--;
      sangrado=true;
    }
  }//corrige en caso de que las armas no toquen a los enemigos.
  public boolean correciondelsangrado(){
    return (pos.y<0 || pos.y>height);
  }
}
