/***************************************************************
  Author : Nakul Rao I
  Date : 2-7-2013
  Description : Player1 control keys - W & S
                Player2 control keys - arrows
****************************************************************/


PFont font;

int height = 400;
int width = 800;
int paddle_len = 15;
int paddle_height = 50;
int paddle1_x = 0;
int paddle1_y = 175;
int paddle2_x = width-paddle_len;
int paddle2_y = 175;
float velocity = 3;
int vel_array[] = {-1, 1};
float ball_xvel = 3 * vel_array[int(random(0,2))];
int ball_yvel = 3 * vel_array[int(random(0,2))];
int ball_rad = 25;
int ball_xpos = int(random(300,500)); 
int ball_ypos = int(random(0,height));
int game_over = 1;

void setup(){
  size(width, height);  
  font = loadFont("AgencyFB-Reg-48.vlw");
  textFont(font);
  background(0);
  text("PLAYER1", 5, height/2);
  text("PLAYER2", 670, height/2);
  text("PONG", 350, height/4);
  text("Press SHIFT", 320, height/2);
  text(" to begin ", 350, height*3/4);
}

void draw(){
  if((game_over == 1) && keyPressed && (key == CODED)){
    if(keyCode == SHIFT){
      game_over = 0;
      velocity = 3;
      ball_xvel = 3 * vel_array[int(random(0,2))];
      ball_yvel = 3 * vel_array[int(random(0,2))];
      ball_xpos = int(random(300,500)); 
      ball_ypos = int(random(0,height));
    }
  }
    
  if (game_over == 0){
    background(0);
    stroke(#FFFFFF);
    line(width/2, 0, width/2, height);
    fill(255);
    rect(paddle1_x, paddle1_y, paddle_len, paddle_height);
    rect(paddle2_x, paddle2_y, paddle_len, paddle_height);
    ellipse(ball_xpos, ball_ypos, ball_rad, ball_rad);
    
    if(ball_xvel > 0){
      if (keyPressed && (key == CODED)) { 
        if (keyCode == UP) {
          if (paddle2_y > 0){ 
            paddle2_y-=3;
         }
        }
        else if (keyCode == DOWN) {
          if (paddle2_y < height-paddle_height){
            paddle2_y+=3;
          }
        }
      }
    }
    else{
      if (keyPressed) { 
        if ((key == 'w') || (key == 'W')) {
          if (paddle1_y > 0){ 
            paddle1_y-=3;
         }
        }
        else if ((key == 's') || (key == 'S')) {
          if (paddle1_y < height-paddle_height){
            paddle1_y+=3;
          }
        }
      }
    }
  
    ball_xpos += ball_xvel;
    ball_ypos += ball_yvel;
    
    if(ball_ypos < 3){
      ball_yvel = 3;      
    }
    else if(ball_ypos > (height-3)){
      ball_yvel = -3;
    }
  
    if(ball_xpos < paddle_len){
      if((ball_ypos > paddle1_y) && (ball_ypos < (paddle1_y + paddle_height))){
        ball_xvel = velocity;
        velocity += 0.5;
      }
      else{
        game_over = 1;
        background(255);
        textSize(48);
        fill(0);
        text("GAME OVER ", 300, height/4);
        text("PLAYER2 WINS", 300, height/2);
      }
    }
    else if(ball_xpos > (width-paddle_len)){
      if((ball_ypos > paddle2_y) && (ball_ypos < (paddle2_y + paddle_height))){
        ball_xvel = -velocity;
        velocity += 0.5;
      }
      else{
        game_over = 1;
        background(255);
        textSize(48);
        fill(0);
        text("GAME OVER ", 300, height/4);
        text("PLAYER1 WINS", 300, height/2);
      }
    }
  }
}
