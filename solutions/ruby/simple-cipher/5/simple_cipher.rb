Key = Data.define(:key) do

  KEY     = '%s'
  LETTERS = Array('a'..'z')
  LENGTH  = 100
  REGEX   = /\A[a-z]+\z/

  private

  attr_accessor :key

  def initialize(key: nil)
    self.key = key || generate_key
    validate
  end

  def validate
    key.match?(REGEX) or raise ArgumentError
  end

  def generate_key
    KEY % Array.new(LENGTH) { letter }.join
  end

  def letter
    LETTERS.sample
  end

  public

  def to_s
    key
  end
end

Letter = Data.define(:char, :distance) do

  LETTER        = '%s'
  MAX_ORDINAL   = 'z'.ord
  MIN_ORDINAL   = 'a'.ord
  ORDINAL_RANGE = MIN_ORDINAL..MAX_ORDINAL

  private

  attr_accessor :ordinal, :distance

  def initialize(char:, distance:)
    self.distance = distance.to_i
    self.ordinal  = char.ord + distance
  end

  def adjusted_ordinal
    case
    when ordinal < MIN_ORDINAL
      ordinal + 26
    when ordinal > MAX_ORDINAL
      ordinal - 26
    else
      ordinal
    end
  end

  public

  def to_s
    LETTER % adjusted_ordinal.chr
  end
end

class Cipher

  DISTANCE = {
    a: 0,  j: 9,  s: 18,
    b: 1,  k: 10, t: 19,
    c: 2,  l: 11, u: 20,
    d: 3,  m: 12, v: 21,
    e: 4,  n: 13, w: 22,
    f: 5,  o: 14, x: 23,
    g: 6,  p: 15, y: 24,
    h: 7,  q: 16, z: 25,
    i: 8,  r: 17
  }

  private

  attr_writer :key

  def initialize(key=nil)
    self.key = Key.new(key).to_s
  end

  def distance(i)
    DISTANCE[key[i].to_sym]
  end

  public

  attr_reader :key

  def encode(plaintext)
    plaintext.chars.map.with_index { |char, i|
      Letter.new(char:, distance: distance(i)).to_s
    }.join
  end

  def decode(cyphertext)
    cyphertext.chars.map.with_index { |char, i|
      Letter.new(char:, distance: -distance(i)).to_s
    }.join
  end

end
