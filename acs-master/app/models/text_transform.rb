module TextTransform
  NONALPHA_REGEXP = /[^a-z1-9A-Z]+/i
  def id_and_name_to_param(id, name)
    return "" if id.nil?           # Not persisted?
    return "#{id}" if name.nil?
    url_name = name.gsub(NONALPHA_REGEXP, '-')
    "#{id}-#{url_name}"
  end
end
