class BoardGenerator
  def self.generate(password)
    raise "Password missing" if password.blank?

    Board.create(name: "Board #{Date.today}", password: password)
  end
end
