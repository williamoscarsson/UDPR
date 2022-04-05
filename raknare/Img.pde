class Img {
    //attributes
    float numbOfObjects; //Numbers of objects showing
    PImage img;

    Img(){
        getImg(); 
        numbOfObjects = random(10) +1;
    }

    void getImg(){
        int temp = (int)random(6);
        switch (temp) {
            case 0 :
                img = loadImage("Imgs/apple.png");
            break;
            case 1 :
                img =loadImage("Imgs/Banana.png");
            break;
            case 2 :
                img =loadImage("Imgs/fish.png");
            break;
            case 3 :
                img =loadImage("Imgs/lion.png");
            break;
            case 4 :
                img =loadImage("Imgs/Monkey.png");
            break;
            case 5 :
                img =loadImage("Imgs/sun.png");
            break;    
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
}