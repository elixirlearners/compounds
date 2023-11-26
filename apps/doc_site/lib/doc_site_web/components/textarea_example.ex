defmodule DocSiteWeb.TextAreaExample do
  use DocSiteWeb, :live_component

  alias DocSiteWeb.CoreComponents

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{})}
  end

  # TODO show case resizable textarea
  def render(assigns) do
    ~H"""
    <Compounds.TextArea.text_area class="resize" />
    """
  end
end
