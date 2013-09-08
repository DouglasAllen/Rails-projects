class SolarController < ApplicationController
	

	def index
	    solar = Solar.new
	    t = Time.now.utc
	    @today = Date.new(t.year, t.month, t.day)
	    @ajd = @today.ajd + t.hour / 24.0 + t.min / 1440.0 + t.sec / 86400.0		
	    @tjc = solar.time_julian_centurey(@ajd)
	    @mean_anomaly = solar.geom_mean_anomaly_sun(@tjc)
	    @mean_anomaly_str = solar.display_degrees(@mean_anomaly)
	    @true_anomaly = solar.sun_true_anomaly(@tjc)
	    @true_anomaly_str = solar.display_degrees(@true_anomaly)
	    @e1 = (@mean_anomaly - @true_anomaly) * (4.0 * 23.93447 / 24.0)
		  @e1string = solar.eot_display(@e1)
		  @lambda = solar.sun_true_long(@tjc)
		  @lambdastring = solar.display_degrees(@lambda)
		  @ra = solar.sun_right_ascension(@tjc)
		  @radstring = solar.display_degrees(@ra)
		  @ratstring = solar.display_time(@ra / 15.0)
		  @e2 = (@lambda - @ra) * (4.0 * 23.93447 / 24.0)
		  @e2string = solar.eot_display(@e2)
		  @totlastring = solar.eot_display(@e1 + @e2)
    # The eccliptic longitude of the Sun at perihelion (closest Sun Earth orbit)
    # Calculated from itteration of time in secs for first four days of year.
    # The argument of periapsis is the remainder of 360 - lambda perihelion = 77.0236
    # seen as the symbol omega on Wikipedia diagrams. ex: http://en.wikipedia.org/wiki/Argument_of_periapsis
    # Convert to time and we should have close to Solar right ascension
    # 282.9764 / 15.0 = 18.86509333333333333
    # Sometimes you will see the opposite used, that is 102.9764 which is from aphelion.
		@lambda_perihelion = 282.9764
		@eps0 = solar.mean_obliquity_of_ecliptic(@tjc)
		@eps0_string = solar.display_degrees(@eps0)
		@eps = solar.obliquity_correction(@tjc)		
		@eps_string = solar.display_degrees(@eps)		
	end
  

	def almanac
		'http://www.celnav.de/longterm.htm'
	end
	
end
