module ETL
  def self.transform(old)
    old.each_with_object({}) do |(points, letters), new_mapping|
      letters.each do |letter|
        new_mapping[letter.downcase] = points
      end
    end
  end
end
