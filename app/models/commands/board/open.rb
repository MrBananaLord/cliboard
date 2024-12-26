module Commands
  module Board
    class Open < Unsupported
      def self.match?(parts, session)
        parts[0] == "board" && parts[1] == "open"
      end

      def self.readme
        "board open [BOARD_ID] [PASSWORD]<br />" \
        "  Open a board"
      end

      def execute!
        board = ::Board.find_by(id: @parts[2])

        if board&.authenticated?(@parts[3])
          @board = board
          @session[:board_id] = board.id

          if @session[:user_name].present?
            ::User.find_or_create_by(
              board_id: @session[:board_id],
              name: @session[:user_name]
            )
          end
        else
          @board = nil
          @session[:board_id] = nil
        end
      end

      def command
        @parts[0..-2].join(" ") + " *****"
      end

      def message
        if @board.present?
          "Board \"#{@board.name}\" opened"
        else
          "Board not found or password incorrect"
        end
      end
    end
  end
end
