export const compute = (dna, dna2) => {
  if (dna.length != dna2.length) {
    throw new Error ("strands must be of equal length");
  }

  let hammingDistance = 0;

  for (let i = 0; i < dna.length; i++ ) {
    dna.charAt(i) != dna2.charAt(i) ? hammingDistance++ : hammingDistance += 0;
  }
  
  return hammingDistance;
}
