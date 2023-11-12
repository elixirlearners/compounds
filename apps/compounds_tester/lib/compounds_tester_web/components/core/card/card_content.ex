defmodule CompoundsTesterWeb.Core.Card.CardContent do
  use Phoenix.Component

  @doc """
    The main content for the Card component.

    # Slots:
    * `inner_block` - The default slot. 

    # Attributes:
    * `custom_style` - User defined TailwindCSS classes. This will be merge with the default class string.

  """
  slot :inner_block, required: true
  attr :custom_style, :string, default: nil


  def card_content(assigns) do
    assigns =
      assign(assigns, style: "")

    ~H"""
      <div class={Tails.classes([@style, @custom_style])}>
        <%= render_slot(@inner_block) %>
      </div>
    """
  end
end
