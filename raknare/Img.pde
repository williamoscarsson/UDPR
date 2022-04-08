class Img {
    //attributes
    int numbOfObjects; //Numbers of objects showing
    PImage img;

    Img(){
        getImg(); 
        numbOfObjects = (int)random(10) +1;
    }

    String getImg(){
        int temp = (int)random(6);
        switch (temp) {
            case 0 :
                img = loadImage("Imgs/apple.png");
                return "Apple";
            case 1 :
                img =loadImage("Imgs/Banana.png");
                return "Banan";
            case 2 :
                img =loadImage("Imgs/fish.png");
                return "Fisk";
            case 3 :
                img =loadImage("Imgs/lion.png");
                return "Lejon";
            case 4 :
                img =loadImage("Imgs/Monkey.png");
                return "Apa";
            case 5 :
                img =loadImage("Imgs/sun.png");
                return "Sol";
            default :
                img =loadImage("Imgs/sun.png");
                return "Sol";
        }
    }

    void imgOne(){
        image(img, 350, 300, 100, 100);
    }

    void imgTwo(){
        image(img, 300, 350, 100, 100);
        image(img, 400, 250, 100, 100);
    }

    void imgThree(){
        image(img, 250, 350, 100, 100);
        image(img, 350, 250, 100, 100);
        image(img, 450, 150, 100, 100);
    }

    void imgFhor(){
        image(img, 250, 350, 100, 100);
        image(img, 250, 150, 100, 100);
        image(img, 450, 150, 100, 100);
        image(img, 450, 350, 100, 100);
    }

    void imgFive(){
        image(img, 250, 350, 100, 100);
        image(img, 250, 150, 100, 100);
        image(img, 350, 250, 100, 100);
        image(img, 450, 150, 100, 100);
        image(img, 450, 350, 100, 100);
    }

    void imgSix(){
        image(img, 50, 350, 100, 100);
        image(img, 50, 150, 100, 100);
        image(img, 150, 250, 100, 100);
        image(img, 250, 150, 100, 100);
        image(img, 250, 350, 100, 100);

        image(img, 550, 250, 100, 100);
    }

    void imgSeven(){
        image(img, 50, 350, 100, 100);
        image(img, 50, 150, 100, 100);
        image(img, 150, 250, 100, 100);
        image(img, 250, 150, 100, 100);
        image(img, 250, 350, 100, 100);

        image(img, 450, 350, 100, 100);
        image(img, 550, 250, 100, 100);
    }

    void imgEight(){
        image(img, 50, 350, 100, 100);
        image(img, 50, 150, 100, 100);
        image(img, 150, 250, 100, 100);
        image(img, 250, 150, 100, 100);
        image(img, 250, 350, 100, 100);

        image(img, 450, 350, 100, 100);
        image(img, 550, 250, 100, 100);
        image(img, 650, 150, 100, 100);
    }

    void imgNine(){
        image(img, 50, 350, 100, 100);
        image(img, 50, 150, 100, 100);
        image(img, 150, 250, 100, 100);
        image(img, 250, 150, 100, 100);
        image(img, 250, 350, 100, 100);

        image(img, 450, 350, 100, 100);
        image(img, 450, 150, 100, 100);
        image(img, 650, 150, 100, 100);
        image(img, 650, 350, 100, 100);
    }

    void imgTen(){
        image(img, 50, 350, 100, 100);
        image(img, 50, 150, 100, 100);
        image(img, 150, 250, 100, 100);
        image(img, 250, 150, 100, 100);
        image(img, 250, 350, 100, 100);

        image(img, 450, 350, 100, 100);
        image(img, 450, 150, 100, 100);
        image(img, 550, 250, 100, 100);
        image(img, 650, 150, 100, 100);
        image(img, 650, 350, 100, 100);
    }

    void printImg(int i){
        switch (i) {
            case 1 :
                imgOne();
            break;
            case 2 :
                imgTwo();
            break;		
            case 3 :
                imgThree();
            break;	
            case 4 :
                imgFhor();
            break;	
            case 5 :
                imgFive();
            break;	
            case 6 :
                imgSix();
            break;	
            case 7 :
                imgSeven();
            break;	
            case 8 :
                imgEight();
            break;	
            case 9 :
                imgNine();
            break;	
            case 10 :
                imgTen();
            break;	
        }
    }

    int getNumbOfObjects(){
        return numbOfObjects;
    }
    
    void drawWinImg(float rotate){
        translate(400, 700);
        rotate(rotate);
        image(img,-100,-100,200,200);
    }
}