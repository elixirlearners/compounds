defmodule Compounds.Navbar do
  use Phoenix.Component

  attr(:rest, :global)
  attr(:fixed, :boolean, default: false)
  attr(:class, :string, default: nil)
  attr(:id, :string, default: Compounds.Id.generate("navbar"))
  slot(:left, required: true)
  slot(:middle, required: true)
  slot(:right, required: true)

  def navbar(assigns) do
    assigns =
      assign(assigns,
        default_class:
          "bg-white border-b border-gray-200 px-4 z-50 #{fixed_classes(assigns[:fixed])}"
      )

    ~H"""
    <nav {@rest} id={@id} class={Tails.classes([@default_class, @class])}>
      <div class="md:container mx-auto">
        <div class="flex flex-wrap justify-between items-center h-16">
          <div class="flex justify-start items-center">
            <%= render_slot(@left) %>
          </div>

          <div class="flex justify-center items-center">
            <%= render_slot(@middle) %>
          </div>

          <div class="flex items-center lg:order-2">
            <%= render_slot(@right) %>
          </div>
        </div>
      </div>
    </nav>
    """
  end

  attr(:rest, :global)

  attr(:target_id, :string,
    doc: "Pass in the ID of the menu, used for toggling visibility at small sizes"
  )

  slot(:inner_block, required: true)
  slot(:close, required: true)

  def menu_trigger(assigns) do
    ~H"""
    <button
      {@rest}
      type="button"
      id={@target_id <> "-popover"}
      data-menutrigger={@target_id}
      aria-controls={@target_id}
      class="md:hidden"
    >
      <%= render_slot(@inner_block) %>
      <span class="sr-only">Toggle menu</span>
    </button>
    """
  end

  attr(:id, :string)

  slot :item, required: true do
    attr :link, :any, required: true
    attr :icon, :string, required: true
    attr :title, :string, required: true
  end

  def menu(assigns) do
    ~H"""
    <div
      id={@id}
      phx-hook="ResponsiveMenu"
      data-open="false"
      data-compounds-animation="fadeDown"
      data-compounds-animation-duration="300"
      data-compounds-animation-easing="easeInOut"
      data-compounds-animation-iterations="1"
      class="hidden absolute md:block md:static top-16 left-0 right-0 h-screen md:h-auto z-40 p-4 md:p-0 bg-white"
    >
      <ul class="md:space-x-4 md:space-y-0 md:flex md:mx-0 mx-auto space-y-3">
        <li :for={item <- @item}><%= render_slot(item) %></li>
      </ul>
    </div>
    """
  end

  defp fixed_classes(true = _fixed), do: "fixed left-0 right-0 top-0 z-50"
  defp fixed_classes(false = _fixed), do: ""
end
