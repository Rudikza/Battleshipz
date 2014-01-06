module GamesHelper
  def opponents
    CONFIG[:opponents]
  end

  def ship?(info)
    info[:ship].empty? ? false : true
  end
end
