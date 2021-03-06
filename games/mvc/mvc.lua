assert(rb,"Run fbneo-training-mode.lua")

p1maxhealth = 0x90
p2maxhealth = 0x90
p1maxmeter = 0x03
p2maxmeter = 0x03

local p1health = 0xFF3271
local p2health = 0xFF3671

local p1meter = 0xFF3274
local p2meter = 0xFF3674

translationtable = {
	{
		"coin",
		"start",
		"up",
		"down",
		"left",
		"right",
		"button1",
		"button2",
		"button3",
		"button4",
		"button5",
		"button6",
	},
	["Coin"] = 1,
	["Start"] = 2,
	["Up"] = 3,
	["Down"] = 4,
	["Left"] = 5,
	["Right"] = 6,
	["Weak Punch"] = 7,
	["Medium Punch"] = 8,
	["Strong Punch"] = 9,
	["Weak Kick"] = 10,
	["Medium Kick"] = 11,
	["Strong Kick"] = 12
}

function playerOneFacingLeft()
	return rb(0xff344b)==1
end
	
function playerTwoFacingLeft()
		return rb(0xff344b)==0
end

function playerOneInHitstun()
	return rb(0xff3520)~=0
end

function playerTwoInHitstun()
	return rb(0xff3120)~=0
end

function readPlayerOneHealth()
	return rb(p1health)
end

function readPlayerTwoHealth()
	return rb(p2health)
end

function writePlayerOneHealth(health)
	wb(p1health, health)
end

function writePlayerTwoHealth(health)
	wb(p2health, health)
end

function readPlayerOneMeter()
	return rb(p1meter)
end

function writePlayerOneMeter(meter)
	wb(p1meter, meter)
end

function readPlayerTwoMeter()
	return rb(p2meter)
end

function writePlayerTwoMeter(meter)
	wb(p2meter, meter)
end

local infiniteTime = function()
	memory.writebyte(0xFF4008, 0x99)
end

function Run()
	infiniteTime()
end
