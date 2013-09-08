require 'date'
include Math
require 'solar'
include Solar

def deg_to_rad(d)
return (PI * d / 180.0)
end

def rad_to_deg(r)
return (180.0 * r / PI)
end

# Truncate large angles
def trunc(x)
@trunc = 360.0 * ( x / 360.0 - Integer( x / 360.0))
end

def calc_time_julian_centurey(t)
# Julian Day Number j(2000) subtracted
@tjc = (t - 2451545.0)/36525.0
# Time in fractional centurey
end

def calc_eccentricity_earth_orbit(t)
    @eccentricity = 0.016708617 - t * (0.000042037 + 0.0000001235 * t)#unitless
    #~ puts "EccentricityEarthOrbit = #{eccentricity}"
end

def calc_geom_mean_anomaly_sun(t)
@mean_anomaly = (357.527723333 + trunc(35640.0 * t) \
         + t * (359.05034 - t * (0.0001602777778 \
             + t / 300000.0))) % 360.0
#~ t2 = t **2
#~ t3 = t **3
#~ t4 = t **4
#~ @mean_anomaly = 1287104.79305 + 129596581.0481 * t - 0.5532 * t2 + 0.000136 * t3 - 0.00001149 * t4
#~ @mean_anomaly = 357.527723333 + 359.05034 * t + trunc(35640.0 * t) - 0.0001602777778 * t2 - t3/300000.0
     #~ @mean_anomaly = 357.52910 + t * 35999.05034 - t2 * 0.0001559 - t3 * 0.00000048
     #~ puts "GeomMeanAnomalySun = #{mean_anomaly%360}"
     #~ return mean_anomaly % 360 # in degrees
end

def calc_geom_mean_long_sun(t)
    #~ //Mean longitude of the sun
    t2 = t * t
    t3 = t2 * t
    t4 = t3 * t
    t5 = t4 * t
    @mean_lon = trunc(280.4664567 + t * 36000.76982779 \
        + t2 * 0.0003032028 + t3/49931.0 \
        - t4/15299.0 - t5/1988000.0)
end

def calc_sun_eq_of_center(t)
    #t2 = t **2
    mean_anomaly = calc_geom_mean_anomaly_sun(t)
    #~ puts "GeomMeanAnomalySun = #{m}"
    marad = deg_to_rad(mean_anomaly)
    sinmarad = sin(marad)
    eccentricity = calc_eccentricity_earth_orbit(t)
    sin2marad = sin(2.0 * marad)
    sin3marad = sin(3.0 * marad)
    @eqc = sinmarad * (1.914602 - t * (0.004817 + 0.000014 * t))\
         + sin2marad * (0.019993 - 0.000101 * t)\
         + sin3marad * 0.000289
end

def calc_sun_true_long(t)
    mean_lon = calc_geom_mean_long_sun(t)
    eqc = calc_sun_eq_of_center(t)
    @true_lon = mean_lon + eqc - 0.01397 * (Time.now.year - 2000)
end

def calc_omega(t)
@omega = 125.044522222 - trunc(1800.0 * t)\
       - t * (134.136260833 - t * (0.002070833333 + t / 450000.0))
end

def calc_sun_apparent_long(t)
    #~ APPARENT SOLAR LONGITUDE = GEOMETRIC MEAN LONGITUDE PLUS
    #~ EQUATION OF THE CENTER MINUS ABERRATION
    #~ ASL=GML+EQCENT-ABRCON*RADPDG/SOLDST

    tls = calc_sun_true_long(t)
    omega = calc_omega(t)
    # //Longitude of the ascending node of the moon
    #~ omega = 125.04 - t * 1934.136
    #~ t2 = t **2
    #~ t3 = t **3
    #~ omega = 125.044522222 - 134.136260833 * t - trunc(1800.0 * t) + 0.002070833333 * t2 + t3/450000.0
    @lambda = tls - 0.00569 - 0.00478 * sin(deg_to_rad(omega))
end

pdate = Date.new(2012, 1, 4)
pd = pdate.ajd
daysecs = 4 * 84600.0

for sec in 1..daysecs
  jdt = calc_time_julian_centurey(pd + sec/84600.0)
  eqc = calc_sun_eq_of_center(jdt)
  puts eqc
  if eqc > -0.0000004
    d = jdt * 36525.0 + 2451545.0
    pt = jdt % 1.0
    break
  end
end

puts "2012 perihelion occurred at #{d}"
#puts pt


sal = calc_sun_apparent_long(pt)
puts "lambda perihelion = #{sal}"
sra = calc_sun_right_ascension(pt)
puts "right ascension = #{display_time(sra / 15.0)}"
ma = calc_geom_mean_anomaly_sun(pt)
ta = calc_sun_true_anomaly(pt)
puts ma - ta




