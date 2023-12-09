defmodule DocSiteWeb.AlertExample do
  use DocSiteWeb, :live_component

  alias DocSiteWeb.CoreComponents

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{})}
  end

  def render(assigns) do
    ~H"""
    <button id="button">Move</button>
    <div
      id="whatever"
      phx-hook="Move"
      data-compounds-animation-easing="spring"
      data-compounds-animation-fill="forwards"
      data-compounds-animation-duration="1000"
      data-toggle="false"
      class="w-10 h-10 rounded-lg bg-red-500 origin-center">
      </div>
    """
  end
end
