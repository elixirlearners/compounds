defmodule Compounds.Navbar do
  use Phoenix.Component
  alias Phoenix.LiveView.JS

  attr(:rest, :global)
  attr(:fixed, :boolean, default: false)
  attr(:class, :string, default: nil)
  attr(:id, :string, default: Compounds.Id.generate("navbar"))
  slot(:left, required: true)
  slot(:middle, required: true)
  slot(:menu, required: true)
  slot(:menu_trigger)

  def navbar(assigns) do
    ~H"""
    <nav
      {@rest}
      id={@id}
      class={
        Tails.classes([
          "#{if @fixed == true, do: "fixed left-0 right-0 top-0 z-50", else: nil}",
          "bg-white border-b border-gray-200 px-4 z-50"
        ])
      }
    >
      <div class="md:container mx-auto">
        <div class="flex flex-wrap justify-between items-center h-16">
          <div class="flex justify-start items-center">
            <%= render_slot(@left) %>
          </div>

          <div class="flex justify-center items-center">
            <%= render_slot(@middle) %>
          </div>

          <div class="flex items-center lg:order-2">
            <%= render_slot(@menu, @id) %>
            <%= render_slot(@menu_trigger) %>
          </div>
        </div>
      </div>
    </nav>
    """
  end

  attr(:rest, :global)
  attr(:target_id, :string, doc: "Pass in the ID of the menu to show at small sizes")
  slot(:inner_block, required: true)
  slot(:close, required: true)

  def menu_trigger(assigns) do
    IO.inspect(assigns)

    ~H"""
    <button
      {@rest}
      type="button"
      id={@target_id <> "-popover"}
      phx-click={toggle_menu(@target_id)}
      aria-controls={@target_id}
      class="md:hidden"
    >
      <%= render_slot(@inner_block) %>
      <span class="sr-only">Toggle menu</span>
    </button>
    """
  end

  attr(:id, :string,
    doc: "Pass in the ID of the menu, used for toggling visibility at small sizes"
  )

  slot :item, required: true do
    attr :link, :any, required: true
    attr :icon, :string, required: true
    attr :title, :string, required: true
  end

  def menu(assigns) do
    ~H"""
    <div
      id={@id}
      class="md:visible hidden absolute md:static top-16 left-0 right-0 h-screen z-40 p-4 md:p-0 bg-white"
    >
      <ul class="md:space-x-4 md:space-y-0 md:flex md:mx-0 mx-auto space-y-3">
        <li :for={item <- @item}><%= render_slot(item) %></li>
      </ul>
    </div>
    """
  end

  defp toggle_menu(id) do
    JS.toggle(
      to: "##{id}",
      in: {"ease-in-out duration-150", "opacity-0", "opacity-100"},
      out: {"ease-in-out duration-150", "opacity-100", "opacity-0"},
      time: 150
    )
    |> JS.set_attribute({"aria-expanded", "true"}, to: "##{id}-popover")
    |> JS.focus_first(to: "##{id}")
  end
end
