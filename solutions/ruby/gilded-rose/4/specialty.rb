module Specialty
  extend self

  BACKSTAGE   = /backstage/i
  SULFURAS    = /sulfuras/i
  BRIE        = /brie/i

  def backstage?
    name.match?(BACKSTAGE)
  end

  def brie?
    name.match?(BRIE)
  end

  def sulfuras?
    name.match?(SULFURAS)
  end

end
