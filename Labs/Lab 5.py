print ("Enter birthday:")
bdYear=int(input("Year:"))
bdMonth=int(input("Month(1-12):"))
bdDay=int(input("Day:"))

from datetime import date
now = date.today ()
age = date(int(bdYear), int(bdMonth), int(bdDay))
seconds_of_life = (now-age).total_seconds()
print ("Your age in seconds is: " +str(seconds_of_life))