-- script_device_toonselector.lua
-- Reads the Toon Thermostat Setpoint Temperature and updates the
-- selector in Domoticz to represent the current Active State.
-- Off scene is an option, leave it out if not needed.
-- Action commands wil not be executed.

commandArray = {}

-- Settings: Configure as desired

-- Name of the switch with the temperature setpoint.
ThermostatSetPointName = 'Room Setpoint'

-- Temperature SetPoints. 
HomeSetPoint = '20.50'   
ComfortSetPoint = '21.00'
SleepSetPoint = '19.00'
AwaySetPoint = '17.50' 
OffSetPoint = '6.00' --optional

-- Name of the selector for Toon
ToonSelector = 'Toon scenes'

-- Name of the levels in the selector
HomeLevel = 'Home'
ComfortLevel = 'Comfort'
SleepLevel = 'Sleep'
AwayLevel = 'Away'
OffLevel = 'Off' --optional

-- Values from each level name
HomeLevelValue = '30'
ComfortLevelValue = '40'
SleepLevelValue = '20'
AwayLevelValue = '10'
OffLevelValue = '0' --optional

-- End of settings

-- Toon Thermostat SetPoint:
ThermostatSetPoint = otherdevices_svalues[ThermostatSetPointName]

--for i, v in pairs(otherdevices) do print(i, v) end
-- level = tonumber(otherdevices_svalues['Toon scenes'])
-- print("printing level output: " .. level .." ")

if devicechanged['Room Setpoint'] then
		if (ThermostatSetPoint  == HomeSetPoint) then
				--print("SetPoint equals to Home");
				if (otherdevices[ToonSelector] ~= HomeLevel) then
				print("Updating '" .. ToonSelector .. "' selector to '" .. HomeLevel .. "'")
				commandArray['UpdateDevice'] = otherdevices_idx[ToonSelector]..'|1|'..HomeLevelValue
				commandArray['SendNotification']='Toon device >> Home'
				end
		
		elseif (ThermostatSetPoint  == ComfortSetPoint) then
				--print("SetPoint equals to Comfort");
				if (otherdevices[ToonSelector] ~= ComfortLevel) then
				print("Updating '" .. ToonSelector .. "' selector to '" .. ComfortLevel .. "'")
				commandArray['UpdateDevice'] = otherdevices_idx[ToonSelector]..'|1|'..ComfortLevelValue
				commandArray['SendNotification']='Toon device >> Comfort!'
				end
		
		elseif (ThermostatSetPoint  == SleepSetPoint) then
				--print("SetPoint equals to Sleep");
				if (otherdevices[ToonSelector] ~= 'Sleep') then
				print("Updating '" .. ToonSelector .. "' selector to '" .. SleepLevel .. "'")
				commandArray['UpdateDevice'] = otherdevices_idx[ToonSelector]..'|1|'..SleepLevelValue
				commandArray['SendNotification']='Toon device >> Sleep'
				end
		
		elseif (ThermostatSetPoint  == AwaySetPoint) then
				--print("SetPoint equals to Away");
				if (otherdevices[ToonSelector] ~= 'Away') then
				print("Updating '" .. ToonSelector .. "' selector to '" .. AwayLevel .. "'")
				commandArray['UpdateDevice'] = otherdevices_idx[ToonSelector]..'|1|'..AwayLevelValue
				commandArray['SendNotification']='Toon device >> Away'
				end

		-- Optional		
		elseif (ThermostatSetPoint  == OffSetPoint) then
				--print("SetPoint equals to Off");
				if (otherdevices[ToonSelector] ~= 'Off') then
				print("Updating '" .. ToonSelector .. "' selector to '" .. OffLevel .. "'")
				commandArray['UpdateDevice'] = otherdevices_idx[ToonSelector]..'|1|'..OffLevelValue
				commandArray['SendNotification']='Toon device >> Off'
				end
		end
end

return commandArray
