var RNA = {
  "A": "U",
  "C": "G",
  "T": "A",
  "G": "C"
}

class DNA {
  static toRNA(strand) {
    return strand.map{ |nucleotide| RNA[nucleotide] }.join()
  }
}
