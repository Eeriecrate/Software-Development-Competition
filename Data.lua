Data = {};

Data.accountReady = false;

	Data.returnData = function(name)
	if love.filesystem.exists(name..".lua") then
		return love.filesystem.read(name..".lua");
	else
		print("Not found!");
		x = "[false]";
		return x;
	end
end

Data.saveData = function(name,data)
	print(data)
	if love.filesystem.exists(name..".lua") then
		love.filesystem.write(name..".lua",data);
		Data.accountReady = true;
	else
		love.filesystem.newFileData(data,name..".lua","file");
		Data.accountReady = true;
	end
end

return Data;


	

