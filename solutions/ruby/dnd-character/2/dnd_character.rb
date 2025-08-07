module Helpers
  BASE_HITPOINTS = 10

  def attributes
    %i[strength dexterity constitution intelligence wisdom charisma]
  end
end

class DndCharacter
  include Helpers

  # BASE_HITPOINTS = 10
  DICE = (1..6).to_a
  ATTRIBUTES = %i[strength dexterity constitution intelligence wisdom charisma]

  def self.modifier(character_constitution)
    new(character_constitution).modifier
  end

  private

  # attr_accessor :charisma,
  #               :constitution,
  #               :dexterity,
  #               :intelligence,
  #               :strength,
  #               :character_constitution,
  #               :wisdom

  def initialize(character_constitution = 0)
    self.character_constitution = character_constitution

    ATTRIBUTES.each do |attribute|
      self.class.send(:attr_accessor, attribute)
      instance_variable_set("@#{attribute}", calculate_ability)
    end

    # self.charisma     = calculate_ability
    # self.constitution = calculate_ability
    # self.dexterity    = calculate_ability
    # self.intelligence = calculate_ability
    # self.strength     = calculate_ability
    # self.wisdom       = calculate_ability
  end

  def calculate_ability
    rolls = []
    4.times { rolls << DICE.shuffle.pop }
    rolls.max(3).sum
  end

  public

  attr_reader :character_constitution,
              :constitution,
              :hitpoints

  def modifier
    ((character_constitution.to_r - 10) / 2r).floor
  end

  def hitpoints
    BASE_HITPOINTS + DndCharacter.modifier(constitution)
  end

end

