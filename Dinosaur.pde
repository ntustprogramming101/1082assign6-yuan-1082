class Dinosaur extends Enemy {
  
  PImage img;
  float speedX = 1;
  float currentSpeed = 0;
  int direction = (speedX>0)?RIGHT:LEFT;
  final float TRIGGERED_SPEED_MULTIPLIER = 5;
  
  
  Dinosaur(float x, float y){
    super(x, y);
    img = dinosaur;
  }
  
  void display(){
    x+=currentSpeed;
    if(x>width-w || x<0){
      speedX *= -1;
    }
    if(speedX<0){
      direction=LEFT;
    }else{
      direction=RIGHT;
    }
    pushMatrix();
    translate(x,y);
    if(direction==RIGHT){
      scale(1,1);
      image(img, 0, 0, w, h);
    }else{
      scale(-1,1);
      image(img, -w, 0, w, h);
    }
    popMatrix();
  }
  
  void update(){
    if(player.y == this.y){
      if(this.x>player.x+w){ //go left
        if(speedX==-1){
          speedX *= TRIGGERED_SPEED_MULTIPLIER;
        }
      }
      if(this.x+w<player.x){ //go right
        if(speedX==1){
          speedX *= TRIGGERED_SPEED_MULTIPLIER;
        }
      }
    }else{
      if(speedX>1||speedX<-1){
        speedX /= TRIGGERED_SPEED_MULTIPLIER;
      }
    }
     currentSpeed = speedX;
  }
}
