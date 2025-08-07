var RNA = {
  "A": "U",
  "C": "G",
  "T": "A",
  "G": "C"
}

class DNA {
  static toRNA(strand) {
    var rna = ""
    for (nucleotide in strand) {
      rna = rna + RNA[nucleotide]
    }
    return rna
  }
}
