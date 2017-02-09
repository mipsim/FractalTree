/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;
private boolean on;  
private float red = 0;
private float green = 255;
private float blue = 0;



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 


public void draw() 
{   
	background(0);   
	stroke(red, green, blue);   
	line(320,490,320,380);   
	drawBranches(320,380,100,3*Math.PI/2); 
} 


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



public void keyPressed()
{
	if (keyPressed == true)
	{
		if (key == 'd')
		{
			branchAngle = branchAngle + .05;
			if (red <= 250)
			{
				red = red + 5;
			}
			redraw();
		}

		if (key == 'a')
		{
			branchAngle = branchAngle - .05;
			if (blue <= 250)
			{
				blue = blue + 5;
			}
			redraw();
		}
	}
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	float sWeight;
	double angle1;
	double angle2;   

	angle1 = angle + branchAngle;
	angle2 = angle - branchAngle;

	branchLength = branchLength*fractionLength;
	
	int endX1 = (int)(branchLength*Math.cos(angle1) + x); 
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);

	int endX2 = (int)(branchLength*Math.cos(angle2) + x); 
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);

	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);

	if (branchLength > smallestBranch)
	{
		drawBranches(endX1, endY1, branchLength, angle1);
		drawBranches(endX2, endY2, branchLength, angle2);
	}
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////