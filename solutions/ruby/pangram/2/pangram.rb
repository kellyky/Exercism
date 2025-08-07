class Pangram
  def self.pangram?(string)
    string.downcase!
    ("a".."z").to_a.all? { |letter| string.include?(letter) }
  end
end

