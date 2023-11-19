defmodule Compounds.Tabs do
  use Phoenix.Component
  alias Phoenix.LiveView.JS

  @moduledoc """
    Tabs organize content into multiple sections and allow users to navigate between them.
  """

  # 1.0 Todos
  # TODO add scroll behavior for when tabs overflow the header
  # TODO grayscale icons when disabled

  slot :inner_block
  attr :class, :string, default: nil
  attr :active_key, :string, default: "1"
  # When using phx-hook, a unique DOM ID must always be set.
  attr :id, :string, default: Compounds.Id.generate("tabs")
  attr :rest, :global

  def tabs(assigns) do
    ~H"""
    <div
      id={@id}
      active_key={@active_key}
      {@rest}
      class={Tails.classes(["w-full h-36", @class])}
      phx-hook="ComTabs"
    >
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  slot :inner_block
  attr :class, :string, default: nil
  attr :rest, :global

  def tabs_header(assigns) do
    ~H"""
    <!-- The tabs-header class is used by the ComTabs hook to query for this element-->
    <div
      {@rest}
      class={Tails.classes(["w-full px-7 flex space-x-6 h-12 border-b tabs-header", @class])}
    >
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  slot :inner_block
  attr :key, :string, required: true
  attr :disabled, :boolean, default: false
  attr :rest, :global

  def tab(assigns) do
    ~H"""
    <button
      {@rest}
      key={"tab-" <> @key}
      class="flex items-center justify-center whitespace-nowrap space-x-2 cursor-pointer px-2
      border-black border-b-2 border-transparent text-slate-600 enabled:hover:text-black disabled:cursor-not-allowed"
      phx-click={JS.dispatch("switch-tabs", detail: %{active_key: @key})}
      disabled={@disabled}
    >
      <%= render_slot(@inner_block) %>
    </button>
    """
  end

  slot :inner_block
  attr :class, :string, default: nil
  attr :rest, :global

  def tabs_content(assigns) do
    ~H"""
    <!-- The tabs-content class is used by the ComTabs hook to query for this element-->
    <div {@rest} class={Tails.classes(["h-full w-full tabs-content p-4", @class])}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  slot :inner_block
  attr :key, :string, required: true
  attr :rest, :global

  def content(assigns) do
    ~H"""
    <div {@rest} key={"content-" <> @key} class="hidden w-full">
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
