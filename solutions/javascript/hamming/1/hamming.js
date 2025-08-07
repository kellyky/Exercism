export const compute = (dna, dna2) => {
  if (dna.length != dna2.length) {
    throw new Error ("strands must be of equal length");
  }

  let hammingDistance = 0;

  let index = 0;
  while ( index < dna.length ) {
    if (dna.charAt(index) != dna2.charAt(index)) {
      hammingDistance++;
    }
    index++;
  }
  return hammingDistance;
}
