/***************************************************
  Author : Nakul Rao I
  Date : 4-4-2013
  Description : Use arrow keys for control
****************************************************/

PFont font;

int height = 400;
int width = 320;
int paddle_x = 140;
int paddle_len = 50;
int paddle_height = 15;
int vel_array[] = {-1, 1};
int ball_xvel = 3 * vel_array[int(random(0,1))];
int ball_yvel = 3 * vel_array[int(random(0,1))];
int ball_rad = 25;
int ball_xpos = int(random(0,300)); 
int ball_ypos = int(random(0,320));
int game_over = 0;

void setup(){
  size(width, height);  
  font = loadFont("AgencyFB-Reg-48.vlw");
  textFont(font);
}

void draw(){
  if (game_over == 0){
    background(0);
    fill(255);
    rect(paddle_x, height-paddle_height, paddle_len, paddle_height);
    ellipse(ball_xpos, ball_ypos, ball_rad, ball_rad);
    if (keyPressed && (key == CODED)) { 
      if (keyCode == LEFT) {
        if (paddle_x > 0){ 
          paddle_x-=2;
       }
      }
      else if (keyCode == RIGHT) {
        if (paddle_x < 270){
          paddle_x+=2;
        }
      }
    }
  
    ball_xpos += ball_xvel;
    ball_ypos += ball_yvel;
    
    if(ball_xpos < 3){
      ball_xvel = 3;
    }
    else if(ball_xpos > (width-3)){
      ball_xvel = -3;
    }
  
    if(ball_ypos < 3){
      ball_yvel = 3;
    }
    else if(ball_ypos > (height-paddle_height-3)){
      if((ball_xpos > paddle_x) && (ball_xpos < (paddle_x+paddle_len))){
        ball_yvel = -3;
      }
      else{
        game_over = 1;
        background(255);
        textSize(48);
        fill(0);
        text("GAME OVER :(", 40, height/2);
      }
    }
  }
}
