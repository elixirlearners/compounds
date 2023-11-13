defmodule Compounds.Tabs do
  use Phoenix.Component
  alias Phoenix.LiveView.JS

  @moduledoc """
    Tabs organize content into multiple sections and allow users to navigate between them.

    Examples:
  """

  # 1.0 Todos
  # TODO add scroll behavior for when tabs overflow the header
  # TODO grayscale icons when disabled
  # TODO: ALWAYS reject multiple tabs_header or tabs_content, this will cause unexpected behavior
  # TODO: pick better names, don't be inconsistent.
  # IE: In this file and the JS hook, theres tabs_header vs tab_header vs tab vs tabs vs tabs_content vs tab_content

  slot :inner_block
  attr :class, :string, default: nil
  attr :active_id, :string, default: nil

  def tabs(assigns) do
    assigns = assign(assigns, :tabs_id, "tabs-" <> Ecto.UUID.generate())

    ~H"""
    <div
      id={@tabs_id}
      class={Tails.classes(["w-full h-36", @class])}
      phx-hook="ComTabs"
      phx-mounted={JS.dispatch("switch-tabs", detail: %{active_id: @active_id})}
    >
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  slot :inner_block
  attr :class, :string, default: nil

  def tabs_header(assigns) do
    ~H"""
    <!-- The tabs-header class is used by the ComTabs hook to query for this element-->
    <div class={Tails.classes(["w-full px-7 flex space-x-6 h-12 border-b tabs-header", @class])}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  slot :inner_block
  attr :id, :string, required: true
  attr :disabled, :boolean, default: false

  def tab(assigns) do
    ~H"""
    <button
      id={"tab-"<>@id}
      class="flex items-center justify-center whitespace-nowrap space-x-2 cursor-pointer px-2
      border-black border-b-2 border-transparent text-slate-600 enabled:hover:text-black disabled:cursor-not-allowed"
      phx-click={JS.dispatch("switch-tabs", detail: %{active_id: @id})}
      disabled={@disabled}
    >
      <%= render_slot(@inner_block) %>
    </button>
    """
  end

  slot :inner_block
  attr :class, :string, default: nil

  def tabs_content(assigns) do
    ~H"""
    <!-- The tabs-content class is used by the ComTabs hook to query for this element-->
    <div class={Tails.classes(["h-full w-full tabs-content p-4", @class])}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  slot :inner_block
  attr :id, :string, required: true

  def content(assigns) do
    ~H"""
    <div class="hidden w-full" id={"tab-content-" <> @id}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
