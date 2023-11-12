defmodule CompoundsTesterWeb.Core.Card.CardContent do
  use Phoenix.Component

  @doc """
    The main content for the Card component.

    # Slots:
    * `inner_block` - The default slot. 

    # Attributes:
    * `class` - User defined TailwindCSS classes. This will be merge with the default class string.

  """
  slot :inner_block
  attr :class, :string, default: nil


  def card_content(assigns) do
    assigns =
      assign(assigns, style: "")

    ~H"""
      <div class={Tails.classes([@style, @class])}>
        <%= render_slot(@inner_block) %>
      </div>
    """
  end
end
