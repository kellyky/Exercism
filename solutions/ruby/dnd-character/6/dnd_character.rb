class Dice

  SIDES_OF_DIE   = (1..6)
  ROLLED_DIE     = -> { rand(SIDES_OF_DIE) }
  DICE_CUP       = -> { [*(1..4)].map { |roll| ROLLED_DIE[] } }
  HIGHEST_THREE  = -> { DICE_CUP[].max(3) }

  def self.sum
    HIGHEST_THREE[].sum
  end

end

class DndCharacter

  ABILITIES = %i[strength dexterity constitution intelligence wisdom charisma]
  BASE_HITPOINTS = 10

  def self.modifier(character_constitution)
    new(character_constitution).modifier
  end

  private

  attr_writer :charisma,
              :constitution,
              :dexterity,
              :intelligence,
              :strength,
              :character_constitution,
              :wisdom

  def initialize(character_constitution = 0)
    self.character_constitution = character_constitution

    ABILITIES.each do |ability|
      instance_variable_set(:"@#{ability}", Dice.sum)
    end
  end

  public

  attr_reader :charisma,
              :constitution,
              :dexterity,
              :hitpoints,
              :intelligence,
              :strength,
              :character_constitution,
              :wisdom

  def modifier
    ((character_constitution.to_r - BASE_HITPOINTS) / 2r).floor
  end

  def hitpoints
    BASE_HITPOINTS + DndCharacter.modifier(constitution)
  end

end
