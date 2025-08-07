export const frontDoorResponse = line => line[0].toUpperCase();

export const frontDoorPassword = word =>
  frontDoorResponse(word) + word.slice(1).toLowerCase();

export const backDoorResponse = line => {
  const trimmedLine = line.trim();
  return trimmedLine[trimmedLine.length - 1];
}

export const backDoorPassword = word => `${frontDoorPassword(word)}, please`;

