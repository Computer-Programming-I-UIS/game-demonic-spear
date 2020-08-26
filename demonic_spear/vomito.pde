//el arma de los fantasmas y el monje(vomito).
public class disparof extends Lanza{
  private PVector pos, vel;
  boolean sangrar, enemigotipo, golpev;
  private int contadorv;
  public disparof(Enemy e){
    enemigotipo=true;
    contadorv=0;
    sangrar=false;
    pos = new PVector(e.pos.x, e.pos.y+height/2);
    vel= new PVector(0, -10);
  }//dibuja la cantidad de vomito y la distancia y la velocidad del vomito.
  public void display(){
    if(pos.y>0){
      image(vomito, pos.x, pos.y, 12, height);
      pos.sub(vel);
    }
  }//el daño que causa al jugador al tocarlo.
  public void hitPlayer(Jugador p){
    if (!golpev && enemigotipo && pos.x>p.pos.x-19 && pos.x<p.pos.x+19 && pos.y-height/2<p.pos.y-26){
      golpev=true;
      vidas--;
      sangrar=true;
    }
  }
}
