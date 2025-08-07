require 'pry-byebug'

class Tournament
  @@tally = {}


  def self.tally(input)
    board = ["Team".ljust(31) + "| MP |  W |  D |  L |  P"]
    return board.join + + "\n" if input.chomp.empty?

    matches = input.split("\n")
    matches.each do |match|
      team_one, team_two, outcome = match.chomp.split(';')

      # Add teams to tally; adds 1 match played for each
      [team_one, team_two].each do |team|
        self.add_team_to_tally(team) if @@tally[team].nil?
        @@tally[team][:matches] += 1
      end

      team_one_outcome = outcome.to_sym
      team_two_outcome = self.team_two_outcome(team_one_outcome)

      team_one_stats = [team_one, team_one_outcome]
      team_two_stats = [team_two, team_two_outcome]
    
      @@tally[team_one][team_one_outcome] += 1
      @@tally[team_two][team_two_outcome] += 1

      score_legend = { win: 3, draw: 1, loss: 0 }
      @@tally[team_one][:points] += score_legend[team_one_outcome]
      @@tally[team_two][:points] += score_legend[team_two_outcome]
    end

    board << self.make_it_pretty
    board.join("\n") + "\n"
  end

  def self.wipe_test_data
    @@tally = {}
  end

  def self.team_two_outcome(team_one_outcome)
    case team_one_outcome
    when :win then :loss 
    when :loss then :win
    else :draw
    end
  end

  def self.make_it_pretty
    tally_rows = @@tally.sort_by{ |team, stats| [-stats[:points], team] }.to_h
    tally_rows.map do |row|
      team, stats = row

      row_stats = ""
      stats.each do |stat, n|
        if stat == :points
          row_stats += "|#{n.to_s.rjust(3)}"
        else
          row_stats += "|#{n.to_s.rjust(3)} "
        end
      end

      team.ljust(31) + row_stats
    end
  end

  def self.add_team_to_tally(team)
    @@tally[team] = {
      matches: 0,
      win: 0,
      draw: 0,
      loss: 0,
      points: 0
    }
  end
end
