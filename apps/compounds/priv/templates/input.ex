defmodule Compounds.Input do
  @moduledoc """
    The input component and it's sub-components.
    TODO document the intention of this component.
  """

  use Phoenix.Component
  alias Phoenix.LiveView.JS

  @doc """
    An input component.

    # Attributes:
    * `custom_style` - User defined TailwindCSS classes. This will be merge with the default class string.

    # Slots:
    * `label_right` - Label to be placed to the right of the input.
    * `label_left` - Label to be placed to the left of the input.
    * `icon_right` - Icon to be placed to the right of the input.
    * `icon_left` - Icon to be placed to the left of the input.
  """
  slot(:label_right)
  slot(:label_left)
  slot(:icon_right)
  slot(:icon_left)
  attr(:class, :string, default: nil)
  attr(:type, :string, default: "text")
  attr(:placeholder, :string, default: "Placeholder")

  def input(assigns) do
    assigns =
      assign(assigns,
        style:
          "m-1 p-0 text-sm bg-transparent border-nonei outline-none rounded-none width-full min-w-0"
      )

    ~H"""
    <div class="inline-block box-border items-center">
      <div class="inline-flex items-center">
        <div class="inline-flex align-middle align-items-center h-full flex-1 rounded border border-solid border-[#eaeaea]">
          <%= render_slot(@label_right) %>
          <%= render_slot(@icon_right) %>
          <input type={@type} placeholder={@placeholder}/>
          <%= render_slot(@label_left) %>
          <%= render_slot(@icon_left) %>
        </div>
      </div>
    </div>
    """
  end

  slot(:inner_block)
  attr(:class, :string, default: nil)

  def label_right(assigns) do
    assigns = assign(assigns, style: "text-2xl font-bold text-gray-700")

    ~H"""
    <div class={Tails.classes([@style, @class])}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  slot(:inner_block)
  attr(:class, :string, default: nil)

  def label_left(assigns) do
    assigns = assign(assigns, style: "rounded-tl-0 rounded-bl-0")

    ~H"""
    <div class={Tails.classes([@style, @class])}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  slot(:inner_block)
  attr(:class, :string, default: nil)

  def icon_right(assigns) do
    assigns = assign(assigns, style: "text-2xl font-bold text-gray-700")

    ~H"""
    <div class={Tails.classes([@style, @class])}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  slot(:inner_block)
  attr(:class, :string, default: nil)

  def icon_left(assigns) do
    assigns = assign(assigns, style: "text-2xl font-bold text-gray-700")

    ~H"""
    <div class={Tails.classes([@style, @class])}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
