love.graphics.setBackgroundColor(150,150,255);
function love.load()
	UI = require("UI_Functions");
	MenuisVisible = true;
end

function love.update()

end

function love.mousepressed(X,Y,button)
	if MenuisVisible and button == 'l' then
		for i,v in pairs(UI.Buttons) do
			if(X >= v.X and X <= (v.X+v.SX) and Y >= v.Y and Y <= (v.Y+v.SY)) then
				print("Clicked: "..i);
			end
		end
 	end
end

function love.draw()
	if MenuisVisible then
		local menuSizeX = UI.fracScreen("x",.5);
		love.graphics.rectangle("fill",UI.centerX(menuSizeX),UI.fracScreen("y",.2),menuSizeX,UI.fracScreen("y",.2));
		love.graphics.print(#UI.Buttons);
		for i,v in pairs(UI.Buttons) do
			v.SX = UI.fracScreen("x",.25);
			v.SY = UI.fracScreen("y",.1);
			v.X = UI.centerX(v.SX);
			v.Y = UI.fracScreen("y",.5) + UI.fracScreen("y",(.15*(i)));
			love.graphics.rectangle("fill",v.X,v.Y,v.SX,v.SY);
		end
	end
end