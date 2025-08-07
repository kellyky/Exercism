class Nucleotide

  TALLY = {
    'A' => 0,
    'T' => 0,
    'C' => 0,
    'G' => 0,
  }

  VALID_NUCLEOTIDES = /\A[#{TALLY.keys.join}]*\z/

  private_constant :TALLY, :VALID_NUCLEOTIDES

  def self.from_dna(strand)
    raise ArgumentError unless strand.match?(VALID_NUCLEOTIDES)

    new(strand.chars)
  end

  private

  attr_writer :histogram

  def initialize(strand)
    self.histogram = strand.each_with_object(TALLY.dup) { |protein, dna| dna[protein] += 1 }
  end

  public

  attr_reader :histogram

  def count(protein)
    histogram[protein]
  end

end
