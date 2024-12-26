module Commands
  class Clear < Unsupported
    def self.match?(parts, session)
      parts[0] == "clear"
    end

    def self.readme
      "clear<br />" \
      "  clear the screen"
    end

    def view
      "commands/clear"
    end
  end
end
