export const canExecuteFastAttack = (knightIsAwake) => !knightIsAwake;

export const canSpy = (knightIsAwake, archerIsAwake, prisonerIsAwake) => {
  return knightIsAwake || archerIsAwake || prisonerIsAwake;
}

export const canSignalPrisoner = (archerIsAwake, prisonerIsAwake) => {
  return !archerIsAwake && prisonerIsAwake;
}

export const canFreePrisoner = (
  knightIsAwake,
  archerIsAwake,
  prisonerIsAwake,
  petDogIsPresent
) => {
  return !archerIsAwake && (petDogIsPresent || !knightIsAwake && prisonerIsAwake);
}
