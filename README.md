# homoRS92
Derive monthly pw data for surface to 300hPa from homoRS92 station dataset written in Fortran 90. Only months with over 10 days records are derived from 1970 to 2010. Output is like 1491(stations)*492(months) with unit (mm) and seperated into 00z and 12z two files. 
Warning：Station 72388 has a record of year 2011 although the dataset ends in 2010. Therefore you need to delete it from name3.txt or 
