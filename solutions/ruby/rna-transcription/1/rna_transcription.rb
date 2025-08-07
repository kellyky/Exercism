class Complement
  def initialize(dna)
    @dna = dna
  end

  KEY = {
    'G' => 'C', 
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }
  
  def self.of_dna(dna)
    dna.split('').map { |letter| KEY[letter] }.join
  end
  
end