defmodule CompoundsTesterWeb.Core.Card.CardDescription do
  use Phoenix.Component

  @doc """
  A description for the card component.

  # Attributes:
  * `class` - User defined TailwindCSS classes. This will be merge with the default class string.

  # Slots:
  - `inner_block` - The Phoenix default slot. Components passed in not matching the named slot will be rendered here.
                    You should use this slot to pass in the description text.

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
  </Card>
  """

  slot :inner_block
  attr :class, :string, default: nil

  def card_description(assigns) do
    assigns = assign(assigns, style: "text-gray-700")


    ~H"""
    <div class={Tails.classes([@style, @class])}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
