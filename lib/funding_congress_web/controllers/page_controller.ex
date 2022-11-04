defmodule FundingCongressWeb.PageController do
  use FundingCongressWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
