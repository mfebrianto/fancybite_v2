class Fbite::Standard
  include Singleton

  def self.a_week
    %w(monday tuesday wednesday thursday friday saturday sunday)
  end

  def self.hours
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]
  end

end