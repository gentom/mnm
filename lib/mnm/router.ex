defmodule Mnm.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, message())
  end

  defp message do
    Poison.encode!(%{
      response_type: "in_channel",
      text: "Hello from BOT :)"
    })
  end

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]}
    }
  end

  def start_link(_opts) do
    Plug.Adapters.Cowboy2.http(__MODULE__, [])
  end
end
