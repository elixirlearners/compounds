defmodule Compounds.Card do
  @moduledoc """
    The card component and it's sub-components.
    TODO document the intention of this component.
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
      assign(assigns,
        style: "rounded-md shadow-md border flex flex-col justify-between bg-white p-8 space-y-8"
      )

    ~H"""
    <div class={Tails.classes([@style, @class])}>
      <%= render_slot(@card_header) %>
      <%= render_slot(@card_content) %>
      <%= render_slot(@card_footer) %>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  @doc """
    A header for the card component.

    # Attributes:
    * `class` - User defined TailwindCSS classes. This will be merge with the default class string.

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

  attr :class, :string, default: nil

  def card_header(assigns) do
    assigns = assign(assigns, style: "flex flex-col justify-between")

    ~H"""
    <div class={Tails.classes([@style, @class])}>
      <%= render_slot(@card_title) %>
      <%= render_slot(@card_description) %>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

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
  attr :class, :string, default: nil

  def card_title(assigns) do
    assigns = assign(assigns, style: "text-2xl font-bold text-gray-700")

    ~H"""
    <div class={Tails.classes([@style, @class])}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

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
    assigns = assign(assigns, style: "text-gray-700 text-sm")

    ~H"""
    <div class={Tails.classes([@style, @class])}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

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

  @doc """
    The footer for the Card component.

    # Slots:
    * `inner_block` - The default slot.

    # Attributes:
    * `class` - User defined TailwindCSS classes. This will be merge with the default class string.
  """
  slot :inner_block
  attr :class, :string, default: nil

  def card_footer(assigns) do
    assigns =
      assign(assigns, style: "")

    ~H"""
    <div class={Tails.classes([@style, @class])}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
