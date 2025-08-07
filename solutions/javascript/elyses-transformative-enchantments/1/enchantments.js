// @ts-check

export function seeingDouble(deck) {
  return deck.map(card => card * 2 )
}

// FIXME: doesn't handle multiple 3s
export function threeOfEachThree(deck) {
  deck.forEach((card, index) => {
    if (card === 3) deck.splice(index, 0, 3, 3);
  })

  return deck;
}

export function middleTwo(deck) {
  return deck.splice(deck.length / 2 - 1, 2);
}

// FIXME
export function sandwichTrick(deck) {
  const firstElement = deck.shift();
  const lastElement = deck.pop();

  return deck.splice(deck.length / 2 - 1, 0, firstElement, lastElement);
}

export function twoIsSpecial(deck) {
  return deck.filter(card => card === 2);
}

export function perfectlyOrdered(deck) {
  return deck.sort();
}

/**
 * Reorders the deck so that the top card ends up at the bottom.
 * @param {number[]} deck
 * @returns {number[]} reordered deck
 */
export function reorder(deck) {
  throw new Error('Implement the reorder function');
}
