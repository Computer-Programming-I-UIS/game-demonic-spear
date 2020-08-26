//esta es la herencia del juego de aqui salen todas las clases de los enemigos.
public abstract class Enemy{
  float parar, numero, tiempo, salud;
  int contador;
  boolean vivo, detenerse, maestro;
  PVector pos, vel;
  float angulo, direccionangulo;
  //dibujarlos.
  public abstract void display();
  //movimiento.
  public abstract void move();
  //los disparos.
  public abstract void shoot();
  //puntaje.
  public abstract void addScore();
}
