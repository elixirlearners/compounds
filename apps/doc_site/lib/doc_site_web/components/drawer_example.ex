defmodule DocSiteWeb.DrawerExample do
  use DocSiteWeb, :live_component

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{})}
  end

  def render(assigns) do
    ~H"""
    <h1>TODO</h1>
    """
  end
end
