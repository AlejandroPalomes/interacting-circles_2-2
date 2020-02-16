int numBoles = 10;

float [] px = new float [numBoles]; //declarem una array per les posicions de x
float [] py = new float [numBoles];//declarem una array per les posicions de y
float [] vx = new float [numBoles];//declarem una array per la velocitat de x
float [] vy = new float [numBoles];//declarem una array per la velocitat de y
float [] R = new float [numBoles];//declarem una array pel color R
float [] G = new float [numBoles];//declarem una array pel color G
float [] B = new float [numBoles];//declarem una array pel color B
float [] T = new float [numBoles];


void setup(){
  
  frameRate(60);
  size (600,600);
  
  for (int i=0; i<numBoles; i++){ //omplim l'array, sino està buida (assignem per despres poder dibuixar)
    px[i]=random(30,400); //estem omplint cada "forat" de 0 a 4([i]), amb un valor random de entre 0 i 400
    py[i]=random(30,400);
    vx[i]=random(0,1);
    vy[i]=random(0,1);
    R[i]=random(100,255);
    G[i]=random(100,255);
    B[i]=random(100,255);
    T[i]=random(50,150);
    
  }

}


void draw(){ //s'executa 30fps
  
  background (0);
  
  for (int i = 0; i<numBoles; i++){ //Dibuixem les boles, a traves de les dades que anteriorment hem omplert en el setup
    fill(R[i],G[i],B[i], T[i]); //apliquem el color i  transpariencia
    ellipse(px[i],py[i],30,30);//finalment dibuixem la elipse, en les posicions px/py[i] que anteriorment s'han generat
    
    px[i]= px[i] + vx[i];
    py[i]= py[i] + vy[i];
    
    if ((px[i]>= 585)||(px[i]<=15)){
        vx[i]=vx[i] *-1;
     }
      
    if ((py[i]>= 585)||(py[i]<=15)){
        vy[i]=vy[i] *-1;
    }
    
    for (int j = i+1; j<numBoles; j++){  //fem un bucle per poder compara dos tipus diferents de boles, per tal que no es xoquin
      
      if ((px[i]-15<=px[j]+15)&&(px[i]+15>=px[j]-15)&&(py[i]-15<=py[j]+15)&&(py[i]+15>=py[j]-15)){
        vx[i]=vx[i] *-1;
        vy[i]=vy[i] *-1;
    
      }
    }  
    
  }

  
  
}
