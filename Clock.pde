class Clock extends Item{
  
  PImage img;
  
  Clock(float x, float y){
    super(x, y);
    img = clock;
  }
  
  void display(){
    if(isAlive){
      image(img, x, y);
    }
  }
  
  void checkCollision(Player player){
    super.checkCollision(player);
    if(!this.isAlive){
      addTime(15);
    }
  }
  
}
