module Dice

  DICE = (1..6)

  def roll
    rand(DICE)
  end

end

class DndCharacter
  include Dice

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
      instance_variable_set(:"@#{ability}", ability())
    end
  end

  def ability
    rolls = []
    4.times { rolls << roll }
    rolls.max(3).sum
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
