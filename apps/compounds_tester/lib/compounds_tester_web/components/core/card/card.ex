defmodule CompoundsTesterWeb.Core.Card do
  @moduledoc """
    A simple card component.
  """

  use Phoenix.Component
  alias Phoenix.LiveView.JS

  @doc """
    A card component. 

    # Attributes:
    * `custom_style` - User defined TailwindCSS classes. This will be merge with the default class string.

    # Slots:
    * `card_header` - The top header. 
    * `card_content` - The main content of the card.
    * `card_footer` - The card's footer, often used for buttons / actions. 
  """
  slot :card_header
  slot :card_content
  slot :card_footer
  slot :inner_block
  attr :class, :string, default: nil

  def card(assigns) do
    assigns =
      assign(assigns, style: "rounded-md shadow-md flex flex-col justify-between items-center bg-white p-4 h-56")

    ~H"""
    <div class={Tails.classes([@style, @class])}>
        <%= render_slot(@card_header) %>
        <%= render_slot(@card_content) %>
        <%= render_slot(@card_footer) %>
        <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
