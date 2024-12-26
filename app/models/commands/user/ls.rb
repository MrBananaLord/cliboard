module Commands
  module User
    class Ls < Unsupported
      def self.match?(parts, session)
        parts[0] == "user" && parts[1] == "ls"
      end

      def self.readme
        "user ls<br />" \
        "  Show current user name"
      end

      def message
        if @session[:user_name].blank?
          "User name not set"
        else
          "Current user name is \"#{@session[:user_name]}\""
        end
      end
    end
  end
end
