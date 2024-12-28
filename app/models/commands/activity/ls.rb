module Commands
  module Activity
    class Ls < Unsupported
      def self.match?(parts, session)
        parts[0] == "activity" && parts[1] == "ls"
      end

      def self.readme
        "activity ls [ID]<br />" \
        "  Display target activity"
      end

      def execute!
        @board = ::Board.find_by(id: @session[:board_id])
        @index = @parts[2].to_i - 1
        @activity = @parts[2].present? ? @board.activities[@index] : nil
      end

      def partial
        return super if @board.nil? || @activity.nil?

        "home/activity"
      end

      def locals
        return super if @board.nil? || @activity.nil?

        {
          activity: @activity,
          index: @index
        }
      end

      def message
        if @board.nil?
          "Board not found"
        else
          "Activity not found"
        end
      end
    end
  end
end
