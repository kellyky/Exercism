class Translation
  PROTEINS = {
    'AUG' => 'Methionine',
    'UUU' => 'Phenylalanine',
    'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine',
    'UUG' => 'Leucine',
    'UCU' => 'Serine',
    'UCC' => 'Serine',
    'UCA' => 'Serine',
    'UCG' => 'Serine',
    'UAU' => 'Tyrosine',
    'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine',
    'UGC' => 'Cysteine',
    'UGG' => 'Tryptophan',
    'UAA' => 'STOP',
    'UAG' => 'STOP',
    'UGA' => 'STOP'
  }

  def self.of_rna(strand)
    codons = strand.chars.each_slice(3).map { |str| str.join }

    proteins = []
    codons.each do |codon|

      translation = PROTEINS[codon]
      break if translation == 'STOP'

      raise InvalidCodonError if translation.nil?

      proteins << translation
    end
    proteins
  end
end

class InvalidCodonError < ArgumentError
end
