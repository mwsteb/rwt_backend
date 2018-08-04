defmodule RwtBackendWeb.UserController do
  use RwtBackendWeb, :controller

  def index(conn, _params) do
    json conn, %{id: "DUPA KURWA CHUJ"}
  end
end
