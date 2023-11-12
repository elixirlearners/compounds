defmodule CompoundsTesterWeb.Home do
  @moduledoc """
  The main page of the application, used to display all components in one showcase.
  """

  use Phoenix.LiveView
  import CompoundsTesterWeb.Core.Checkbox
  import CompoundsTesterWeb.Core.Card
  import CompoundsTesterWeb.Core.Card.CardHeader
  import CompoundsTesterWeb.Core.Card.CardTitle
  import CompoundsTesterWeb.Core.Card.CardDescription

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{})}
  end

  def render(assigns) do
    ~H"""
    <div class="grid grid-cols-6 gap-y-12 p-16 h-full w-full">
      <.card>
        <.card_header>
          <.card_title>
            Card Title
          </.card_title>
          <.card_description>
            Card Description
          </.card_description>
        </.card_header>
      </.card>
    </div>
    """
  end

  def handle_event() do
  end
end
