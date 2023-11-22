defmodule Compounds.Dropdown do
  use Phoenix.Component
  alias Phoenix.LiveView.JS

  attr(:id, :string, default: Compounds.Id.generate("dropdown"))
  attr(:class, :string, default: nil)
  attr(:align_right, :boolean, default: false)
  attr(:rest, :global)
  slot(:inner_block, doc: "The content of the dropdown", required: true)
  slot(:trigger, doc: "The element to trigger the dropdown menu", required: true)

  @doc """
  Renders a drop down menu

  ## Examples
    <.dropdown id="my-dropdown">
      <:trigger>Open</:trigger>
    </.dropdown
  """
  def dropdown(assigns) do
    ~H"""
    <div
      {@rest}
      id={@id}
      class={Tails.classes(["relative mb-20", @class])}
      phx-remove={hide_menu(@id)}
      data-cancel={JS.exec("phx-remove")}
      phx-click-away={hide_menu(@id)}
    >
      <button
        id={"#{@id}-popover"}
        aria-controls="menu"
        aria-expanded={false}
        class="appearance-none"
        phx-click={show_menu(@id)}
      >
        <%= render_slot(@trigger) %>
      </button>
      <.focus_wrap
        id={"#{@id}-menu"}
        role="menu"
        aria-orientation="vertical"
        aria-labelledby={"#{@id}-popover"}
        class={
          Tails.classes([
            "#{if @align_right == true, do: "right-0", else: "left-0"}",
            "hidden absolute z-10 mt-2 max-w-full sm:w-60 w-full origin-top-right rounded-md border  bg-white shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none overflow-hidden"
          ])
        }
        phx-key="escape"
        phx-window-keydown={JS.exec("data-cancel", to: "##{@id}")}
      >
        <%= render_slot(@inner_block) %>
      </.focus_wrap>
    </div>
    """
  end

  @doc """
  Renders an item group

  ## Examples
  </.item_group>My content</.item_group>
  """
  slot(:inner_block, doc: "The content of the item group")
  attr(:class, :string, default: nil)

  # TODO: missing Tails.classes()
  def item_group(assigns) do
    ~H"""
    <div class={Tails.classes(["last-of-type:border-y-0 border-b", @class])} role="none">
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  @doc """
  Renders a link in an item group

  ## Examples
    <.link_item href={~p"/"}>
      <:icon>
        <.icon
        name="hero-wrench-screwdriver"
        class="h-4 w-4"
        />
      </:icon>
      Admin Dashboard
    </.link_item>
  """
  attr(:href, :string)
  attr(:rest, :global)
  attr(:class, :string, default: nil)
  slot(:inner_block, doc: "The content of the item")
  slot(:icon, doc: "Optional icon slot")

  def link_item(assigns) do
    ~H"""
    <.link
      {@rest}
      href={@href}
      role="menuitem"
      class={
        Tails.classes([
          "text-sm font-medium leading-6 text-zinc-900  hover:bg-zinc-100 w-full px-4 py-3 flex items-center",
          @class
        ])
      }
    >
      <%= if @icon != [] do %>
        <span class="mr-2 -mt-1">
          <%= render_slot(@icon) %>
        </span>
      <% end %>
      <%= render_slot(@inner_block) %>
    </.link>
    """
  end

  @doc """
  Renders a generic item in an item group

  ## Examples
    <.item>Some item</.item>
  """
  attr(:rest, :global)
  slot(:inner_block, doc: "The content of the item")
  slot(:icon, doc: "Optional icon slot")
  attr(:class, :string, default: nil)

  def item(assigns) do
    ~H"""
    <div
      {@rest}
      role="none"
      class={
        Tails.classes([
          "text-sm font-medium leading-6w-full p-4 py-3 text-zinc-900  hover:bg-zinc-100",
          @class
        ])
      }
    >
      <%= if @icon != [] do %>
        <span class="mr-2 -mt-1">
          <%= render_slot(@icon) %>
        </span>
      <% end %>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  defp hide_menu(id) do
    JS.hide(
      to: "##{id}-menu",
      transition: {"ease-in-out duration-150", "opacity-100", "opacity-0"},
      time: 150
    )
    |> JS.remove_attribute("aria-expanded", to: "##{id}-popover")
    |> JS.pop_focus()
  end

  defp show_menu(id) do
    JS.show(
      to: "##{id}-menu",
      transition: {"ease-in-out duration-150", "opacity-0", "opacity-100"},
      time: 150
    )
    |> JS.set_attribute({"aria-expanded", "true"}, to: "##{id}-popover")
    |> JS.focus_first(to: "##{id}-menu")
  end
end
