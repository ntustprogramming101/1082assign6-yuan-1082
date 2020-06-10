class Cabbage extends Item{
  
  PImage img;
  
  Cabbage(float x, float y){
    super(x, y);
    img = cabbage;
  }
  
  void display(){
    if(isAlive){
      image(img, x, y);
    }
  }
  
  void checkCollision(Player player){
    
    if(isAlive && player.health<player.PLAYER_MAX_HEALTH){
      super.checkCollision(player);
      if(!isAlive){
         player.health++;
      }
    }
  }
  
}
