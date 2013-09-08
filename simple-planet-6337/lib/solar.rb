require 'bigdecimal'

class Solar 

  include Math

  def initialize()
  end

  def bd(var)
    BigDecimal(var.to_s).round(15)
  end
  
  # Truncate large angles
  def truncate(x)
    bd(360.0 * ( x / 360.0 - Integer( x / 360.0)))
  end

  def degrees_to_radians(degrees)
    bd(PI * degrees / 180.0)
  end

  def radians_to_degrees(radians)
    bd(180.0 * radians / PI)
  end
  
  def time_julian_centurey(t)
    # Time in fractional centurey
    # Julian Day Number j(2000) subtracted
    bd((t - 2451545.0)/36525.0)    
  end

  def geom_mean_anomaly_sun(t)
    bd((357.527723333 + truncate(35640.0 * t) \
                      + t * (359.05034 - t * (0.0001602777778 \
                      + t / 300000.0))) % 360.0)
  end
        
  def sun_eq_of_center(t)
    mean_anomaly = geom_mean_anomaly_sun(t)
    ma_rad = bd(degrees_to_radians(mean_anomaly))
    sinmarad = bd(sin(ma_rad))
    sin2marad = bd(sin(2.0 * ma_rad))
    sin3marad = bd(sin(3.0 * ma_rad))
    bd(sinmarad * (1.914602 - t * (0.004817 + 0.000014 * t))\
                            + sin2marad * (0.019993 - 0.000101 * t)\
                            + sin3marad * 0.000289)
  end
        
  def sun_true_anomaly(t)
    mean_anomaly = geom_mean_anomaly_sun(t)
    eqc = sun_eq_of_center(t)
    bd(mean_anomaly + eqc)
  end

  def eccentricity_earth_orbit(t)
    bd(0.016708617 - t * (0.000042037 + 0.0000001235 * t))#unitless
  end

  def mean_obliquity_of_ecliptic(t)
    bd((84381.448 - t * (46.815 + t * (0.00059 - (0.001813 * t))))/3600.0)
  end

  def omega(t)
    bd(125.044522222 - truncate(1800.0 * t)\
                     - t * (134.136260833 - t * (0.002070833333\
		     + t / 450000.0)))
  end
      
  def obliquity_correction(t)
    eps0 = mean_obliquity_of_ecliptic(t)
    omega = omega(t)
    delta_eps = bd(0.00256 * cos(degrees_to_radians(omega)))
    bd(eps0 + delta_eps)
  end

  def geom_mean_long_sun(t)
    #~ //Mean longitude of the sun
    t2 = t * t
    t3 = t2 * t
    t4 = t3 * t
    t5 = t4 * t
    bd(truncate(280.4664567 + t * 36000.76982779 \
                            + t2 * 0.0003032028 + t3 / 49931.0 \
                            - t4 / 15299.0 - t5 / 1988000.0))
  end
      
  def sun_true_long(t)
    mean_lon = geom_mean_long_sun(t)
    eqc = sun_eq_of_center(t)
    bd(mean_lon + eqc - 0.01397 * (Time.now.year - 2000.0))
  end
  
  def sun_apparent_long(t)
    #~ APPARENT SOLAR LONGITUDE = GEOMETRIC MEAN LONGITUDE PLUS
    #~ EQUATION OF THE CENTER MINUS ABERRATION    
    tls = sun_true_long(t)
    omega = omega(t)
    bd(tls - 0.00569 - 0.00478 * sin(degrees_to_radians(omega)))
  end
  
  def mean_long_aries(t)
    d = bd(t * 36525.0)
    bd(truncate(280.46061666 + d * 360.98564736629\
                             + t * (t * 0.000387933\
			     - t * (t / 38710000.0))))
  end
  
  def sun_right_ascension(t)
    lambda = sun_apparent_long(t)
    epsilon = obliquity_correction(t)
    y0 = bd(sin(degrees_to_radians(lambda)))
    x0 = bd(cos(degrees_to_radians(lambda)))
    y0 = bd(y0 * cos(degrees_to_radians(epsilon)))
    bd(radians_to_degrees(atan2(-y0, -x0)) + 180.0)
  end

  def display_degrees(degrees)
    decimal = degrees
    hours = Integer(decimal)
    mindecimal = bd(60.0 * (decimal - hours))
    minutes = Integer(mindecimal)
    sec_decimal = bd(60.0 * (mindecimal - minutes))
    seconds = sec_decimal.round(4)
    if seconds - Integer(seconds) == 0 then
       seconds = seconds.to_s << ".000"
       else if (10.0 * seconds - Integer(10.0 * seconds) == 0) then
          seconds = seconds.to_s << "00"
          else if (100.0 * seconds - Integer(100.0 * seconds) == 0) then
            seconds = seconds.to_s << "0"
          end
        end
    end

    hours.to_s << ":" << minutes.to_s << ":" << seconds.to_s
  end

  def display_time(time)
    decimal_time = time % 24.0
    hours = Integer(decimal_time)
    mindecimal_time = bd(60.0 * (decimal_time - hours))
    minutes = Integer(mindecimal_time)
    secdecimal_time = bd(60.0 * (mindecimal_time - minutes))
    seconds = secdecimal_time.round(4)
    if seconds - Integer(seconds) == 0 then
       seconds = seconds.to_s << ".000"
       else if (10.0 * seconds - Integer(10.0 * seconds) == 0) then
         seconds = seconds.to_s << "00"
         else if (100.0 * seconds - Integer(100.0 * seconds) == 0) then
           seconds = seconds.to_s << "0"
        end
      end
    end
    hours.to_s << ":" << minutes.to_s << ":" << seconds.to_s
  end

  def eot_display(eot)
    #Equation of time output
    if eot < 0 then
      sign = "-"
    else
      sign = "+"
    end
    eot = eot.abs
    minutes = Integer(eot)
    seconds = (600 * (eot - minutes)).round / 10.0

    if minutes == 0 then
      " " << sign.to_s << " " + seconds.to_s << "s"
    else
      " " << sign.to_s << " " << minutes.to_s << "m " << seconds.to_s << "s"
    end
  end
  
  def julian_period_day_fraction_to_time(jpd_time)
    fraction = bd(jpd_time - 0.5 - Integer(jpd_time - 0.5))
    fraction = fraction.round(8)
    hours = Integer(fraction * 24.0)
    minutes = Integer((fraction - hours / 24.0) * 1440.0)
    seconds = Integer((fraction - hours / 24.0 - minutes / 1440.0) * 86400.0)
    hours.to_s << ":" << minutes.to_s << ":" << seconds.to_s
  end

end
	
	
