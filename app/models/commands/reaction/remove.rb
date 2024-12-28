module Commands
  module Reaction
    class Remove < Unsupported
      def self.match?(parts, session)
        parts[0] == "reaction" && parts[1] == "remove"
      end

      def self.readme
        "reaction remove [REACTION ID]<br />" \
        "  Remove your reaction"
      end

      def message
        return "Board not loaded" if @session[:board_id].blank?
        return "User not set" if @session[:user_id].blank?
        return "Reaction removed" if @reaction&.destroyed?

        "Cannot remove reaction"
      end

      def execute!
        return if @session[:board_id].blank?
        return if @session[:user_id].blank?

        if @parts[2].present?
          @reaction = ::Reaction.find_by(id: @parts[2])

          return if @reaction.nil? || @reaction.user_id != @session[:user_id]

          @reaction.destroy
        end
      end
    end
  end
end
