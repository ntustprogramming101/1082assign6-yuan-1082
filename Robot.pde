class Robot extends Enemy{
	// Requirement #5: Complete Dinosaur Class

	final int PLAYER_DETECT_RANGE_ROW = 2;
	final int LASER_COOLDOWN =3000;
	final int HAND_OFFSET_Y = 37;
	final int HAND_OFFSET_X_FORWARD = 64;
	final int HAND_OFFSET_X_BACKWARD = 16;
  float speedX = 2;
  float currentSpeed = 0;
  float nowTime = millis();
  float lastTime = 0;
  int direction = (speedX>0)?RIGHT:LEFT;
  PImage img;
  Laser laser;


  Robot(float x, float y){
    super(x, y);
    img = robot;
    laser = new Laser();
  }
  
  void display(){
    x+=currentSpeed;
    if(x>width-w || x<0){
      speedX *= -1;
    }
    if(speedX>0){
      direction=RIGHT;
    }else if(speedX<0){
      direction=LEFT;
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
    laser.display();
    
  }
  
  void update(){
    laser.checkCollision(player);
    laser.update();
    if(checkX() && checkY()){
      speedX = 0;
      nowTime = millis();
      if(nowTime-lastTime>LASER_COOLDOWN){
        laser.fire(direction==LEFT?HAND_OFFSET_X_BACKWARD+x:HAND_OFFSET_X_FORWARD+x, HAND_OFFSET_Y+y , (player.x+w/2), (player.y+h/2));
        lastTime = nowTime;
      }
    }else{
      if(direction==RIGHT){
        speedX = 2;
      }else{
        speedX = -2;
      }
    }
    currentSpeed = speedX;
  }
  

  boolean checkX(){
    if(direction==LEFT && (this.x+HAND_OFFSET_X_BACKWARD)>(player.x+w/2)){ //go left
      return true;
    }else if(direction==RIGHT && (this.x+HAND_OFFSET_X_FORWARD)<(player.x+w/2)){ //go right
      return true;
    }
    return false;
  }
  
  boolean checkY(){
    if(player.row>=(this.y/SOIL_SIZE)-PLAYER_DETECT_RANGE_ROW && player.row<=(this.y/SOIL_SIZE)+PLAYER_DETECT_RANGE_ROW){
      return true;
    }else{
      return false;
    }
  }  
}
