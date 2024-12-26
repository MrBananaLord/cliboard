module Commands
  module Board
    class Ls < Unsupported
      def self.match?(parts, session)
        parts[0] == "board" && parts[1] == "ls"
      end

      def self.readme
        "board ls<br />" \
        "  Display opened board"
      end

      def execute!
        @board = ::Board.find_by(id: @session[:board_id])
      end

      def partial
        return super if @board.nil?

        "home/board"
      end

      def locals
        return super if @board.nil?

        {
          board: @board,
          members: @board.users
        }
      end

      def message
        "Board not found"
      end
    end
  end
end
