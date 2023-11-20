defmodule Compounds.Card do
  @moduledoc """
    A simple card with a header, title, description, content and footer.
  """

  use Phoenix.Component

  @doc """
    The main card component.

    # Attributes:
    * `class` - User defined TailwindCSS classes. This will be merge with the default class string.

  """
  slot :inner_block
  attr :class, :string, default: nil
  attr :rest, :global

  def card(assigns) do
    ~H"""
    <div
      {@rest}
      class={
        Tails.classes([
          "rounded-md shadow-md border flex flex-col justify-between bg-white p-8 py-12 space-y-10 w-fit h-fit ",
          @class
        ])
      }
    >
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  @doc """
    A header for the card component.

    # Attributes:
    * `class` - User defined TailwindCSS classes. This will be merge with the default class string.
  """

  slot :inner_block
  attr :class, :string, default: nil
  attr :rest, :global

  def header(assigns) do
    ~H"""
    <div {@rest} class={Tails.classes(["flex flex-col justify-between", @class])}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  @doc """
  A title for the card component.

  # Attributes:
  * `class` - User defined TailwindCSS classes. This will be merge with the default class string.
  """

  slot :inner_block
  attr :class, :string, default: nil
  attr :rest, :global

  def title(assigns) do
    ~H"""
    <div {@rest} class={Tails.classes(["text-2xl font-bold text-gray-700", @class])}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  @doc """
  A description for the card component.

  # Attributes:
  * `class` - User defined TailwindCSS classes. This will be merge with the default class string.

  """

  slot :inner_block
  attr :class, :string, default: nil
  attr :rest, :global

  def description(assigns) do
    ~H"""
    <div {@rest} class={Tails.classes(["text-gray-700 text-sm", @class])}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  @doc """
    The content for the card component.

    # Attributes:
    * `class` - User defined TailwindCSS classes. This will be merge with the default class string.

  """
  slot :inner_block
  attr :class, :string, default: nil
  attr :rest, :global

  def content(assigns) do
    ~H"""
    <div {@rest} class={Tails.classes(["", @class])}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  @doc """
    The footer for the Card component.

    # Attributes:
    * `class` - User defined TailwindCSS classes. This will be merge with the default class string.
  """
  slot :inner_block
  attr :class, :string, default: nil
  attr :rest, :global

  def footer(assigns) do
    ~H"""
    <div {@rest} class={Tails.classes(["", @class])}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
