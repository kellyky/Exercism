class NotMovieClubMemberError < RuntimeError
  def NotMovieClubMemberError
  end
end

class Moviegoer
  attr_reader :member

  def initialize(age, member: false)
    @age = age
    @member = member
  end

  def ticket_price
    @age < 60 ? 15.0 : 10.0
  end

  def watch_scary_movie?
    @age >= 18
  end

  # Popcorn is 🍿
  def claim_free_popcorn!
    return '🍿' if member == true

    raise NotMovieClubMemberError
  end
end
