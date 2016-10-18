class Array
  def sum
    self.inject(0){|sum, x| sum + x}
  end
end
