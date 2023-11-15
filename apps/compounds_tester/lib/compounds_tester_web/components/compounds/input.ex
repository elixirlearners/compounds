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
  slot :label_right
  slot :label_left
  slot :icon_right
  slot :icon_left
  attr :class, :string, default: nil
  attr :type, :string, default: "text"
  attr :placeholder, :string, default: "Placeholder"

  def input(assigns) do
    assigns =
      assign(assigns,
        style:
          "focus:outline-none focus:ring-0 m-1 p-0 shadow-none text-sm bg-transparent border-0 rounded-none width-full min-w-0 appearance-none"
      )

    ~H"""
    <div class="inline-block box-border items-center text-sm p-0 m-0">
      <div class="inline-flex items-center h-10">
        <%= if length(@label_left) > 0 do %>
          <.label_left>
            <%= render_slot(@label_left) %>
          </.label_left>
        <% end %>
        <div class={"inline-flex align-middle items-center h-full flex-1 select-none border rounded-md border-solid border-[#eaeaea]
          transition-[border] duration-200 ease-in-out "
            <> if length(@label_right) > 0 do " rounded-tr-none rounded-br-none "  else "" end
            <> if length(@label_left) > 0 do " rounded-tl-none rounded-bl-none "  else "" end
          }>
          <%= render_slot(@icon_right) %>
          <input class={Tails.classes([@style, @class])} type={@type} placeholder={@placeholder} />
          <%= render_slot(@icon_left) %>
        </div>
        <%= if length(@label_right) > 0 do %>
          <.label_right>
            <%= render_slot(@label_right) %>
          </.label_right>
        <% end %>
      </div>
    </div>
    """
  end

  slot :inner_block
  attr :class, :string, default: nil

  def label_right(assigns) do
    assigns = assign(assigns, style: "rounded-tr-0 rounded-bl-0")

    ~H"""
    <.input_label class={@class}>
      <%= render_slot(@inner_block) %>
    </.input_label>
    """
  end

  slot :inner_block
  attr :class, :string, default: nil

  def label_left(assigns) do
    assigns = assign(assigns, style: "rounded-tl-0 rounded-bl-0")

    ~H"""
    <.input_label is_right?={false}>
      <%= render_slot(@inner_block) %>
    </.input_label>
    """
  end

  slot :inner_block
  attr :class, :string, default: nil

  def input_block_label(assigns) do
    assigns =
      assign(assigns,
        style: "block font-normal text-[#444] pt-0 pb-0 pr-0 pl-px mb-2 text-base leading-6"
      )

    ~H"""
    <label class={Tails.classes([@style, @class])}>
      <%= render_slot(@inner_block) %>
    </label>
    """
  end

  slot :inner_block
  attr :class, :string, default: nil
  attr :is_right?, :boolean, default: true

  def input_label(assigns) do
    assigns =
      assign(assigns,
        style:
          """
          inline-flex h-full items-center pointer-events-none m-0
          py-0 px-[8pt] text-[#888] bg-[#fafafa]
          border-solid border border-[#eaeaea]
          """ <>
            if assigns.is_right? do
              "rounded-tl-0 rounded-bl-0 rounded-tr-[6px] rounded-br-[6px] border-l-0"
            else
              "rounded-tl-[6px] rounded-bl-[6px] border-r-0"
            end <>
            """
              leading-none
            """
      )

    ~H"""
    <label class={Tails.classes([@style, @class])}>
      <%= render_slot(@inner_block) %>
    </label>
    """
  end

  slot :inner_block
  attr :class, :string, default: nil

  def icon_right(assigns) do
    assigns = assign(assigns, style: "mr-0")

    ~H"""
    <div class={Tails.classes([@style, @class])}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  slot :inner_block
  attr :class, :string, default: nil

  def icon_left(assigns) do
    assigns = assign(assigns, style: "ml-0")

    ~H"""
    <div class={Tails.classes([@style, @class])}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
