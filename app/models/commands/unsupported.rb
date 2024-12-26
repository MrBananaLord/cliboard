module Commands
  class Unsupported
    def self.match?(parts, session)
      true
    end

    def self.readme
      nil
    end

    def initialize(parts, session)
      @parts = parts
      @session = session
    end

    def command
      @parts.join(" ")
    end

    def message
      "Unsupported command. Type \"help\" for a list of supported commands."
    end

    def view
      "home/update"
    end

    def execute!
      nil
    end

    def partial
      "home/message"
    end

    def locals
      { message: message }
    end
  end
end
