# Module name: Quality
# - Defines minumum and maximum quality
module Quality

  MIN_QUALITY = 0
  MAX_QUALITY = 50

  def min_quality?
    quality == MIN_QUALITY
  end

  def max_quality?
    quality == MAX_QUALITY
  end

end
