defmodule CompoundsTesterWeb.Home do
  @moduledoc """
  The main page of the application, used to display all components in one showcase.
  """

  use Phoenix.LiveView
  import CompoundsTesterWeb.Core.Checkbox
  import CompoundsTesterWeb.Demos

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{})}
  end

  def render(assigns) do
    ~H"""
      <div class="grid grid-cols-6 gap-y-12 p-16 h-full w-full">
      </div>
    """
  end

  def handle_event() do
  end
end
