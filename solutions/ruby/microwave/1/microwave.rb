=begin
Write your code for the 'Microwave' exercise in this file. Make the tests in
`microwave_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/microwave` directory.
=end

class Microwave
  attr_accessor :time
  
  def initialize(time)
    @time = time
  end 

  def timer  
    t = time.to_s.chars.map!(&:to_i)
    (4 - t.count).times { t.unshift(0) }
  
    if t[2] >= 6 
      t[1] += 1
      t[2] -= 6
    end

    t.map!(&:to_s)
    "#{t[0]}#{t[1]}:#{t[2]}#{t[3]}"    
  end
end