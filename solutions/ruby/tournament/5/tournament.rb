require 'pry-byebug'
class Tournament
  attr_reader :score_card, :board

  def self.tally(input)
    new(input).tally
  end

  def initialize(input)
    @matches = input.split("\n")
    @score_card = {}
  end

  def tally
    board = ['Team'.ljust(31) + '| MP |  W |  D |  L |  P']
    return board.join + "\n" if @matches.empty?

    @matches.each do |match|
      apply_match_data(match)
    end

    board.concat(formatted_rows).join("\n") + "\n"
  end

  def apply_match_data(match)
    match_data = Team.new(match)
    match_score = Score.new(match_data, score_card)
    match_score.tally
    @score_card.merge!(match_score.score_card)
  end

  def formatted_rows
    tally_rows = @score_card.sort_by { |team, stats| [-stats[:points], team] }.to_h
    tally_rows.map do |row|
      team, stats = row

      row_stats = ''

      stats.each do |stat, n|
        row_stats += "|#{n.to_s.rjust(3)}"
        row_stats += ' ' unless stat == :points
      end

      team.ljust(31) + row_stats
    end
  end
end

class Score
  SCORE_LEGEND = { win: 3, draw: 1, loss: 0 }
  attr_reader :score_card

  def initialize(match_data, score_card = {})
    @score_card = score_card
    @match_data = match_data
  end

  def tally
    add_matches_to_score_card
    increment_game_outcome
    award_points
  end

  def team_one
    @team_one ||= @match_data.team_one
  end

  def team_two
    @team_two ||= @match_data.team_two
  end

  def team_one_outcome
    @team_one_outcome ||= @match_data.team_one_outcome
  end

  def team_two_outcome
    @team_two_outcome ||= @match_data.team_two_outcome
  end

  def add_matches_to_score_card
    [team_one, team_two].each do |team|
      score_card[team] = { matches: 0, win: 0, draw: 0, loss: 0, points: 0 } if score_card[team].nil?

      score_card[team][:matches] += 1
    end
  end

  def increment_game_outcome
    score_card[team_one][team_one_outcome] += 1
    score_card[team_two][team_two_outcome] += 1
  end

  def award_points
    score_card[team_one][:points] += SCORE_LEGEND[team_one_outcome]
    score_card[team_two][:points] += SCORE_LEGEND[team_two_outcome]
  end
end

class Team
  attr_reader :team_one, :team_two

  def initialize(match)
    @match_data = match.chomp.split(';')
    @team_one = @match_data.first
    @team_two = @match_data[1]
    @outcome = @match_data.last
  end

  def team_one_outcome
    @outcome.to_sym
  end

  def team_two_outcome
    case team_one_outcome
    when :win then :loss
    when :loss then :win
    else :draw
    end
  end
end
