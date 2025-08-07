class Attendee

  private

  attr_writer :height,
              :pass_id

  def initialize(height)
    self.height = height
  end

  def revoked?
    pass_id == false
  end

  public

  attr_reader :pass_id,
              :height

  def issue_pass!(pass_id)
    self.pass_id = pass_id unless revoked?
  end

  def revoke_pass!
    self.pass_id = false
  end

end
