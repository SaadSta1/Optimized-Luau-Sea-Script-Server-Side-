--!native

local RunService = game:GetService("RunService")
local Cube = workspace.Waves.Cube

--Vars

local Bones = {}
local Pos = {}
local Sins = {}
--Tables

for _, bone in Cube:GetChildren() do
	if bone:IsA("Bone") then
		Bones[#Bones+1] = bone
		Pos[#Pos+1] = bone.Position
		Sins[#Sins+1] = math.random(100, 1000)
	end
end
--Add a datas for the bones

local t = 0
local i = 1
local loop = math.min(10, #Bones)
--Useful Vars

task.spawn(function()
	while task.wait(.005) do
		t += .01

		for _ = 1, loop do
			local bone = Bones[i] -- gets the bone

			if bone then -- if the bone not nil
				local p = Pos[i] -- the positon of the bone

				local wave = math.sin(t * 2 + Sins[i]) * 3 -- the wave power 

				bone.Position = Vector3.new(p.X, p.Y + wave, p.Z) -- the new position
			end

			i += 1

			if i > #Bones then
				i = 1
			end


		end
	end
end)
--Main Loop