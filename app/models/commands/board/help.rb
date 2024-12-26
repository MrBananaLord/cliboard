module Commands
  module Board
    class Help < Unsupported
      def self.match?(parts, session)
        parts[0] == "board" && parts[1] == "help"
      end

      def self.readme
        "board help<br />" \
        "  show user command help"
      end

      def message
        [
          ::Commands::Board::Open,
          ::Commands::Board::Ls
        ].map(&:readme).compact.join("<br />").html_safe
      end
    end
  end
end
