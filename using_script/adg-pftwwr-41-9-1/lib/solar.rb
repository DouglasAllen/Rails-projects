
class Solar 

  include Math
  
  def initialize()
    
  end

  def time_julian_centurey(t)
    # Time in fractional centurey
    # Julian Day Number j(2000) subtracted
    (t - 2451545.0) / 36525.0    
  end

  # Truncate large angles
  def trunc(x)
    360.0 * ( x / 360.0 - 
    Integer( x / 360.0))
  end

  def deg_to_rad(d)
    PI * d / 180.0
  end

  def rad_to_deg(r)
    180.0 * r / PI
  end

  def geom_mean_anomaly_sun(t)
    (357.527723333 + 
    trunc(35640.0 * t) +
     t * (359.05034 - 
     t * (0.0001602777778 + 
     t / 300000.0))) % 360.0
  end
        
  def sun_eq_of_center(t)
    mean_anomaly = geom_mean_anomaly_sun(t)
    marad = deg_to_rad(mean_anomaly)
    sinmarad = sin(marad)
    sin2marad = sin(2.0 * marad)
    sin3marad = sin(3.0 * marad)
    sinmarad * (1.914602 - 
    t * (0.004817 +
    t * 0.000014)) + 
    sin2marad * (0.019993 - 
    0.000101 * t) + 
    sin3marad * 0.000289
  end
        
  def sun_true_anomaly(t)
    geom_mean_anomaly_sun(t) + sun_eq_of_center(t)    
  end

  def eccentricity_earth_orbit(t)
    0.016708617 - 
    t * (0.000042037 + 
    0.0000001235 * t)#unitless
  end

  def mean_obliquity_of_ecliptic(t)
    (84381.448 - 
    t * (46.815 + 
    t * (0.00059 - 
    (0.001813 * t))))/3600.0
  end

  def omega(t)
    125.044522222 - 
    trunc(1800.0 * t) - 
    t * (134.136260833 - 
    t * (0.002070833333 + 
    t / 450000.0))
  end
      
  def obliquity_correction(t)
    eps0 = mean_obliquity_of_ecliptic(t)
    omega = omega(t)
    delta_eps = 0.00256 * cos(deg_to_rad(omega))
    eps0 + delta_eps
  end

  def geom_mean_long_sun(t)
    #~ //Mean longitude of the sun
    t2 = t * t
    t3 = t2 * t
    t4 = t3 * t
    t5 = t4 * t
    trunc(280.4664567 + t * 36000.76982779 \
        + t2 * 0.0003032028 + t3/49931.0 \
        - t4/15299.0 - t5/1988000.0)
  end
      
  def sun_true_long(t)
    geom_mean_long_sun(t) +
    sun_eq_of_center(t) -
    0.01397 * (Time.now.year - 2000)
  end
  
  def sun_apparent_long(t)
    #~ APPARENT SOLAR LONGITUDE = GEOMETRIC MEAN LONGITUDE PLUS
    #~ EQUATION OF THE CENTER MINUS ABERRATION    
    sun_true_long(t) - 0.00569 - 0.00478 * sin(deg_to_rad(omega(t))) 
    
  end
  
  def mean_long_aries(t)
    
    trunc(280.46061666 + 
          t * 36525.0 * 360.98564736629 + 
          t * (t * 0.000387933 - 
          t * (t / 38710000.0)))
  end
  
  def sun_right_ascension(t)
    lambda = sun_apparent_long(t)
    epsilon = obliquity_correction(t)
    y0 = sin(deg_to_rad(lambda))
    x0 = cos(deg_to_rad(lambda))
    y0 = y0 * cos(deg_to_rad(epsilon))
    rad_to_deg(atan2(-y0, -x0)) + 180.0
  end

  def display_degrees(deg)
    decimal = deg
    hour = Integer(decimal)
    mindecimal = 60.0 * (decimal - hour)
    min = Integer(mindecimal)
    secdecimal = 60.0 * (mindecimal - min)
    sec = (1000.0 * secdecimal).round / 1000.0
    if sec - Integer(sec) == 0 then
      sec = sec.to_s << ".000"
    else if (10.0 * sec - Integer(10.0 * sec) == 0) then
        sec = sec.to_s << "00"
      else if (100.0 * sec - Integer(100.0 * sec) == 0) then
          sec = sec.to_s << "0"
        end
      end
    end
    hour.to_s << ":" << min.to_s << ":" << sec.to_s
  end

  def display_time(time)
    decimal_time = time % 24.0
    hour_time = Integer(decimal_time)
    mindecimal_time = 60.0 * (decimal_time - hour_time)
    min_time = Integer(mindecimal_time)
    secdecimal_time = 60.0 * (mindecimal_time - min_time)
    sec_time = (1000.0 * secdecimal_time).round / 1000.0
    if sec_time - Integer(sec_time) == 0 then
      sec_time = sec_time.to_s << ".000"
    else if (10.0 * sec_time - Integer(10.0 * sec_time) == 0) then
        sec_time = sec_time.to_s << "00"
      else if (100.0 * sec_time - Integer(100.0 * sec_time) == 0) then
          sec_time = sec_time.to_s << "0"
        end
      end
    end
    hour_time.to_s << ":" << min_time.to_s << ":" << sec_time.to_s
  end

  def eot_display(eot)
    #Equation of time output
    if eot < 0 then
      sign = "-"
    else
      sign = "+"
    end
    eot = eot.abs
    eot_min = Integer(eot)
    eot_sec = (600 * (eot - eot_min)).round / 10.0

    if eot_min == 0 then
      " " << sign.to_s << " " + eot_sec.to_s << "s"
    else
      " " << sign.to_s << " " << eot_min.to_s << "m " << eot_sec.to_s << "s"
    end
  end

end
	
	
