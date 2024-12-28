module Commands
  module Reaction
    class Add < Unsupported
      def self.match?(parts, session)
        parts[0] == "reaction" && parts[1] == "add"
      end

      def self.readme
        "reaction add [CONTRIBUTION SHA] [YOUR REACTION]<br />" \
        "  React to the contribution"
      end

      def message
        return "Board not loaded" if @session[:board_id].blank?
        return "User not set" if @session[:user_id].blank?
        return "Contribution not found" if @contribution.nil?

        if @reaction&.persisted?
          "Reaction added"
        else
          "Invalid reaction"
        end
      end

      def execute!
        return if @session[:board_id].blank?
        return if @session[:user_id].blank?

        if @parts[2].present? && @parts[3].present?
          board = ::Board.find_by(id: @session[:board_id])
          @contribution = board.contributions.find_by(code: @parts[2])

          return if @contribution.nil?

          text = @parts[3..-1].join(" ")

          @reaction = ::Reaction.create(
            user_id: @session[:user_id],
            contribution: @contribution,
            text: text
          )
        end
      end
    end
  end
end
