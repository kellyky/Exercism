class Nucleotide

  def self.from_dna(strand)
    raise ArgumentError if strand.match?(/[^ATCG]/)

    new(strand.chars)
  end

  def self.valid?(strand)
    strand.chars.uniq.all? do |protein|
      PROTEINS.include?(protein)
    end
  end

  private

  def initialize(strand)
    @strand = strand
    self.histogram = map_dna
  end

  def map_dna
    base_dna = {
      'A' => 0,
      'T' => 0,
      'C' => 0,
      'G' => 0,
    }

    strand.each_with_object(base_dna) { |protein, dna| dna[protein] += 1 }
  end

  public

  attr_accessor :histogram
  attr_reader :strand, :dna

  def count(protein)
    histogram[protein]
  end

end
