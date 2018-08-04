defmodule RwtBackendWeb.Plugs.RequireAuth do
  import Plug.Conn, only: [halt: 1, put_status: 2]
  import Phoenix.Controller, only: [json: 2]

  def init(_) do end

  def call(%{req_headers: headers} = conn, params) do
    require IEx; IEx.pry
    case check_auth_header_present(headers) do
      true -> conn
      false ->
        conn
        |> put_status(401)
        |> json(%{error: "spierdalaj"})
        |> halt()
    end
  end

  defp check_auth_header_present(headers) do
    Enum.any?(headers, fn(h) -> h == { "authorization", "Bearer horseporn" } end)
  end
end
