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
  attr :custom_style, :string, default: nil

  def card(assigns) do
    assigns =
      assign(assigns, style: "rounded-md shadow-md flex flex-col justify-between bg-white p-4")

    ~H"""
    <div class={Tails.classes([@style, @custom_style])}>
      <div>
        <%= render_slot(@card_header) %>
      </div>

      <div>
        <%= render_slot(@card_content) %>
      </div>

      <div>
        <%= render_slot(@card_footer) %>
      </div>
      
      <div>
        <%= render_slot(@inner_block) %>
      </div>

    </div>
    """
  end
end
