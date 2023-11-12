defmodule CompoundsTesterWeb.Core.Card.CardTitle do
  use Phoenix.Component


  @doc """
    A title for the card component.

    # Attributes:
    * `custom_style` - User defined TailwindCSS classes. This will be merge with the default class string.

    # Slots:
    - `inner_block` - The Phoenix default slot. Components passed in not matching the named slot will be rendered here.
                      You should use this slot to pass in the title text.

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
      attr :custom_style, :string, default: nil

  def card_title(assigns) do
    assigns = assign(assigns, style: "text-2xl font-bold text-gray-700")


    ~H"""
      <div class={Tails.classes([@style, @custom_style])}>
        <%= render_slot(@inner_block) %>
      </div>
    """
  end
end