module Commands
  module User
    class Set < Unsupported
      def self.match?(parts, session)
        parts[0] == "user" && parts[1] == "set"
      end

      def self.readme
        "user set [USERNAME]<br />" \
        "  Set the username for the current session"
      end

      def message
        if @parts[2].blank?
          "Username not provided"
        else
          "User set to \"#{@parts[2]}\""
        end
      end

      def execute!
        if @parts[2].present?
          @session[:user_name] = @parts[2]

          if @session[:board_id].present?
            ::User.find_or_create_by(
              board_id: @session[:board_id],
              name: @session[:user_name]
            )
          end
        end
      end
    end
  end
end
