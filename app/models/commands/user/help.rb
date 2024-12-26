module Commands
  module User
    class Help < Unsupported
      def self.match?(parts, session)
        parts[0] == "user" && parts[1] == "help"
      end

      def self.readme
        "user help <br />" \
        "  show user command help"
      end

      def message
        [
          ::Commands::User::Set,
          ::Commands::User::Ls
        ].map(&:readme).compact.join("<br />").html_safe
      end
    end
  end
end
