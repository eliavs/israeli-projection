echo off
cd C:\Program Files\eliav\bin
::cs2cs +proj=utm +zone=36 +ellps=WGS84 +datum=WGS84 +units=m +to +proj=tmerc +lat_0=31.73439361111111 +lon_0=35.20451694444445 +k=1.000007 +x_0=219529.584 +y_0=626907.39 +ellps=GRS80 +units=m
echo select convertion:
echo. 
echo select 1 for UTM to ITM
echo select 2 for ITM to UTM
echo select 3 for LATLON decimal to ITM
echo select 4 for ITM to LATLON decimal
echo select 5 for LATLON degrees to ITM
echo select 6 for ITM to LATLON degrees
set/p task= 
echo %task%
set/p proj= enter input data Easting first 
::echo %proj%
echo %proj%>file.txt
set /p ans= do you want to go again(y/n)?
if %ans%==y goto nother
if %ans%==n goto finish
:nother
echo enter more input data Eeasting first 
set/p proj= 
echo %proj%>>file.txt
set /p ans= do you want to go again(y/n)?
if %ans%==y goto nother
if %ans%==n goto finish
:finish
if %task%==1 goto utmtoitm
if %task%==2 goto itmtoutm
if %task%==3 goto latlontoitmdecimal
if %task%==4 goto itmtolatlondecimal
if %task%==5 goto latlontoitmdegrees
if %task%==6 goto itmtolatlondegrees
echo to be continued.....
exit
:utmtoitm
cs2cs +proj=utm +zone=36 +ellps=WGS84 +datum=WGS84 +units=m +to +proj=tmerc +lat_0=31.73439361111111 +lon_0=35.20451694444445 +k=1.000007 +x_0=219529.584 +y_0=626907.39 +ellps=GRS80 +units=m file.txt>output.txt
goto end
:itmtoutm
cs2cs +proj=tmerc +lat_0=31.73439361111111 +lon_0=35.20451694444445 +k=1.000007 +x_0=219529.584 +y_0=626907.39 +ellps=GRS80 +units=m +to +proj=utm +zone=36 +ellps=WGS84 +datum=WGS84 +units=m file.txt>output.txt
goto end
:latlontoitmdecimal
cs2cs +proj=longlat +ellps=WGS84 +datum=WGS84 +to +proj=tmerc +lat_0=31.73439361111111 +lon_0=35.20451694444445 +k=1.000007 +x_0=219529.584 +y_0=626907.39 +ellps=GRS80 +units=m file.txt>output.txt
goto end
:itmtolatlondecimal
cs2cs -f "%%.6f" +towgs84=-48,55,52 +proj=tmerc +lat_0=31.73439361111111 +lon_0=35.20451694444445 +k=1.000007 +x_0=219529.584 +y_0=626907.39 +ellps=GRS80 +units=m file.txt>output.txt
goto end
:latlontoitmdegrees
cs2cs +towgs84=-48,55,52 +proj=longlat +ellps=WGS84 +datum=WGS84 +to +proj=tmerc +lat_0=31.73439361111111 +lon_0=35.20451694444445 +k=1.000007 +x_0=219529.584 +y_0=626907.39 +ellps=GRS80 +units=m file.txt>output.txt
goto end
:itmtolatlondegrees
cs2cs +towgs84=-48,55,52 +proj=tmerc +lat_0=31.73439361111111 +lon_0=35.20451694444445 +k=1.000007 +x_0=219529.584 +y_0=626907.39 +ellps=GRS80 +units=m file.txt>output.txt
goto end
:end
output.txt
exit
