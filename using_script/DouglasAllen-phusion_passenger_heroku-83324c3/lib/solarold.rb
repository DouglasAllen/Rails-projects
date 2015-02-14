
module Solar 

  include Math
	
	def calc_time_julian_centurey(t)
		# Julian Day Number j(2000) subtracted
		@tjc = (t - 2451545.0)/36525.0
		# Time in fractional centurey		
	end
	
	def eot_display(eot)
		#Equation of time output
		if eot<0 then
			sign="-"
    else
			sign="+"
		end    
		@eot = eot.abs	
		@eotmin = Integer(@eot);
		@eotsec = (600*(@eot-@eotmin)).round/10.0
		#~ if (eotsec-floor(eotsec)==0) eotsec+=".0"
		if @eotmin==0 then 
			@eot = " "+sign.to_s+" "+@eotsec.to_s+"s"
		else 
			@eot = " "+sign.to_s+" "+@eotmin.to_s+"m "+@eotsec.to_s+"s";
		end
	end
	
	def calc_mean_obliquity_of_ecliptic(t)
		# we could call time_exponents(t) method
		#time_exponents(t)
		#~ arcseconds = 21.448 - @t1 * 46.8150 - @t2 * 0.00059 + @t3 * 0.001813
		# or
		#~ @eps0 = (84381.448 - 46.815 * @t1 - 0.00059 * @t2 + 0.001813 * @t3)/3600.0 
		#Horners method is preferred here though.
		#~ arcseconds = 21.448 - t * (46.8150  + t *  (0.00059 - (0.001813 * t)))
		#~ @eps0 = 23.0 + (26.0 + (arcseconds/60.0))/60.0
		#return @e0 #we could also return this.
		@eps0 = (84381.448 - t * (46.815 + t * (0.00059 - (0.001813 * t))))/3600.0 
		#return  @eps0
	end
	
	def display_degrees(deg)
		@decimal = deg
		@hour = Integer(@decimal)
		@mindecimal = 60.0*(@decimal-@hour)
		@min = Integer(@mindecimal)
		@secdecimal = 60.0*(@mindecimal-@min)
		@sec = (1000.0*@secdecimal).round/1000.0
		if @sec - Integer(@sec) == 0 then
			@sec = @sec.to_s + ".000"
    			else if (10.0*@sec-Integer(10.0*@sec)==0) then
				@sec = @sec.to_s + "00"
      				else if (100.0*@sec-Integer(100.0*@sec)==0) then
					@sec = @sec.to_s + "0"
				end
			end
		end 
		#~ ghadeg.to_s + ":" + ghamin.to_s + ":" + ghasec.to_s  
		#~ return hourGMST.to_s+":"+minGMST.to_s+":"+secGMST.to_s
		@degreestring = @hour.to_s+":"+@min.to_s+":"+@sec.to_s
	end
	
	def calc_obliquity_correction(t)
		@eps0 = calc_mean_obliquity_of_ecliptic(t)
		@omega = calc_omega(t)
		@delta_eps = 0.00256 * cos(deg_to_rad(@omega))
		#~ delta_eps = calcDeltaEps(t)
		@eps = @eps0 + @delta_eps
		#~ puts sin(degToRad(eps))
		#~ return oc	# in degrees  
	end
	
	def calc_omega(t)
		@omega = 125.044522222  - trunc(1800.0 * t)\
      			- t * (134.136260833 - t * (0.002070833333 + t / 450000.0))
		#~ t2 = t **2
		#~ t3 = t **3				
		#~ @omega = 125.044522222 - 134.136260833 * t - trunc(1800.0 * t)\
    		#~ + 0.002070833333 * t2 + t3 / 450000.0
	end
					
	# Truncate large angles
	def trunc(x)
		@trunc = 360.0 * ( x / 360.0 - Integer( x / 360.0))
	end

	def deg_to_rad(d)
		return (PI * d / 180.0)
	end

	def rad_to_deg(r)
		return (180.0 * r / PI)
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
    		#~ return mean_anomaly	% 360	# in degrees
  	end
	
  def calc_sun_true_anomaly(t)
    @mean_anomaly = calc_geom_mean_anomaly_sun(t)
    @eqc = calc_sun_eq_of_center(t)
    @true_anomaly = @mean_anomaly + @eqc
    #return true_anomaly  #	// in degrees
  end
	
  def calc_sun_eq_of_center(t)
    #t2 = t **2
    @mean_anomaly = calc_geom_mean_anomaly_sun(t)
    #~ puts "GeomMeanAnomalySun = #{m}"
    @marad = deg_to_rad(@mean_anomaly)
    @sinmarad = sin(@marad)
    @eccentricity = calc_eccentricity_earth_orbit(t)
    @sin2marad = sin(2.0 * @marad)
    @sin3marad = sin(3.0 * @marad)
    @eqc = @sinmarad * (1.914602 - t * (0.004817 + 0.000014 * t))\
         + @sin2marad * (0.019993 - 0.000101 * t)\
         + @sin3marad * 0.000289
    #~ c = 1.9148 * @sinmarad + 0.0200 * @sin2marad + 0.0003 * @sin3marad
    #~ @mcsinmarad = (2 * radToDeg(@eccentricity)) * @sinmarad
    #~ @mcsinmarad = (1.914600 - t * 0.004817 + t2 * 0.000014) * @sinmarad
    #@mcsin2marad = (0.019993 - t * 0.000101) * @sin2marad
    #@mcsin3marad = 0.000290 * @sin3marad
    #~ c =  @mcsinmarad + @mcsin2marad + @mcsin3marad
    #~ puts "equation of center = #{c}"   #		// in degrees
    #return c
  end
	
  def calc_eccentricity_earth_orbit(t)
    @eccentricity = 0.016708617 - t * (0.000042037 + 0.0000001235 * t)#unitless
    #~ puts "EccentricityEarthOrbit = #{eccentricity}"
  end
	
  def display_time(time)
    #~ sign = time <=> 0
    #~ puts sign
    @decimalTime = time%24.0
    #~ puts decimalTime
    @hourTime = Integer(@decimalTime)
    @mindecimalTime = 60.0 * (@decimalTime - @hourTime)
    @minTime = Integer(@mindecimalTime)
    @secdecimalTime = 60.0 * (@mindecimalTime - @minTime)
    @secTime = (1000.0 * @secdecimalTime).round / 1000.0
    if @secTime - Integer(@secTime) == 0 then
      @secTime = @secTime.to_s + ".000"
    else if (10.0 * @secTime - Integer(10.0 * @secTime) == 0) then
        @secTime = @secTime.to_s + "00"
      else if (100.0 * @secTime - Integer(100.0 * @secTime) == 0) then
          @secTime = @secTime.to_s + "0"
        end
      end
    end
    @timestring = @hourTime.to_s+":"+@minTime.to_s+":"+@secTime.to_s
    #~ if sign == -1 then
    #~ timestring = "-" + (23 - hourTime).to_s+":"+(59 - minTime).to_s+":"+(60 - secTime).to_s
    #~ end
    #~ return timestring
  end
	
  def calc_mean_long_aries(t)
    d = t * 36525.0

    @mean_aries = trunc(280.46061666 + d  * 360.98564736629 + t * (t * 0.000387933 - t * (t / 38710000.0)))
    #~ t2 = t **2
    #~ t3 = t **3
    #~ d = calcJDFromJulianCent(t) - 2451545.0
    #~ meanaries = trunc(280.46061666 + 360.98564736629 * d +  0.000387933 * t2 - t3 / 38710000.0)
    #~ return meanaries
  end
	
  def calc_sun_right_ascension(t)
    @lambda = calc_sun_apparent_long(t)
    @epsilon = calc_obliquity_correction(t)
    y0 = sin(deg_to_rad(@lambda))
    x0 = cos(deg_to_rad(@lambda))
    y0 = y0 * cos(deg_to_rad(@epsilon))
    #tananum =  y0
    #tanadenom =  x0
    @ra = rad_to_deg(atan2(-y0, -x0)) + 180
    #@ra = radToDeg(atan2(tananum, tanadenom))
  end
	
  def calc_sun_apparent_long(t)
    #~ APPARENT SOLAR LONGITUDE = GEOMETRIC MEAN LONGITUDE PLUS
    #~ EQUATION OF THE CENTER MINUS ABERRATION
    #~ ASL=GML+EQCENT-ABRCON*RADPDG/SOLDST
		
    @tls = calc_sun_true_long(t)
    @omega = calc_omega(t)
    #  //Longitude of the ascending node of the moon
    #~ omega = 125.04 - t * 1934.136
    #~ t2 = t **2
    #~ t3 = t **3
    #~ omega = 125.044522222 - 134.136260833 * t - trunc(1800.0 * t) + 0.002070833333 * t2 + t3/450000.0
    @lambda = @tls - 0.00569 - 0.00478 * sin(deg_to_rad(@omega))
  end
	
  def calc_sun_true_long(t)
    @mean_lon = calc_geom_mean_long_sun(t)
    @eqc = calc_sun_eq_of_center(t)
    @true_lon = @mean_lon + @eqc - 0.01397 * (Time.now.year - 2000)
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
    #~ puts "MeanLong = #{lon0}"
    #~ auT = t / 10.0
    #~ auT2 = auT **2
    #~ auT3 = auT **3
    #~ auT4 = auT **4
    #~ auT5 = auT **5
    #~ lon0 = trunc(280.4664567 + 360007.6982779 * auT + 0.03032028 * auT2 + auT3/49931.0 - auT4/15299.0 \
    #~        - auT5/1988000.0)
    #~ puts "MeanLong = #{lon0}"
 
    #~ while (@mean_lon > 360.0)
    #~ @mean_lon  -= 360.0
    #~ end
    #~ while (@mean_lon < 0.0)
    #~ @mean_lon += 360.0
    #~ end
  end

end
