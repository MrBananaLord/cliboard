module Commands
  module Board
    class Create < Unsupported
      def self.match?(parts, session)
        parts[0] == "board" && parts[1] == "create"
      end

      def self.readme
        "board create [ADMIN_PASSWORD] [BOARD_PASSWORD] [BOARD_NAME]<br />" \
        "  Create a board protected with [PASSWORD]<br />" \
        "  Protected with admin password"
      end

      def execute!
        return if @parts[2] != ENV["ADMIN_PASSWORD"]

        @board = BoardGenerator.generate(
          password: @parts[3],
          name: @parts[4..-1].join(" ")
        )
      end

      def command
        [
          @parts[0],
          @parts[1],
          "****",
          "****",
          @parts[4..-1]
        ].flatten.join(" ")
      end

      def message
        if @board
          "Board [#{@board.code}] #{@board.name} created"
        else
          "Failed to create the board"
        end
      end
    end
  end
end
