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

  case type do
    :normal ->
      Logger.info("Application is started on #{node}")

    {:takeover, old_node} ->
      Logger.info("#{node} is taking over #{old_node}")

    {:failover, old_node} ->
      Logger.info("#{old_node} is failing over to #{node}")
  end

  opts = [strategy: :one_for_one, name: {:global, Chucky.Supervisor}]
  Supervisor.start_link(children, options)
end
