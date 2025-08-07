module ETL
  def self.transform(old)
    new = {}

    old.each do |points, letters|
      letters.each do |letter|
        new[letter.downcase] = points
      end
    end

    new
  end
end
