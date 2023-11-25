defmodule DocSiteWeb.IconExample do
  use DocSiteWeb, :live_component

  alias DocSiteWeb.CoreComponents

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{})}
  end

  def render(assigns) do
    ~H"""
    <Compounds.Icon.icon src="/images/logo.svg" />
    <CoreComponents.icon name="hero-archive-box" />
    <CoreComponents.icon name="hero-adjustments-horizontal" />
    """
  end
end
