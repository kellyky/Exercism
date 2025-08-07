class Hamming
  def self.compute(strand_one, dna_strand_two)
    raise ArgumentError if strand_one.size != dna_strand_two.size
    
    differences = 0
    nucleotide = 0

    until nucleotide == strand_one.size
      differences += 1 if strand_one[nucleotide] != dna_strand_two[nucleotide]
      nucleotide += 1
    end

    differences
  end
end