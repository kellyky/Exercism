export const frontDoorResponse = line => line[0].toUpperCase();

export function frontDoorPassword(word) {
  return frontDoorResponse(word) + word.slice(1).toLowerCase()
}

export function backDoorResponse(line) {
  const trimmedLine = line.trim();
  return trimmedLine[trimmedLine.length - 1];
}

export function backDoorPassword(word) {
  return `${frontDoorPassword(word)}, please`;
}
