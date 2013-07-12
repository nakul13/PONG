
PFont font;

int height = 600;
int width = 420;
int paddle_x = 140;
int paddle_len = 70;
int paddle_height = 15;
int vel_array[] = {-1, 1};
float ball_xvel = 3 * vel_array[int(random(0,1))];
float ball_yvel = 3 * vel_array[int(random(0,1))];
float velocity = 3;
int ball_rad = 15;
int ball_xpos = int(random(0,300)); 
int ball_ypos = int(random(0,320));
int game_over = 0;
char paddle_color = 0;
char ball_color = 0;
color c[] = {#FFFF00, #FF00FF, #00FFFF};
color c1[] = {#FF0000, #00FF00, #0000FF};

void setup(){
  size(width, height);  
//    font = loadFont("AgencyFB-Reg-48.vlw");
//    textFont(font);
  background(255);
  smooth();
}

void draw(){
  if (game_over == 0){
    stroke(1);
    fill(c1[paddle_color]);
    rect(paddle_x, height-paddle_height, paddle_len, paddle_height);
    noStroke();
    fill(c[ball_color], 50);
    ellipse(ball_xpos, ball_ypos, ball_rad, ball_rad);
    if (keyPressed && (key == CODED)) { 
      if (keyCode == LEFT) {
        if (paddle_x > 0){ 
          paddle_x-=2;
       }
      }
      else if (keyCode == RIGHT) {
        if (paddle_x < (width - paddle_len)){
          paddle_x+=2;
        }
      }
    }
  
    ball_xpos += ball_xvel;
    ball_ypos += ball_yvel;
    
    if(ball_xpos < 3){
      ball_xvel = velocity;
    }
    else if(ball_xpos > (width-3)){
      ball_xvel = -velocity;
    }
  
    if(ball_ypos < 3){
      ball_yvel = velocity;
    }
    else if(ball_ypos > (height-paddle_height-3)){
      if((ball_xpos > paddle_x) && (ball_xpos < (paddle_x+paddle_len))){
        ball_yvel = -velocity;
        velocity += 0.01;
        paddle_color ++;
        if (paddle_color > 2){
          paddle_color = 0;
        }
        ball_color++;
        if (ball_color > 2){
          ball_color = 0;
        }    
      }
      else{
        game_over = 1;
//        background(255);
//        textSize(48);
//        fill(0);
//        text("GAME OVER :(", 40, height/2);
      }
    }
  }
}
