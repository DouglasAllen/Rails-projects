module ApplicationHelper
  def datetime_microformat(time, &block)
    content_tag(:abbr, class: "datetime", title: time.iso8601, &block)
  end

  def distance_of_time_in_words_to_now_tag(time)
    datetime_microformat(time) do
      distance_of_time_in_words_to_now time.in_time_zone
    end
  end
end
