love.graphics.setBackgroundColor(150,150,255);
success = love.window.setIcon(love.image.newImageData("Icon.png"));
function love.load()
	utf8 = require("utf8");
	UI = require("UI_Functions");
	Data = require("Data");
	JSON = require("json");
	Blop = love.audio.newSource("Blop.mp3","static");
	Sound = love.audio.newSource("Elevator.mp3");
	Sound:setVolume(.5);
	love.keyboard.setKeyRepeat(true);
	UI_Functions.MenuisVisible = true;
	background = love.graphics.newImage("Background.png");
	font = love.graphics.newFont("radiospace.ttf", 20)
	love.graphics.setNewFont("radiospace.ttf",20);
	Save = JSON.decode(Data.returnData());
	if Save[1] == false then
		Save = {};
	end
end

function love.textinput(t)
	if UI_Functions.Selected ~= nil then
		UI_Functions.Register.TextBoxes[UI_Functions.SelectedNumber].Text = UI_Functions.Register.TextBoxes[UI_Functions.SelectedNumber].Text..t;
	end
end

function love.keypressed(key)
    if key == "backspace" and UI_Functions.Selected ~= nil then
        local byteoffset = utf8.offset(UI_Functions.Register.TextBoxes[UI_Functions.SelectedNumber].Text, -1)
        if byteoffset then
            UI_Functions.Register.TextBoxes[UI_Functions.SelectedNumber].Text = string.sub(UI_Functions.Register.TextBoxes[UI_Functions.SelectedNumber].Text, 1, byteoffset - 1)
        end
    elseif key == "return" then
    	UI_Functions.Selected = nil;
    end
end

function love.update()
	Sound:play();
	local X = love.mouse.getX();
	local Y = love.mouse.getY();
	if UI_Functions.MenuisVisible then
		for i,v in pairs(UI.Buttons) do
			if(X >= v.X and X <= (v.X+v.SX) and Y >= v.Y and Y <= (v.Y+v.SY)) then
				if v.Image ~= UI_Functions.Images.Hover then
					Blop:play();
				end
				v.Image = UI_Functions.Images.Hover;
				else
				v.Image = UI_Functions.Images.Normal;
			end
		end
	end
	if UI_Functions.Register.Visible then
		if(X >= UI_Functions.Register.Submit.X and X <= (UI_Functions.Register.Submit.X+UI_Functions.Register.Submit.SX) and Y >= UI_Functions.Register.Submit.Y and Y <= (UI_Functions.Register.Submit.Y+UI_Functions.Register.Submit.SY)) then
			if UI_Functions.Register.Submit.Image ~= UI_Functions.Images.Hover then
					Blop:play();
				end
			UI_Functions.Register.Submit.Image = UI_Functions.Images.Hover;
			else
			UI_Functions.Register.Submit.Image = UI_Functions.Images.Normal;
		end
	end
	if UI_Functions.MainMenu then
		for i,v in pairs(UI_Functions.Main.Buttons) do
			if(X >= v.X and X <= (v.X+v.SX) and Y >= v.Y and Y <= (v.Y+v.SY)) then
				if v.Image ~= UI_Functions.Images.Hover then
					Blop:play();
				end
				v.Image = UI_Functions.Images.Hover;
				else
				v.Image = UI_Functions.Images.Normal;
			end
		end
	end
end

function love.mousepressed(X,Y,button)
	if UI_Functions.MenuisVisible and button == 'l' then
		for i,v in pairs(UI.Buttons) do
			if(X >= v.X and X <= (v.X+v.SX) and Y >= v.Y and Y <= (v.Y+v.SY)) then
				v.Clicked();
			end
		end
 	end
 	Selected = false;
 	if UI_Functions.Register.Visible then
 		for i,v in pairs(UI_Functions.Register.TextBoxes) do
	 		if(X >= v.X and X <= (v.X+v.SX) and Y >= v.Y and Y <= (v.Y+v.SY)) then
	 			UI_Functions.Selected = v;
	 			UI_Functions.SelectedNumber = i;
	 			Selected = true;
	 		end
	 		if not Selected then
	 			UI_Functions.Selected = nil;
	 		end
	 	end
	 	if(X >= UI_Functions.Register.Submit.X and X <= (UI_Functions.Register.Submit.X+UI_Functions.Register.Submit.SX) and Y >= UI_Functions.Register.Submit.Y and Y <= (UI_Functions.Register.Submit.Y+UI_Functions.Register.Submit.SY)) then
			if UI_Functions.Register.Submit.Clicked() == true then
				Save["fname"] = UI_Functions.Register.TextBoxes[1].Text;
				Save["lname"] = UI_Functions.Register.TextBoxes[2].Text;
				Data.saveData(JSON.encode(Save));
			end 
		end
 	end
end

function love.draw()
	love.graphics.setColor(255,255,255);
	love.graphics.draw(background,0,0,0,1.01);
	if UI_Functions.MenuisVisible then
		if Data.accountReady then
			love.graphics.setColor(0,0,0);
			UI_Functions.Buttons[1].State = "Enter";
			UI_Functions.Buttons[1].Text = "Enter";
			love.graphics.print("Welcome back, "..Save["fname"].." "..Save["lname"].."!", ((795)-font:getWidth("Welcome back, "..Save["fname"].." "..Save["lname"].."!")), 575)
		else
			love.graphics.print("Welcome new user!", ((795)-font:getWidth("Welcome new user!")), 575)
		end
		love.graphics.setColor(255,255,255);
		local menuSizeX = UI.fracScreen("x",.5);
		love.graphics.rectangle("fill",UI.centerX(menuSizeX),UI.fracScreen("y",.2),menuSizeX,UI.fracScreen("y",.2));
		for i,v in pairs(UI.Buttons) do
			love.graphics.setColor(255,255,255);
			if v.Visible then
			v.SX = UI.fracScreen("x",.25);
			v.SY = UI.fracScreen("y",.1);
			v.X = UI.centerX(v.SX);
			v.Y = UI.fracScreen("y",.5) + UI.fracScreen("y",(.15*(i)));
			love.graphics.draw(v.Image,v.X,v.Y,0);
			love.graphics.setColor(62,170,242);
			love.graphics.print(v.Text, ((v.X+(v.SX/2))-font:getWidth(v.Text)/2), v.Y+(v.SY/2)-10)
			end
		end
	end
	if UI_Functions.Register.Visible then
		local menuSizeX = UI.fracScreen("x",.5);
		love.graphics.rectangle("fill",UI.centerX(menuSizeX),UI.fracScreen("y",.2),menuSizeX,UI.fracScreen("y",.2));
		for i,v in ipairs(UI_Functions.Register.TextBoxes) do
			love.graphics.setColor(255,255,255);
			v.SX = UI.fracScreen("x",.25);
			v.SY = UI.fracScreen("y",.1);
			v.X = UI.centerX(v.SX);
			v.Y = UI.fracScreen("y",.3) + UI.fracScreen("y",(.15*(i)));
			love.graphics.draw(v.Image,v.X,v.Y,0);
			love.graphics.setColor(62,170,242);
			love.graphics.print(v.Text, ((v.X+(v.SX/2))-font:getWidth(v.Text)/2), v.Y+(v.SY/2)-10)
			love.graphics.setColor(0,0,0);
			love.graphics.print(v.Label,((v.X)-(font:getWidth(v.Label)))-10, v.Y+(v.SY/2)-10);
		end

		love.graphics.setColor(255,255,255);
		if UI_Functions.Register.Submit.Visible then
			UI_Functions.Register.Submit.SX = UI.fracScreen("x",.25);
			UI_Functions.Register.Submit.SY = UI.fracScreen("y",.1);
			UI_Functions.Register.Submit.X = UI.centerX(UI_Functions.Register.Submit.SX);
			UI_Functions.Register.Submit.Y = UI.fracScreen("y",.3) + UI.fracScreen("y",(.15*(3)));
			love.graphics.draw(UI_Functions.Register.Submit.Image,UI_Functions.Register.Submit.X,UI_Functions.Register.Submit.Y,0);
			love.graphics.setColor(62,170,242);
			love.graphics.print(UI_Functions.Register.Submit.Text, ((UI_Functions.Register.Submit.X+(UI_Functions.Register.Submit.SX/2))-font:getWidth(UI_Functions.Register.Submit.Text)/2), UI_Functions.Register.Submit.Y+(UI_Functions.Register.Submit.SY/2)-10)
		end
	end
	if UI_Functions.MainMenu then
		love.graphics.rectangle("fill",205,25,1,550);
		for i,v in ipairs(UI_Functions.Main.Buttons) do
			love.graphics.setColor(255,255,255);
			if v.Visible then
				v.SX = UI.fracScreen("x",.25);
				v.SY = UI.fracScreen("y",.1);
				v.X = 2.5;
				v.Y = i*(800*.125)
				love.graphics.draw(v.Image,v.X,v.Y,0);
				love.graphics.setColor(62,170,242);
				love.graphics.print(v.Text, ((v.X+(v.SX/2))-font:getWidth(v.Text)/2), v.Y+(v.SY/2)-10)
			end
		end
	end
end