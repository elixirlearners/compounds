defmodule CompoundsTesterWeb.Core.Card.CardHeader do
  use Phoenix.Component

  @doc """
    A header for the card component.

    # Attributes:
    * `custom_style` - User defined TailwindCSS classes. This will be merge with the default class string.

    # Slots:
    - `card_title` - The title of the card.
    - `card_description` - The description of the card.
    - `inner_block` - The Phoenix default slot. Components passed in not matching the named slot will be rendered here.

    # Examples:
    <Card>
      <CardHeader>
        <CardTitle>
          Card Title
        </CardTitle>
        <CardDescription>
          Card Description
        </CardDescription>
      </CardHeader>
      <CardContent>
        <p class="text-gray-700">Card content.</p>
      </CardContent>
    </Card>
  """

  slot :card_title
  slot :card_description
  slot :inner_block

  attr :custom_style, :string, default: nil

  def card_header(assigns) do
    assigns = assign(assigns, style: "flex flex-col justify-between")

    ~H"""
    <div class={Tails.classes([@style, @custom_style])}>
      <%= render_slot(@card_title) %>
      <%= render_slot(@card_description) %>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
