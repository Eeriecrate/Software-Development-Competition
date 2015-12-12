Data = {};

Data.accountReady = false;

	Data.returnData = function()
	if io.open("data.txt","r") ~= nil then
		local f = assert(io.open("data.txt", "r"))
    	local content = f:read("*all")
    	f:close()
    	Data.accountReady = true;
		return content;
	else
		print("Not found!");
		x = "[false]";
		return x;
	end
end

Data.saveData = function(data)
	file = io.open("data.txt","w+")
	file:write(data)
	file:close();
end

return Data;


	

