class TimeController < ApplicationController

#  require 'date'

  def index
    solar = Solar.new
    t = Time.now.utc
    @t = t.usec / (1000000.0 * 3600.0) + t.min / 60.0 + t.hour + t.sec / 3600.0
    @tstring = solar.display_time(@t)
    @today = Date.new(t.year, t.month, t.day)
    @ajd = @today.ajd + @t / 24.0 #t.hour / 24.0 + t.min / 1440.0 + t.sec / 86400.0
  end

end

#tc = TimeController.new

#puts tc.index
