module Commands
  module Contribution
    class Remove < Unsupported
      def self.match?(parts, session)
        parts[0] == "contribution" && parts[1] == "remove"
      end

      def self.readme
        "contribution remove [CONTRIBUTION SHA]<br />" \
        "  Remove your contribution"
      end

      def message
        return "Board not loaded" if @session[:board_id].blank?
        return "User not set" if @session[:user_id].blank?
        return "Contribution removed" if @contribution&.destroyed?

        "Cannot remove contribution"
      end

      def execute!
        return if @session[:board_id].blank?
        return if @session[:user_id].blank?

        if @parts[2].present?
          @contribution = ::Contribution.find_by(code: @parts[2])

          return if @contribution.nil? || @contribution.user_id != @session[:user_id]

          @contribution.destroy
        end
      end
    end
  end
end
