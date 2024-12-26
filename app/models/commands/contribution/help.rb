module Commands
  module Contribution
    class Help < Unsupported
      def self.match?(parts, session)
        parts[0] == "contribution" && parts[1] == "help"
      end

      def self.readme
        "contribution help <br />" \
        "  show contribution command help"
      end

      def message
        [
          ::Commands::Contribution::Add
        ].map(&:readme).compact.join("<br />").html_safe
      end
    end
  end
end
