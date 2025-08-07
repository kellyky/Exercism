module NucleotideErrors

  class InvalidNucleotideError < ArgumentError
    def initialize(message = 'Contains one or more non-Nucleotide character.')
      super
    end
  end

end

class Nucleotide

  include NucleotideErrors

  TALLY = {
    'A' => 0,
    'T' => 0,
    'C' => 0,
    'G' => 0,
  }

  NUCLEOTIDES = /^[#{TALLY.keys.join}]*$/

  private_constant :TALLY, :NUCLEOTIDES

  def self.from_dna(nucleotides)
    new(nucleotides)
  end

  private

  attr_writer :histogram

  def initialize(nucleotides)
    @nucleotides = normalize(nucleotides)
    self.histogram = @nucleotides.each_with_object(TALLY.dup) do |nucleotide, tally|
      tally[nucleotide] += 1
    end
  end

  def normalize(nucleotides)
    raise InvalidNucleotideError unless nucleotides.match?(NUCLEOTIDES)

    nucleotides.chars
  end

  public

  attr_reader :histogram

  def count(protein)
    histogram[protein]
  end

end

if $PROGRAM_NAME == __FILE__
  puts Nucleotide.new('ACG').histogram
  puts Nucleotide.from_dna('ACG').histogram
  puts Nucleotide.new('ACGD').histogram
end
