class HomeController < ApplicationController
  def index
    render :index, locals: {
      messages:  [
        "Welcome to cliboard!",
        "Type \"help\" for a list of supported commands."
      ]
    }
  end

  def command
    command = Command.new(params[:command], session).build

    command.execute!

    render command.view, locals: { command: command }
  end
end
