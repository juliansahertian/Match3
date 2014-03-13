InGame=Core.class(Sprite)

local matrix={
			  {},{},{},{},{},{},{},{},
			  {},{},{},{},{},{},{},{},
			  {},{},{},{},{},{},{},{},
			  {},{},{},{},{},{},{},{},
			  {},{},{},{},{},{},{},{},
			  {},{},{},{},{},{},{},{},
			  {},{},{},{},{},{},{},{},
			  {},{},{},{},{},{},{},{},
			 }
local Grid={}

function InGame:init()
local text=""
local a
local b = -0.5
local x
local y = -0.5
local m=0
local n=0
local Mul=1

	for loop=1,math.sqrt(length(matrix)) do
	text=""
	b = b + 1
	a = b * 40
		for loop2=1,math.sqrt(length(matrix)) do
			y = y + 1
			x = y * 40
			Grid[Mul]=self:GenerateGrid()
			local Rand=math.random(1,5)
			Grid[Mul]:setPosition(x,a)
			local item=self:CreateGem(self:GemAset(Rand))
			Grid[Mul]:addChild(item)
			self:addChild(Grid[Mul])
			
			matrix[Mul]["obj"]=Rand
			m=matrix[Mul]["obj"]
			
			matrix[Mul]["pos"]=Grid[Mul]:getChildIndex(item)
			n=matrix[Mul]["pos"]
			
			text=text.." "..tostring(m)
			Mul=Mul+1
		end
		y=-0.5	
	  print(text)
	  
	end
	
	self:isSameObjectH()
	self:isSameObjectV()
	self:DestroyObject()
	
	
end

function InGame:DestroyObject()
	local Mul=1
	local m
	for loop=1,math.sqrt(length(matrix)) do
	--	text=""
		for loop2=1,math.sqrt(length(matrix)) do
			m=matrix[Mul]["destroy"]
			if(m==true)then
				Grid[Mul]:removeChildAt(2)
			end
			--text=text.." "..tostring(m)
			Mul=Mul+1
		end
		--print(text)
	end
	
end
function InGame:isSameObjectH()
	local x=1
	--print(matrix[x+1]["obj"])
	for loop=1,math.sqrt(length(matrix)) do
		for loop2=1,math.sqrt(length(matrix))-2 do
		  local a=matrix[x]["obj"]
		  local b=matrix[x+1]["obj"]
		  local c=matrix[x+2]["obj"]
			if(a==b and a==c ) then
			   if(matrix[x]["pos"]~=0) then
			      --Grid[x]:removeChildAt(2)
				  --matrix[x]["pos"]=0
				  matrix[x]["destroy"]=true
			   end
			   if(matrix[x+1]["pos"]~=0) then
			      --Grid[x+1]:removeChildAt(2)
				   --matrix[x+1]["pos"]=0
				 matrix[x+1]["destroy"]=true
				 
			   end
				if(matrix[x+2]["pos"]~=0) then
			      --Grid[x+2]:removeChildAt(2)
				   --matrix[x+2]["pos"]=0
				  matrix[x+2]["destroy"]=true
			   end  
			end
			x=x+1
		end
		x=x+2
	end
end

function InGame:isSameObjectV()
	local x=1
	--print(matrix[x+1]["obj"])
	for loop=1,math.sqrt(length(matrix))-2 do
		for loop2=1,math.sqrt(length(matrix)) do
		  local a=matrix[x]["obj"]
		  local b=matrix[x+8*1]["obj"]
		  local c=matrix[x+8*2]["obj"]
			if(a==b and a==c ) then
			   if(matrix[x]["pos"]~=0) then
			      --Grid[x]:removeChildAt(2)
				  --matrix[x]["pos"]=0
				  matrix[x]["destroy"]=true
			   end
			   if(matrix[x+8*1]["pos"]~=0) then
			      --Grid[x+1]:removeChildAt(2)
				   --matrix[x+1]["pos"]=0
				 matrix[x+8*1]["destroy"]=true
				 
			   end
				if(matrix[x+8*2]["pos"]~=0) then
			      --Grid[x+2]:removeChildAt(2)
				   --matrix[x+2]["pos"]=0
				  matrix[x+8*2]["destroy"]=true
			   end  
			end
			x=x+1
		end
		--x=x+1
	end
end

function InGame:CreateGem(GemAsetName)
local Gem=Bitmap.new(Texture.new(GemAsetName,true))
Gem:setAnchorPoint(.5,.5)
Gem:setScale(.74,.74)
return Gem
end

function InGame:GemAset(GemNumber)
	if(GemNumber==1) then
		return "aset/image/mintRed.png"
	elseif(GemNumber==2) then
		return "aset/image/mintGreen.png"
	elseif(GemNumber==3) then
		return "aset/image/candyYellow.png"
	elseif(GemNumber==4) then
		return "aset/image/candyOrange.png"
	elseif(GemNumber==5) then
		return "aset/image/candyGreen.png"
	end
end

function InGame:GenerateGrid()
local grid=Sprite.new()
--local shape=Bitmap.new(Texture.new("aset/image/tombol.png",true))
--shape:setAnchorPoint(.5,.5)
local shape = Shape.new()
		shape:setLineStyle(1, 0x000000)
		shape:setFillStyle(Shape.SOLID, 0xff0000, 0.5)
		shape:beginPath()
		shape:moveTo(-20, -20)
		shape:lineTo(20, -20)
		shape:lineTo(20, 20)
		shape:lineTo(-20, 20)
		shape:closePath()
		shape:endPath()

grid:addChild(shape)
return grid
end

function InGame:MatrixItem()

end

