class HighScores
  def initialize(scores)
    @scores = scores
    @latest = scores.last
    @personal_best = scores.max
    @personal_top_three = scores.max(3)
    @latest_is_personal_best = latest == personal_best
  end

  attr_reader :scores,
              :latest,
              :personal_best,
              :personal_top_three,
              :latest_is_personal_best
  
  alias latest_is_personal_best? latest_is_personal_best
end
