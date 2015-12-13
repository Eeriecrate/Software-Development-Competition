UI_Functions = {};
UI_Functions.MenuisVisible = true;
UI_Functions.MainMenu = false;

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
UI_Functions.Selected = nil;
UI_Functions.SelectedNumber = nil;

UI_Functions.Images = {};
UI_Functions.Images.Normal = love.graphics.newImage("Button.png");
UI_Functions.Images.Hover = love.graphics.newImage("Button1.png");

button1 = {};
button1.Color = {}
button1.SX = 0;
button1.SY = 0;
button1.X = 0;
button1.State = "Register";
button1.Y = 0;
button1.Image = UI_Functions.Images.Normal;
button1.Text = "Register";
button1.Visible = true;
button1.Clicked = function()
	if button1.State == "Register" then
		UI_Functions.MenuisVisible = false;
		UI_Functions.Register.Visible = true;
	else
		UI_Functions.MenuisVisible = false;
		UI_Functions.MainMenu = true;
	end
end
table.insert(UI_Functions.Buttons,button1);

UI_Functions.Register = {};
UI_Functions.Register.Visible = false;
UI_Functions.Register.Buttons = {};
UI_Functions.Register.TextBoxes = {};
UI_Functions.Register.TextBosesVisible = true;

Input1 = {};
Input1.X = 0;
Input1.Y = 0;
Input1.SX = 0;
Input1.SY = 0;
Input1.Image = UI_Functions.Images.Normal;
Input1.Label = "First Name";
Input1.Text = "";
table.insert(UI_Functions.Register.TextBoxes,Input1);

Input2 = {};
Input2.X = 0;
Input2.Y = 0;
Input2.SX = 0;
Input2.SY = 0;
Input2.Image = UI_Functions.Images.Normal;
Input2.Label = "Last Name";
Input2.Text = "";
table.insert(UI_Functions.Register.TextBoxes,Input2);

UI_Functions.Register.Submit = {};
UI_Functions.Register.Submit.Color = {}
UI_Functions.Register.Submit.SX = 0;
UI_Functions.Register.Submit.SY = 0;
UI_Functions.Register.Submit.X = 0;
UI_Functions.Register.Submit.Y = 0;
UI_Functions.Register.Submit.Image = UI_Functions.Images.Normal;
UI_Functions.Register.Submit.Text = "Submit";
UI_Functions.Register.Submit.Visible = true;
UI_Functions.Register.Submit.Clicked = function()
	if(#Input1.Text > 0 and #Input2.Text > 0) then
		UI_Functions.MenuisVisible = true;
		UI_Functions.Register.Visible = false;
		return true;
	end
end


--[[]]--


--[[]]--


UI_Functions.Main = {};
UI_Functions.Main.Buttons = {};

local button = {};
button.Color = {}
button.SX = 0;
button.SY = 0;
button.X = 0;
button.Y = 0;
button.Image = UI_Functions.Images.Normal;
button.Text = "Notes";
button.Visible = true;
button.Clicked = function()

end
table.insert(UI_Functions.Main.Buttons,button);

local button = {};
button.Color = {}
button.SX = 0;
button.SY = 0;
button.X = 0;
button.Y = 0;
button.Image = UI_Functions.Images.Normal;
button.Text = "Homework";
button.Visible = true;
button.Clicked = function()

end
table.insert(UI_Functions.Main.Buttons,button);

local button = {};
button.Color = {}
button.SX = 0;
button.SY = 0;
button.X = 0;
button.Y = 0;
button.Image = UI_Functions.Images.Normal;
button.Text = "Deez";
button.Visible = true;
button.Clicked = function()

end
table.insert(UI_Functions.Main.Buttons,button);

local button = {};
button.Color = {}
button.SX = 0;
button.SY = 0;
button.X = 0;
button.Y = 0;
button.Image = UI_Functions.Images.Normal;
button.Text = "Nutz";
button.Visible = true;
button.Clicked = function()

end
table.insert(UI_Functions.Main.Buttons,button);

return UI_Functions;