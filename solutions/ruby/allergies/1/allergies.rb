class Allergies

  ALLERGIES = {
    128 => 'cats',
     64 => 'pollen',
     32 => 'chocolate',
     16 => 'tomatoes',
      8 => 'strawberries',
      4 => 'shellfish',
      2 => 'peanuts',
      1 => 'eggs',
  }

  private

  def initialize(number)
    @allergens = []
    self.number = number
    self.list = allergy_list
  end

  def allergy_list
    ALLERGIES.each do |allergen_score, allergen|
      if number & allergen_score == allergen_score
        allergens << allergen
        self.number -= allergen_score
      end
    end

    allergens.reverse
  end

  public

  attr_accessor :list, :number
  attr_reader :allergens

  def allergic_to?(allergen)
    list.include?(allergen)
  end

end
