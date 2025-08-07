class Nucleotide

  PROTEINS = %w[A T C G]

  def self.from_dna(strand)
    raise ArgumentError unless valid?(strand)

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

  public

  attr_accessor :histogram
  attr_reader :strand, :dna

  def map_dna
    dna = {
      'A' => 0,
      'T' => 0,
      'C' => 0,
      'G' => 0,
    }

    strand.each { |protein| dna[protein] += 1 }

    dna
  end

  def count(protein)
    histogram[protein]
  end

end
