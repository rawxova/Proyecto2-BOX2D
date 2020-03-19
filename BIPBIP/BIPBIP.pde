/* Programa: Proyecto 2 "BIP-BIP"
Autor: Molina Castillo Xóchitl Vanessa
NUA: 146690 */

//Bibliotecas BOX 2D
import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

import processing.sound.*;

//Importacion de imagenes
PImage titulo;
PImage intro;
PImage juego;
PImage fin;
PImage bipbip;
PImage co1;
PImage co2;
PImage jum;
PImage din;
PImage exp;
PImage nube;
PImage nube2;
PImage dial;
PImage dial2;
PImage ti;
PImage bi1;

//Audio
SoundFile tituloo;

//Creacion del mundo
Box2DProcessing box2d;


//Mis clases
Bip bip;
Spring spring;
Flujo p;

//Arreglos
ArrayList<Dinamita> dinamitas;

//Variables
float xoff = 0;
float yoff = 1000;


void setup() {
  size(1220,670);

  smooth();
  
  //Cargo mis imágenes
  titulo = loadImage("titulo.jpg");
  intro = loadImage("intro.jpg");
  juego = loadImage("juego.jpg");
  fin = loadImage("fin.jpg");
  bipbip = loadImage("bipbip.png");
  co1 = loadImage("co1.png");
  co2 = loadImage("co2.png");
  jum = loadImage("jum.png");
  din = loadImage("din.png");
  exp = loadImage("exp.png");
  nube = loadImage("nube.png");
  nube2 = loadImage("nube2.png");
  dial = loadImage("dial.png");
  dial2 = loadImage("dial2.png");
  ti = loadImage("ti.png");
  bi1 = loadImage("bi1.png");
  

  //Inicio mundo box2D
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.listenForCollisions();
  
  //Inicializar audio
  tituloo= new SoundFile(this,"tituloo.wav");

  // Inicializar objetos
  p = new Flujo();
  bip = new Bip(width/2,height/2);
  spring = new Spring();
  spring.bind(width/2,height/2,bip);
  dinamitas = new ArrayList<Dinamita>();
 
   tituloo.loop();
   
} 
void draw() {
 
  p.Pantallas();
  
  box2d.step();
}


void beginContact (Contact cp) {

  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();
 
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();


  if (o1.getClass() == Bip.class) {
    Dinamita p = (Dinamita) o2;
    p.change();
  } 

  else if (o2.getClass() == Bip.class) {
    Dinamita p = (Dinamita) o1;
    p.change();
  }
}


void endContact(Contact cp) {
}
