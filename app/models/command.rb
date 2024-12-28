class Command
  CLASSES = [
    Commands::Clear,
    Commands::Help,
    Commands::Board::Help,
    Commands::Board::Open,
    Commands::Board::Create,
    Commands::Board::Ls,
    Commands::User::Help,
    Commands::User::Set,
    Commands::User::Ls,
    Commands::Contribution::Help,
    Commands::Contribution::Add,
    Commands::Contribution::Remove,
    Commands::Activity::Help,
    Commands::Activity::Ls,
    Commands::Unsupported
  ]

  def initialize(text, session)
    @parts = (text || "").split(" ")
    @session = session
  end

  def build
    CLASSES.find do |klass|
      klass.match?(@parts, @session)
    end.new(@parts, @session)
  end
end
