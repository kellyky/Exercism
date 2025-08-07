module Dice

  DICE = (1..6).to_a

  def roll
    DICE.shuffle.pop
  end

end

class DndCharacter
  include Dice

  ATTRIBUTES = %i[strength dexterity constitution intelligence wisdom charisma]
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

    ATTRIBUTES.each do |attribute|
      instance_variable_set(:"@#{attribute}", ability)
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
    ((character_constitution.to_r - 10) / 2r).floor
  end

  def hitpoints
    BASE_HITPOINTS + DndCharacter.modifier(constitution)
  end

end

