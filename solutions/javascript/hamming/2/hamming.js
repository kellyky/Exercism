export const compute = (dna, dna2) => {
  if (dna.length != dna2.length) {
    throw new Error ("strands must be of equal length");
  }

  let hammingDistance = 0;

  for (let i = 0; i < dna.length; i++ ) {
    if (dna.charAt(i) != dna2.charAt(i)) {
      hammingDistance++;
    }
  }
  
  return hammingDistance;
}
