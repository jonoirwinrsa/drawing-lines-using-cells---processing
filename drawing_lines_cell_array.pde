/*
  From openProcessing.org
  Need to find the correct source 
*/

 
//Constructing an array
 
//Assigning different values to new Cell
//the cells' density is changed
Cell[] myCells = new Cell[2500];//basically the number of nodes that it creates                      //array syntax   datatype[] var
 
 
void setup() {
  
  int height = 768;
  int width = 1366;
  
   background(255);
  size(width, height);
  for (int i = 0; i < myCells.length; i ++) {
    myCells[i] = new Cell();                        //array syntax var[element] = value    
  }  
}
 
 
void draw() {
  //beginRaw(PDF, "pattern1.pdf");
  for (int i=0; i< myCells.length; i++) {
   // myCells[i].display();
    myCells[i].update();
  }
   
  myCells[0].isseed = true;              
  
  for (int i=0; i<myCells.length; i+=1) {
    if(myCells[i].isseed == false){
      for(int j=0; j<myCells.length;j++){
        if(myCells[j].isseed == true){
          float d;
          d = PVector.dist(myCells[i].location, myCells[j].location);
            if(d < 25){                               
              myCells[i].isseed = true;
           
               //stroke(random(255),random(255),random(255), random(20,255)); //colorful
               stroke(10, random(20,255)); //grey
               strokeWeight(random(2, 3));
           
              line(myCells[i].location.x, myCells[i].location.y, myCells[j].location.x, myCells[j].location.y);
               
            }
          }
        }
      }
    }

  save("/images/"+hour()+""+minute()+""+second()+"__"+day()+""+month()+""+year()+".png"); //save the image as a PNG with a unique timestamped name
  }
 
 
class Cell{
   
  PVector location = new PVector();
  PVector velocity = new PVector();
  float dia;
  boolean isseed;
  float cellred, cellgreen, cellblue;
  float lineweight;
    
   
  Cell(){
   
    location = new PVector(random(width), random(height));
    dia = 5;
    isseed = false;
    cellred = 200;
    cellgreen = 255;
    cellblue = 100;
    lineweight = 0.1;
  }
   
  void display(){
    stroke(lineweight);
    if(isseed == true){
      fill(255,0,0);
    }
    if(isseed == false){
    fill(cellred,cellgreen,cellblue);
    }
    ellipse(location.x, location.y, dia,dia);
  }
  void update(){
    if(isseed == false){
    velocity = new PVector(random(-20,10),random(-20,20)); //playing with these numbers has some cool effects on the result
    location.add(velocity);
    }
     
  }
}

