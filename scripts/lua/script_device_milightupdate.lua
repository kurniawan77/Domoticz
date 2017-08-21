commandArray = {}

local function update(idx, value1, value2)
local cmd = string.format("%d|%d|%d", idx, value1, value2)
table.insert (commandArray, { ['UpdateDevice'] = cmd } )
end

-- MiLight Alles AAN
if (devicechanged['Milight All']=='On') then
update (104, 1, 1)
update (105, 1, 1)
update (106, 1, 1)
update (107, 1, 1)
print("Updating Milight Groups On")
end
-- MiLight Alles UIT
if (devicechanged['Milight All']=='Off') then
update (104, 0, 0)
update (105, 0, 0)
update (106, 0, 0)
update (107, 0, 0)
print("Updating Milight Groups Off")
end
-- MiLight uit zetten, controleren of switch "MiLight Alles" uit kan
if (devicechanged["Milight Gr1"] == "Off")  and (otherdevices["Milight Gr2"] == "Off" ) and (otherdevices["Milight Gr3"] == "Off" ) then
update (103, 0, 0)
print("Updating Milight All Off")
end
if (devicechanged["Milight Gr2"] == "Off")  and (otherdevices["Milight Gr3"] == "Off" ) and (otherdevices["Milight Gr1"] == "Off" ) then
update (103, 0, 0)
print("Updating Milight All Off")
end
if (devicechanged["Milight Gr3"] == "Off")  and (otherdevices["Milight Gr1"] == "Off" ) and (otherdevices["Milight Gr2"] == "Off" ) then
update (103, 0, 0)
print("Updating Milight All Off")
end
-- MiLight aan zetten, controleren of switch "MiLight Alles" aan kan
if (devicechanged["Milight Gr1"] == "On")  or (otherdevices["Milight Gr2"] == "On" ) or (otherdevices["Milight Gr3"] == "On" ) then
	if (otherdevices["Milight All"] == "Off" ) then
	update (103, 1, 1)
	print("Updating Milight All On")
	end
end
if (devicechanged["Milight Gr2"] == "On")  or (otherdevices["Milight Gr3"] == "On" ) or (otherdevices["Milight Gr1"] == "On" ) then
	if (otherdevices["Milight All"] == "Off" ) then
	update (103, 1, 1)
	print("Updating Milight All On")
	end
end
if (devicechanged["Milight Gr3"] == "On")  or (otherdevices["Milight Gr1"] == "On" ) or (otherdevices["Milight Gr2"] == "On" ) then
	if (otherdevices["Milight All"] == "Off" ) then
	update (103, 1, 1)
	print("Updating Milight All On")
	end
end


return commandArray
