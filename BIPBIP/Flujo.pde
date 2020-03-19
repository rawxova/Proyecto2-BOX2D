class Flujo {
  
  int contador = 0;
  
  Flujo () {}

  void Pantallas() {
  switch (this.contador){
    case 0:
    Titulo ();
    break;
    
    case 1:
    Intro ();
    break;
    
    case 2:
    Juego ();
    break;
    
    case 3:
    Fin ();
    break;
  }
  }
  
  void Titulo() {
    
    background(200,20,0);
    imageMode(CORNER);
    image(titulo,0,0); 
    
    imageMode(CENTER);
    image(ti,590,180); 
    
{
 PFont f1;
f1= loadFont ("CharlemagneStd-Bold-48.vlw");
textFont (f1, 30);
fill (255,255,255);
textAlign (CENTER);
text ("pulsa 1 para comenzar", 610,655);
}

    if (keyPressed) {
    if(key == '1')
    contador++;
    }
  }
  
  
  void Intro() {
 
     background(200,20,0);
     imageMode(CORNER);
      image(intro,0,0); 
      
      imageMode(CENTER);
      image(co1,195,355);
      
      imageMode(CENTER);
      image(dial,470,115);
      
      imageMode(CENTER);
      image(bi1,990,480);
      
      imageMode(CENTER);
      image(nube,890,210);
       
      text ("pulsa 2 para divertirnos", 610,655);
   
    if (keyPressed) {
    if(key == '2')
    contador++;
    
    }
  }
  
  
  void Juego() {
    
     background(0,255,0);
     imageMode(CORNER);
     image(juego,0,0);
      
      if (random(1) < 0.2) {
    float sz = random(10,10);
    dinamitas.add(new Dinamita(random(width),10, sz));
  }

  float x = noise(xoff)*width;
  float y = noise(yoff)*height;
  xoff += 0.01;
  yoff += 0.01;

  if (mousePressed) {
    
    spring.update(mouseX,mouseY);
    spring.display();
  }
  
  else {
    spring.update(x,y);
  }
  
  bip.body.setAngularVelocity(0);
  
  
 for (int i = dinamitas.size()-1; i >= 0; i--) {
    Dinamita p = dinamitas.get(i);
    p.display();
   
    if (p.done()) {
      dinamitas.remove(i);
    }
  }
 
  bip.display();
  
  fill (0,0,139);
  text ("pulsa 3 para terminar con esta agonía", 610,655);
  

    if (keyPressed) {
    if(key == '3')
    contador++;

    }
  }
  
  void Fin () {
 
     background(200,20,0);
     imageMode(CORNER);
     image(fin,0,0); 
      
     imageMode(CENTER);
     image(jum,950,470);
     
     imageMode(CENTER);
     image(dial2,780,240);
      
     imageMode(CENTER);
     image(co2,350,385);
     
     imageMode(CENTER);
     image(nube2,160,160);
      
        {
       PFont f1;
       f1= loadFont ("CharlemagneStd-Bold-48.vlw");
       textFont (f1, 18);
       fill (255,255,255);
       textAlign (CENTER);
       text ("pulsa 'x' para volver al inicio", 250,660);
       text ("mejor pulsa 'z' para salir de aquí", 950,660);
       
        }
    
  

    if (keyPressed) {
    if(key == 'x' || key == 'X')
    contador = 0 ;
  
    }
    if (keyPressed) {
    if (key == 'z' || key == 'Z' )
    exit();
    
    }
  
  }
  
}
