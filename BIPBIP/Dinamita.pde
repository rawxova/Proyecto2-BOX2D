class Dinamita {

  Body body;
  
  float r;
  boolean borrar = false;
  boolean explo = false;


  Dinamita(float x, float y, float r_) {
    r = r_;
    makeBody(x, y, r);
    body.setUserData(this);
    
  }

  void killBody() {
    box2d.destroyBody(body);
  }
  
  void borrar() {
  borrar= true;
}

  void change() {
    explo = true;
  }

  
  boolean done() {
    
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if (pos.y > height+r*2 || borrar) {
      killBody();
      return true;
    }
    return false;
  }


  void display() {
  
    Vec2 pos = box2d.getBodyPixelCoord(body);
   
    float a = body.getAngle();
    
      pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    imageMode(CENTER);
    image (din,0, 0, r*11, r*11);
      popMatrix();
    
    if (explo == true){
      
      pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    imageMode(CENTER);
    image (exp,0, 0, r*12, r*12);
      popMatrix();
    
    }
  }

  
  void makeBody(float x, float y, float r) {
   
    BodyDef bd = new BodyDef();
   
    bd.position = box2d.coordPixelsToWorld(x, y);
    bd.type = BodyType.DYNAMIC;
    body = box2d.createBody(bd);

    
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    
    fd.density = random (1,5);
    fd.friction = 0.3;
    fd.restitution = random(0.4,0.9);
    
    box2d.setGravity(0, random(-80, -150));

   
    body.createFixture(fd);

    body.setAngularVelocity(random(-10, 10));
  }
}
