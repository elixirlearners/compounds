defmodule DocSiteWeb.HomeController do
  use DocSiteWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{})}
  end
end
