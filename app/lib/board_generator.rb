class BoardGenerator
  def self.generate(password)
    raise "Password missing" if password.blank?

    board = Board.create(
      name: "Board #{Date.today}",
      code: SecureRandom.alphanumeric(6).upcase,
      password: password
    )

    board.activities.create(description: "Past commitments")
    board.activities.create(description: "What went well?")
    board.activities.create(description: "What went wrong?")
    board.activities.create(description: "Actions")
    board.activities.create(description: "What are you learning?")
    board.activities.create(description: "How are you?")

    board
  end
end
