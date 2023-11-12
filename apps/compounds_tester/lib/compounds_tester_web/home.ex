defmodule CompoundsTesterWeb.Home do
  @moduledoc """
  The main page of the application, used to display all components in one showcase.
  """

  use Phoenix.LiveView
  import CompoundsTesterWeb.Core.Checkbox
  import CompoundsTesterWeb.Core.Card

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
        <.card_content>
          Some content here
        </.card_content>
        <.card_footer class="flex flex-row w-full justify-between px-4">
          <button class="rounded-md px-3 py-1 bg-slate-900 text-white font-medium hover:bg-stone-700 transition ease-in">
            Accept
          </button>
          <button class="rounded-md px-3 py-1 bg-slate-900 text-white font-medium hover:bg-stone-700 transition ease-in">
            Decline
          </button>
        </.card_footer>
      </.card>
    </div>
    """
  end

  def handle_event() do
  end
end
