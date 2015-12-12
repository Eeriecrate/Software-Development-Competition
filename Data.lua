Data = {};
Data.accountReady = false;

Data.returnData = function()
	if love.filesystem.exists("data.txt") then
		content,_ = love.filesystem.read("data.txt");
		Data.accountReady = true;
		return content;
	else
		print("Not found!");
		x = "[false]";
		return x;
	end
end

Data.saveData = function(data)
	if not love.filesystem.exists("data.txt") then
		print(data)
		file = love.filesystem.newFile("data.txt");
		file:open("w")
		x,y = file:write(data)
		file:close();
		if x then
			print("SUCCESS!")
		else
			print(y)
		end
	else
		love.filesystem.write("data.text",data)
	end
end

return Data;


	

