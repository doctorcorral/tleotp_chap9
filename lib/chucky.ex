defmodule Chucky do
  @moduledoc false

  use Application
  require Logger

  def start(type, _args) do
    import Supervisor.Spec
    children = [
      worker(Chucky.Server, [])
    ]
  end

end
