export const frontDoorResponse = line => line[0].toUpperCase();

export function frontDoorPassword(word) {
  return word[0].toUpperCase() + word.toLowerCase().slice(1, word.length + 1)
}

export function backDoorResponse(line) {
  const trimmedLine = line.trim();
  return trimmedLine[trimmedLine.length - 1];
}

export function backDoorPassword(word) {
  return `${frontDoorPassword(word)}, please`;
}
