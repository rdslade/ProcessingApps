class Polynomial{
 
 ArrayList<Float> powers;
 float power;
 
 
 public Polynomial(ArrayList<Float> powers_){
  powers = powers_;
 }
 public Polynomial(float power_){
   power = power_;
 }
 public Polynomial(){
   power = 0;
 }
 
 String toString(){
  String str = "{";
  for(int i = 0; i < powers.size(); i++){
    str += powers.get(i) + ", ";
  }
  str += "}";
  return str;
 }
 
 float poly(float x){
   float val = 0;
   int curPow = 0;
   for(int i = powers.size() - 1; i >= 0; i--){
     val += pow(x, curPow) * powers.get(i);
     curPow++;
   }
   return val;
 }
 float e_x(float x){
   return pow((float)Math.E, x); 
 }
 float x_p(float x){
   return pow(x, power);
 }
}
