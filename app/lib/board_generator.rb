class BoardGenerator
  def self.generate(password)
    raise "Password missing" if password.blank?

    Board.create(
      name: "Board #{Date.today}",
      code: SecureRandom.alphanumeric(6).upcase,
      password: password
    )
  end
end
