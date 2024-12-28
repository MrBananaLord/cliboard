module Commands
  module Activity
    class Help < Unsupported
      def self.match?(parts, session)
        parts[0] == "activity" && parts[1] == "help"
      end

      def self.readme
        "activity help<br />" \
        "  show activity command help"
      end

      def message
        [
          ::Commands::Activity::Ls
        ].map(&:readme).compact.join("<br />").html_safe
      end
    end
  end
end
