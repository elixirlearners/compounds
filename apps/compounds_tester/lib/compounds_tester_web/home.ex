defmodule CompoundsTesterWeb.Home do
  @moduledoc """
  The main page of the application, used to display all components in one showcase.
  """

  use Phoenix.LiveView
  import CompoundsTesterWeb.Core.Checkbox
  import CompoundsTesterWeb.Core.Card
  import Compounds.Input

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{})}
  end

  def render(assigns) do
    ~H"""
    <div class="grid grid-cols-6 gap-y-12 p-16 h-full w-full">
      <div class="col-span-6">
        <.input>
          <:label_right>
            Label Right
          </:label_right>
        </.input>
      </div>
      <div class="col-span-6">
        <.input>
          <:label_left>
            Label Left
          </:label_left>
        </.input>
      </div>
      <div class="col-span-6">
        <.input>
          <:label_left>
            Label Left
          </:label_left>
          <:label_right>
            Label Right
          </:label_right>
        </.input>
      </div>
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
        <form class="space-y-4"> 
        <div>
          <label>Could we have your cookies?</label>
          <input class="border rounded w-full"/>
          </div>
          <div>
          <label>Pretty please?</label>
          <input class="border rounded w-full"/>
          </div>
        </form>

        </.card_content>
        <.card_footer class="flex flex-row w-full justify-between">
          <button class="rounded-md px-3 py-1 bg-slate-900 text-white font-medium hover:bg-stone-700 transition ease-out duration-200">
            Accept
          </button>
          <button class="rounded-md px-3 py-1 bg-slate-900 text-white font-medium hover:bg-stone-700 transition ease-out duration-200">
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
