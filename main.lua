love.graphics.setBackgroundColor(150,150,255);
function love.load()
	UI = require("UI_Functions");
	MenuisVisible = true;
	font = love.graphics.newFont("radiospace.ttf", 20)
	love.graphics.setNewFont("radiospace.ttf",20);
end

function love.update()
	local X = love.mouse.getX();
	local Y = love.mouse.getY();
	for i,v in pairs(UI.Buttons) do
		if(X >= v.X and X <= (v.X+v.SX) and Y >= v.Y and Y <= (v.Y+v.SY)) then
			v.Image = UI_Functions.Images.Hover;
			else
			v.Image = UI_Functions.Images.Normal;
		end
	end
end

function love.mousepressed(X,Y,button)
	if MenuisVisible and button == 'l' then
		for i,v in pairs(UI.Buttons) do
			if(X >= v.X and X <= (v.X+v.SX) and Y >= v.Y and Y <= (v.Y+v.SY)) then
				v.Clicked();
			end
		end
 	end
end

function love.draw()
	love.graphics.setColor(255,255,255);
	if MenuisVisible then
		local menuSizeX = UI.fracScreen("x",.5);
		love.graphics.rectangle("fill",UI.centerX(menuSizeX),UI.fracScreen("y",.2),menuSizeX,UI.fracScreen("y",.2));
		love.graphics.print(#UI.Buttons);
		for i,v in pairs(UI.Buttons) do
			love.graphics.setColor(255,255,255);
			if v.Visible then
			v.SX = UI.fracScreen("x",.25);
			v.SY = UI.fracScreen("y",.1);
			v.X = UI.centerX(v.SX);
			v.Y = UI.fracScreen("y",.5) + UI.fracScreen("y",(.15*(i)));
			love.graphics.draw(v.Image,v.X,v.Y,0);
			love.graphics.setColor(255/2,255/2,255);
			love.graphics.print(v.Text, ((v.X+(v.SX/2))-font:getWidth(v.Text)/2), v.Y+(v.SY/2)-10)
		end
		end
	end
end