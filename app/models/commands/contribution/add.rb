module Commands
  module Contribution
    class Add < Unsupported
      def self.match?(parts, session)
        parts[0] == "contribution" && parts[1] == "add"
      end

      def self.readme
        "contribution add [ACTIVITY ID] [YOUR CONTRIBUTION]<br />" \
        "  Contribute to the activity"
      end

      def message
        return "Board not loaded" if @session[:board_id].blank?
        return "User not set" if @session[:user_id].blank?

        if @parts[2].present? && @parts[3].present?
          "Contribution added"
        else
          "Invalid contribution"
        end
      end

      def execute!
        return if @session[:board_id].blank?
        return if @session[:user_id].blank?

        if @parts[2].present? && @parts[3].present?
          board = ::Board.find_by(id: @session[:board_id])
          activity = board.activities[@parts[2].to_i - 1]

          return if activity.nil?

          ::Contribution.create(
            user_id: @session[:user_id],
            activity_id: activity.id,
            content: @parts[3]
          )
        end
      end
    end
  end
end
