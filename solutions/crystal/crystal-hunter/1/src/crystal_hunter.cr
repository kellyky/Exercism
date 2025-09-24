class Rules
  def bonus_points?(power_up_active, touching_bandit)
    touching_bandit && power_up_active
  end

  def score?(touching_power_up, touching_crystal)
    touching_power_up || touching_crystal
  end

  def lose?(power_up_active, touching_bandit)
    !power_up_active && touching_bandit
  end

  # should return true if the character has gathered all crystals and has not lost based on the arguments defined in part 3 and return false otherwise.
  def win?(has_picked_up_all_crystals, power_up_active, touching_bandit)
    has_picked_up_all_crystals && !lose?(power_up_active, touching_bandit)
  end
end
