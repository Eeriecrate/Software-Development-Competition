UI_Functions = {};

UI_Functions.fracScreen = function(Axis,Frac)
	if Axis:lower() == "x" then
		return love.graphics.getWidth()*Frac;
	else
		return love.graphics.getHeight()*Frac;
	end
end

UI_Functions.centerX = function(SizeX)
	return ((love.graphics.getWidth()/2)-(SizeX/2));
end

UI_Functions.Buttons = {};

UI_Functions.Images = {};
UI_Functions.Images.Normal = love.graphics.newImage("Button.png");
UI_Functions.Images.Hover = love.graphics.newImage("Button2.png");

button1 = {};
button1.Color = {}
button1.SX = 0;
button1.SY = 0;
button1.X = 0;
button1.Y = 0;
button1.Image = lUI_Functions.Images.Normal;
button1.Text = "Register";
button1.Visible = true;
button1.Clicked = function()
	button1.Visible = false;
end
table.insert(UI_Functions.Buttons,button1);

button2 = {};
button2.SX = 0;
button2.SY = 0;
button2.X = 0;
button2.Y = 0;
button2.Image = UI_Functions.Images.Normal;
button2.Text = "";
button2.Visible = true;
button2.Clicked = function()
	button2.Visible = false;
end
table.insert(UI_Functions.Buttons,button2);


return UI_Functions;