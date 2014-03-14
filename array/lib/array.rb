class Array

  def my_uniq
    uniq = []
    self.each do |item|
      uniq << item unless uniq.include?(item)
    end
    uniq
  end

  def two_sum
    two_sums = []

    self.length.times do |i|
      ((i + 1)...self.length).each do |j|
        two_sums << [i,j] if (self[i] + self[j] == 0)
      end
    end
    two_sums
  end

  def my_transpose
    result = Array.new(self.length) { Array.new(self.length) }
    self.length.times do |i|
      self.length.times do |j|
        result[i][j] = self[j][i]
      end
    end
   result
  end
end