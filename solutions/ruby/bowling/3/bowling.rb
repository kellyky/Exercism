# Responsible for game-play logic
class Game
  attr_reader :score, :frames

  def initialize
    @score = 0
    @frame_builder = Frame.new
    @frames = {}
  end

  def roll(pins)
    raise Game::BowlingError if pins.negative?
    raise Game::BowlingError if ten_frames_played?

    @frame_builder.build(pins)
    @frames.merge!(@frame_builder.frames)
  end

  def ten_frames_played?
    @frame_builder.frame_ten_full
  end

  def score
    raise Game::BowlingError unless ten_frames_played?

    @frames.each do |frame_num, throws|
      @frame_score_builder = Score.new(frame_num, throws, frames)

      @score += if frame_num == 10
                  @frame_score_builder.tenth_frame
                else
                  @frame_score_builder.calculate
                end
    end
    @score
  end

  class BowlingError < StandardError
  end
end

# Responsible for scoring each frame
class Score < Game
  attr_reader :throws, :frame_number

  def initialize(frame_number, throws, frames)
    @frame_score = 0
    @frame_number = frame_number
    @throws = throws
    @frames = frames
  end

  def tenth_frame
    throws.sum
  end

  def calculate
    score_strike if strike?
    score_spare if spare?
    score_open if open?
    @frame_score
  end

  def score_strike
    @frame_score += (10 + next_two_rolls)
  end

  def score_spare
    @frame_score += (10 + @frames[frame_number + 1].first)
  end

  def score_open
    @frame_score += throws.sum
  end

  def next_two_rolls
    next_frame = @frames[frame_number + 1]

    case next_frame.size
    when 3
      next_frame.first(2).sum
    when 2
      next_frame.sum
    when 1
      next_frame.sum + @frames[frame_number + 2].first
    end
  end

  def strike?
    throws.sum == 10 && throws.size == 1
  end

  def spare?
    throws.sum == 10 && throws.size == 2
  end

  def open?
    throws.sum < 10
  end
end

# Responsible for building each frame
class Frame < Game
  attr_reader :frames, :frame_ten_full

  def initialize
    @frame_ten_full = false
    @frame_number = 1
    @frames = { 1 => [], 2 => [], 3 => [], 4 => [], 5 => [], 6 => [], 7 => [], 8 => [], 9 => [], 10 => [] }
  end

  def bonus_roll?
    rolls = frames[@frame_number]

    if tenth_frame? && rolls.size == 2
      return true if strike?(rolls.first) || strike?(rolls.last)
      return true if spare?(rolls.first(2))
    end

    false
  end

  def strike?(roll)
    roll == 10
  end

  def spare?(rolls)
    rolls.sum == 10
  end

  def build(roll)
    raise Game::BowlingError if too_many_pins?(roll)

    add_roll_to_frame(roll)

    increment_frame_number if frame_full? && !tenth_frame?
  end

  def increment_frame_number
    @frame_number += 1
  end

  def add_roll_to_frame(roll)
    frames[@frame_number] << roll
  end

  def frame_full?
    rolls = frames[@frame_number]

    tenth_frame? ? frame_ten_full?(rolls) : earlier_frame_full?(rolls)
  end

  def tenth_frame?
    @frame_number == 10
  end

  def frame_ten_full?(rolls)
    return false if rolls.size == 1

    return unless rolls.size == 3 || (rolls.size == 2 && !bonus_roll?)

    @frame_ten_full = true

    true
  end

  def earlier_frame_full?(rolls)
    rolls.first == 10 || rolls.size == 2
  end

  def more_than_ten_pins?(roll)
    frames[@frame_number].sum + roll > 10
  end

  def too_many_pins?(roll)
    return true if roll > 10
    return more_than_ten_pins?(roll) unless tenth_frame?

    tenth_frame = frames[@frame_number]

    return false if tenth_frame.all?(10) && tenth_frame.size <= 3

    tenth_frame.size == 2 && tenth_frame.first == 10 && tenth_frame[1] + roll > 10
  end
end
