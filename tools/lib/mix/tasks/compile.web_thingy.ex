defmodule Mix.Tasks.Compile.WebThingy do
  use Mix.Task

  @shortdoc "Web app and copies assets"

  @moduledoc """
    Builds static web page
  """

  def run(_args) do
    Mix.shell.info "Installing npm dependencies.."
    if System.find_executable("npm") == nil do
      raise "NPM system executable is missing.. exiting"
    end

    # Do something with npm here

    Mix.Task.run "phoenix.digest"
  end
end