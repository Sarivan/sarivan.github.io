float arcSize = 0;
int startSec = 0;
int i = 0;
int[] rgb;
int[] backgroundRGB;
Position[] textPosition;
int countDownTextSize = 1;
int countDown = 10;
int mode = 0;

class Position{
  int x;
  int y;
  int velocity;
  Position()
  {
    x = width;
    y = int(random(height));
    velocity = int(random(1, 15));
  }
  
  void update()
  {
    x = width;
    y = int(random(height));
    velocity = int(random(1, 15));
  }
}


void setup()
{
  size(640, 640);
  backgroundRGB = new int[]{0, 0, 0}; 
  background(backgroundRGB[0], backgroundRGB[1], backgroundRGB[2]);
  frameRate(60);
  arcSize = mag(width, height);
  rgb = new int[]{int(random(255)), int(random(255)), int(random(255))};
  //startSec = second();
  
  //textPosition = new Position[10];
  //for(int i = 0; i < textPosition.length; i ++)
  //{
  //  textPosition[i] = new Position();
  //}

  //while(true)
  //{  
  //  textSize(countDownTextSize + 1);
  //  float textWidth = textWidth("10");
  //  if(textWidth > width )
  //  {
  //    break;
  //  }
  //  countDownTextSize = countDownTextSize + 1;
  //}
  //println(countDownTextSize);
}


void draw()
{
  background(backgroundRGB[0], backgroundRGB[1], backgroundRGB[2]);
  // int elapsedSec = second() - startSec;
  // if(elapsedSec > 360) return;
  // arc( width/2, height/2, arcSize, arcSize, - PI / 2, - PI / 2 + PI * 2 / 360 * elapsedSec);
  noStroke();
  fill(rgb[0], rgb[1], rgb[2]);
  switch(mode)
  {
    case 0:
      rect(int(width - i * width / 360), 0, width, height);
      break;
    case 1:
      rect(int(i * width / 360), 0, width, height);
      break;
    case 2:
      rect(0, int(i * height / 360), width, height);
      break;
    case 3:
      rect(0, int(height - i * height / 360), width, height);
      break;
    case 4:
      arc(int(width/2), int(height/2), arcSize, arcSize, - PI / 2 - PI * 2 / 360 * i, - PI / 2);
      break;
    case 5:
      arc(int(width/2), int(height/2), arcSize, arcSize, - PI / 2, - PI / 2 + PI * 2 / 360 * i);
      break;
    case 6:
      fill(rgb[0], rgb[1], rgb[2], int(i * 255 / 360));
      rect(0, 0, width, height);
      break;
    case 7:
      if(i < 360 / 2)
      {
        fill(255, 255, 255, int(i * 255 * 2 / 360));
      }
      else if(i == 180)
      {
        backgroundRGB = new int[]{255, 255, 255};
        fill(255, 255, 255, 255);
      }
      else
      {
        fill(rgb[0], rgb[1], rgb[2], int((i - 180) * 255 * 2 / 360));
      }
      rect(0, 0, width, height);
      break;
    case 8:
      if(i < 360 / 2)
      {
        fill(0, 0, 0,  int(i * 255 * 2 / 360));
      }
      else if(i == 180)
      {
        backgroundRGB = new int[]{0, 0, 0};
        fill(0, 0, 0, 255);
      }
      else
      {
        fill(rgb[0], rgb[1], rgb[2], int((i - 180) * 255 * 2 / 360));
      }
      rect(0, 0, width, height);
      break;
    case 9:
      fill(rgb[0], rgb[1], rgb[2]);
      for(int ii = 0; ii < height / 7; ii++)
      {
         if(ii % 2 == 0)
         {
           rect(int(width - i * width / 360 ), int(ii * height / 7 ), width,int( height / 7 +1));
         }
         else
         {
           rect(int(- width + i * width / 360 ),int( ii * height / 7), width, int(height / 7 +1));
         }
      }
      break;
    case 10:
      fill(rgb[0], rgb[1], rgb[2]);
      rect(int(width / 2 - i * width / 360 /2) , 0 ,int( i * width / 360), height);
      break;
    case 11:
      fill(rgb[0], rgb[1], rgb[2]);
      ellipse(int(width / 2),int( height / 2), i * arcSize / 360, i * arcSize / 360);
      break;
    default:
      arc(width/2, height/2, arcSize, arcSize, - PI / 2, - PI / 2 + PI * 2 / 360 * i);

  }
  i = i + 1;
  if(i >= 360)
  {
    backgroundRGB = rgb.clone();
    rgb = new int[]{int(random(255)), int(random(255)), int(random(255))};
    i = 0;
    mode = int(random(11));
    //countDown = countDown - 1;
    //if(countDown < 0)
    //{
    //  countDown = 10;
    //}
  }
  
  //String strData = "hello world";
  //textSize(20);
  //textLeading(20);
  //float textWidth = textWidth(strData);
  //textAlign(CENTER);
  //for (int i = 0; i < textPosition.length; i++)
  //{
  //  fill(255, 255, 255);
  //  text(strData, textPosition[i].x, textPosition[i].y, textWidth, height);
  //  textPosition[i].x = textPosition[i].x - 1 * textPosition[i].velocity;
  //  if( textPosition[i].x + textWidth < 0)
  //  {
  //    textPosition[i].update();
  // }
  //}
  
  //textSize(countDownTextSize);
  //fill(255, 255, 255);
  //textAlign(CENTER, CENTER);
  //text(str(countDown), 0, 0, width, height);

}

void mouseClicked()
{
  backgroundRGB = new int[]{int(random(255)), int(random(255)), int(random(255))}; 
  background(backgroundRGB[0], backgroundRGB[1], backgroundRGB[2]);
}

