export const compute = (dna, dna2) => {
  if (dna.length != dna2.length) {
    throw new Error ("strands must be of equal length");
  }

  let hammingDistance = 0;

  for (let char in dna) {
    dna.charAt(char) != dna2.charAt(char) ? hammingDistance++ : hammingDistance += 0;
  }
  
  return hammingDistance;
}
