float symbolSize =18;
float timeElapsed = 0;

PGraphics gfx;
PFont font;

Stream[] streams;


int rows;

void setup()
{
  //size(1024, 720, P2D);
  fullScreen(P2D);
  
  gfx = createGraphics(width, height, P2D);
  
  rows = (int)width / (int)symbolSize;
  streams = new Stream[rows];
  
  for (int i =0 ; i < streams.length; i++)
  {
    
    float newX = i * symbolSize;
    streams[i] = new Stream(newX,0);
    streams[i].prepare();
  }
    for (int i = 0; i < 300; i++)
    {
      println(PFont.list()[i]);
    }
  font = createFont("HiraginoSans-W3", symbolSize);
  
}


void draw()
{
  background(0);
  
  if (gfx != null)
  {gfx.textFont(font);}
  gfx.beginDraw();
  gfx.background(0);
  for (int i =0 ; i < streams.length; i++)
  {
    streams[i].update(timeElapsed);
    streams[i].render(timeElapsed);
  }
  gfx.endDraw();
  
  image(gfx,0,0);
  
  
  timeElapsed = 1 / frameRate;
}
