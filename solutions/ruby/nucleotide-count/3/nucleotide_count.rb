class Nucleotide

  BASE_DNA = {
    'A' => 0,
    'T' => 0,
    'C' => 0,
    'G' => 0,
  }

  def self.from_dna(strand)
    raise ArgumentError if strand.match?(/[^ATCG]/)

    new(strand.chars)
  end

  private

  def initialize(strand)
    @histogram = strand.each_with_object(BASE_DNA.dup) { |protein, dna| dna[protein] += 1 }
  end

  public

  attr_reader :histogram

  def count(protein)
    histogram[protein]
  end

end
