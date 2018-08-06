float size = 0;
float toff = 0;
float tincr = .05;
int p = 5;
void setup(){
  int w = 600;
  int h = 600;
  size(1000, 1000);
  background(0);
  stroke(255);
  hilXY(2, 2);
  strokeWeight(7);
}

void draw(){
  background(0);
  float N = pow(2, p);
  size = 640 * 10 / 6 / N;
  float[] prev = {0,0};
  float[] curr;
  
  for(int i = 0; i < N * N; i++){
    curr = hilXY(i, N);
    float r = noise(i + toff) * 255;
    float g = noise(i + 124 + toff) * 255;
    float b = noise(i + 64 + toff) * 255;
    stroke(r, g, b);
    line(prev[0], prev[1], curr[0], curr[1]);
    prev = curr;
  }
  toff += tincr;
}

int last2bits(int x){
  return (x % 4);
}

float[] hilXY(int hIndex, float N){
  int positions[][] = { {0,0}, {0,1}, {1, 1}, {1, 0} };
  
  int[] tmp = positions[last2bits(hIndex)];
  hIndex = (hIndex >>> 2);
  
  int x = tmp[0];
  int y = tmp[1];
  
  for(int n = 4; n <= N; n *= 2){
    int n2 = n / 2;
    
    switch(last2bits(hIndex)){
     case 0:
       int temp = x; x = y; y = temp;
       break;
     case 1:
       y = y + n2;
       break;
     case 2:
       x = x + n2; y = y + n2;
       break;
     case 3:
       temp = y; y = (n2-1) - x; x = (n2-1) - temp; x = x + n2;
       break;
    }
    
    hIndex = (hIndex >>> 2);
  
  }
  float[] pos = {size * x, size * y};
  return pos;
}

void keyPressed(){
 if(keyCode == UP){
   p--;
   if(p < 2){
     p = 2;
   }
 }
 else if(keyCode == DOWN){
  p++;
  if(p > 9){
    p = 9;
  }
 }
}
   
