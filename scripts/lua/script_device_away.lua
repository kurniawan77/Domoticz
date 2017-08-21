t1 = os.time()
s = otherdevices_lastupdate['Someone home']
-- returns a date time like 2013-07-11 17:23:12
 
year = string.sub(s, 1, 4)
month = string.sub(s, 6, 7)
day = string.sub(s, 9, 10)
hour = string.sub(s, 12, 13)
minutes = string.sub(s, 15, 16)
seconds = string.sub(s, 18, 19)
 
commandArray = {}
 
t2 = os.time{year=year, month=month, day=day, hour=hour, min=minutes, sec=seconds}
difference = (os.difftime (t1, t2))

if (otherdevices['Someone home'] == 'Off' and difference > 1800 and otherdevices['Away'] == 'Off') then
   commandArray['Away']='On'
   print("Away for while now....")

elseif (otherdevices['Someone home'] == 'On' and otherdevices['Away'] == 'On') then
       commandArray['Away']='Off'
       print("Back home....")
end 
 
return commandArray
