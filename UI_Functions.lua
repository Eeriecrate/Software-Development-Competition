UI_Functions = {};

UI_Functions.fracScreen = function(Axis,Frac)
	if Axis:lower() == "x" then
		return love.graphics.getWidth()*Frac
	else
		return love.graphics.getHeight()*Frac
	end
end

return UI_Functions;