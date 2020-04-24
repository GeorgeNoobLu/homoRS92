The zip file contains text files, one file for each station for all the sounding data 
at standard pressure levels. Only the humidity data were homogenized based on Dai et al. (2011, JC). 
The T data were simply addjusted using the mean correction produced by Leo Haimberger. The text
file format is decribed below. This data set was created by Dr. Junhong Wang (jwang20@albay.edu)
and Prof. Aiguo Dai (adai@albany.edu). Cite Dai et al. (2011) as the reference for this dataset. 

Dai, A., J. Wang, P.W. Thorne, D.E. Parker, L. Haimberger, and X.L. Wang, 2011: A new approach 
to homogenize daily radiosonde humidity data. J. Climate, 24, 965-991. 


Text data file format: 

---------------------
Header Record Format:
---------------------

  Variable Name            Columns  Description 
  -----------------------  -------  -----------

  Header Record Indicator    1-  1  # character 

  Station Number             2-  6  WMO station number

  Year                       7- 10    

  Month                     11- 12

  Day                       13- 14

  Observation Hour          15- 16  00-23 UTC
  Release Time              17- 20  0000-2359 UTC, 9999 = missing

  Number of levels          21- 24  number of subsequent data records

  PW surface-500mb          25- 36  in mm

  PW 500-300mb              37- 48  9999 = missing  

  PW 300-100mb              49- 60


---------------------
Data Record Format:
---------------------

  Variable Name            Columns  Description
  -----------------------  -------  -----------

  Major Level Type           1-  1  1 = standard pressure level
                                    2 = significant thermodynamic level
                                    3 = additional wind level

  Minor Level Type           2-  2  1 = surface, 2 = tropopause, 0 = other

  Pressure                   3-  8  units of Pa (mb * 100)

  Pressure Flag              9-  9  A, B, or blank (see note 2 below)

  Geopotential Height       10- 14  units of meters

  Geopotential Height Flag  15- 15  A, B, or blank (see note 2 below)

  Temperature               16- 21  units of 0.01degrees C

  Temperature Flag          22- 22  A, B, or blank (see note 2 below)

  Dewpoint Depression       23- 28  units of 0.01degrees C

  Wind Direction            29- 34  units of degrees (0-360, inclusive)

  Wind Speed                35- 40  units of (m/s)*10

  Specific Humidity         41- 48  units of 0.00001 g/kg

  Relative Humidity         49- 54  units of 0.01%

Notes:
  1. Cases with -8888 indicate the values were bad and were removed.

  2. For each pressure, geoppotential height, and temperature value, a
one-character quality assurance flag indicates whether the corresponding
value was checked by procedures based on climatological means and standard
deviations. Possible flag values are: blank = no climatological check
applied due to an insufficient number of data values for computing the
relevant statistics, A = value falls within "tier-1" climatological limits
based on all days of the year and all times of day at the station, and
B = value passes checks based on both the tier-1 climatology and a
"tier-2" climatology specific to the time of year and time of day of the data
value.

