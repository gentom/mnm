defmodule Mnm.Application do
  use Application

  def start(_type, _args) do
    Supervisor.start_link(children(), opts())
  end

  defp children do
    [
      Mnm.Endpoint
    ]
  end

  defp opts do
    [
      strategy: :one_for_one,
      name: Mnm.Supervisor
    ]
  end

end
