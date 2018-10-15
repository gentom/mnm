defmodule Mnm.Endpoint do
  use Plug.Router

  plug(:match)

  plug(
    Plug.Parsers,
    parsers:      [:json],
    pass:         ["application/json"],
    json_decoder: Poison
  )

  plug(:dispatch)

  forward("/bot", to: Mnm.Router)

  match _ do
    send_resp(conn, 404, "Requested page not found!")
  end
end
