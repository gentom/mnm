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

end
