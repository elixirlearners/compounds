defmodule DocSiteWeb.ToggleExample do
  use DocSiteWeb, :live_component

  alias DocSiteWeb.CoreComponents
  alias Compounds.Toggle

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{})}
  end

  def render(assigns) do
    ~H"""
    <Toggle.toggle />
    <Toggle.toggle checked={true} type="primary" />
    <Toggle.toggle checked={true} type="secondary" />
    <Toggle.toggle checked={true} type="success" />
    <Toggle.toggle checked={true} type="warning" />
    <Toggle.toggle checked={true} type="error" />
    """
  end
end
