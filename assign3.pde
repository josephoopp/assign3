PImage treasure,HP,enemy,fighter;              //int and PImage something
PImage bg1,bg2,bg3;
int bg1x,bg2x,bg3x,tsx,tsy,x,y;
int FTx,FTy,HPx,enmyState=1;
void setup() {                                //setup
  size(641, 482);
  treasure = loadImage("img/treasure.png");   // treasure
  tsx = floor(random(15, 340));
  tsy = floor(random(30, 440));
  HP = loadImage("img/hp.png");               // HP
  HPx = floor(random(20,200));
  enemy = loadImage("img/enemy.png");         // em 
  x = 0;y = floor(random(30, 410));
  fighter = loadImage("img/fighter.png");     // fighter
  FTx = 580; FTy = 150;
  bg1x = 0 ;                                  // BG img
  bg1 = loadImage("img/bg1.png");
  bg2 = loadImage("img/bg2.png"); 
}
void draw() {                                                 //draw
  image(bg1, bg1x, 0);image(bg2, bg2x, 0);image(bg1, bg3x, 0);//background
  bg2x = bg1x - 636; bg3x = bg2x - 636;bg1x = (bg1x += 5) % 1280;
  fill(255, 0, 0);image(HP, 4, 4);                            //hp glass
  rect(10, 15, HPx, 10);                                      //hp
  image(fighter, FTx, FTy);                                   //Fighter
  x=(x += 5)%920;                                             //enmy move
  image(enemy, x+3, y);                                       //enmy state
  image(treasure, tsx, tsy);                                  //ts state
  switch(enmyState){                                          //enemyState
  case 1: for(int i=0 , p = 0 ;i<5;i++,p+=65){                //line
    image(enemy, x -p, y);}
     if(x ==890){
     enmyState = 2;
     y=(int)random(130,300);}
                                                break;
  case 2: for(int i=0 , p = 0 ;i<5;i++,p+=65){                //diagonal line
     image(enemy, x -p, y-p/2); 
     } if(x == 890){
     enmyState = 3;
     y=(int)random(170,270);}
                                                break;
  case 3:for(int i=0 , p = 0 ;i<3;i++,p+=65){                  //tube
      image(enemy,x-p,y-p); 
      image(enemy,x-p,y+p);
      image(enemy,x-p-130,y-p+130);
      image(enemy,x-p-130,y+p-130);}       
     if(x == 890){
     enmyState = 1;
     y=(int)random(30,410);}
                                                break;
 }
}
