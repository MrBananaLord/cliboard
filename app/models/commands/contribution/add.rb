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
        return "Activity not found" if @activity.nil?

        if @contribution&.persisted?
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
          @activity = board.activities[@parts[2].to_i - 1]

          return if @activity.nil?

          content = @parts[3..-1].join(" ")

          @contribution = ::Contribution.create(
            user_id: @session[:user_id],
            activity_id: @activity.id,
            content: content
          )

          @contribution.code = Digest::SHA256.hexdigest(@contribution.id.to_s)
          @contribution.save
        end
      end
    end
  end
end
