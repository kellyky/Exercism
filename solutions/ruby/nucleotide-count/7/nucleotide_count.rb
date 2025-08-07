module NucleotideErrors
  class InvalidNucleotideError < ArgumentError; end
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
    raise InvalidNucleotideError unless nucleotides.match?(NUCLEOTIDES)

    new(nucleotides.chars)
  end

  private

  attr_writer :histogram

  def initialize(nucleotides)
    self.histogram = nucleotides.each_with_object(TALLY.dup) do |nucleotide, tally|
      tally[nucleotide] += 1
    end
  end

  public

  attr_reader :histogram

  def count(protein)
    histogram[protein]
  end

end
