class Nucleotide

  TALLY = {
    'A' => 0,
    'T' => 0,
    'C' => 0,
    'G' => 0,
  }

  NUCLEOTIDES = /\A[#{TALLY.keys.join}]*\z/

  private_constant :TALLY, :NUCLEOTIDES

  def self.from_dna(strand)
    raise InvalidNucleotide unless strand.match?(NUCLEOTIDES)

    new(strand.chars)
  end

  private

  attr_writer :histogram

  class InvalidNucleotide < ArgumentError; end

  def initialize(strand)
    self.histogram = strand.each_with_object(TALLY.dup) { |protein, tally| tally[protein] += 1 }
  end

  public

  attr_reader :histogram

  def count(protein)
    histogram[protein]
  end

end
