class Attendee

  private
  
  def initialize(height)
    self.height = height
  end

  public 
   
  attr_accessor :height, :pass_id
  
  def issue_pass!(pass_id)
    self.pass_id = pass_id
  end

  def revoke_pass!
    self.pass_id = nil
  end
  
end
