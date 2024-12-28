module Commands
  class Help < Unsupported
    def self.match?(parts, session)
      parts[0] == "help"
    end

    def self.readme
      "help - Show this message"
    end

    def message
      [
        ::Commands::Board::Help,
        ::Commands::User::Help,
        ::Commands::Contribution::Help,
        ::Commands::Activity::Help,
        ::Commands::Reaction::Help,
        ::Commands::Clear
      ].map(&:readme).compact.join("<br />").html_safe
    end
  end
end
