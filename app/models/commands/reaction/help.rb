module Commands
  module Reaction
    class Help < Unsupported
      def self.match?(parts, session)
        parts[0] == "reaction" && parts[1] == "help"
      end

      def self.readme
        "reaction help <br />" \
        "  show reaction command help"
      end

      def message
        [
          ::Commands::Reaction::Add,
          ::Commands::Reaction::Remove
        ].map(&:readme).compact.join("<br />").html_safe
      end
    end
  end
end
