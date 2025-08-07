class Nucleotide

  TALLY = {
    'A' => 0,
    'T' => 0,
    'C' => 0,
    'G' => 0,
  }

  NUCLEOTIDES = /^[#{TALLY.keys.join}]*$/

  class InvalidNucleotideError < ArgumentError; end

  private_constant :TALLY, :NUCLEOTIDES, :InvalidNucleotideError

  def self.from_dna(strand)
    raise InvalidNucleotideError unless strand.match?(NUCLEOTIDES)

    new(strand.chars)
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
