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
  slot :input_block_label

  slot :outer_wrapper do
    attr :id, :string, required: false
    attr :class, :string, required: false
  end

  slot :inner_wrapper do
    attr :id, :string, required: false
    attr :class, :string, required: false
  end

  slot :input_wrapper do
    attr :id, :string, required: false
    attr :class, :string, required: false
  end

  attr :class, :string, default: nil
  attr :type, :string, default: "text"
  attr :placeholder, :string, default: "Placeholder"
  attr :disabled, :boolean, default: false
  attr :read_only, :boolean, default: false

  def input(assigns) do
    assigns =
      assign(assigns,
        style:
          "focus:outline-none focus:ring-0 m-1 p-0 shadow-none text-sm bg-transparent border-0 rounded-none width-full min-w-0 appearance-none",
        id: Compounds.Id.generate("")
      )

    ~H"""
    <div class={
      Keyword.get(@outer_wrapper, :class, "inline-block box-border items-center text-sm p-0 m-0")
    }>
      <%= if length(@input_block_label) > 0 do %>
        <.input_block_label>
          <%= render_slot(@input_block_label) %>
        </.input_block_label>
      <% end %>
      <div class={Keyword.get(@inner_wrapper, :class, "inline-flex items-center h-10")}>
        <%= if length(@label_left) > 0 do %>
          <.label_left>
            <%= render_slot(@label_left) %>
          </.label_left>
        <% end %>
        <div
          id={Keyword.get(@input_wrapper, :id, @id)}
          class={
            Keyword.get(
              @input_wrapper,
              :class,
              "inline-flex align-middle items-center h-full flex-1 select-none border rounded-md border-solid border-accent_2" <>
                if length(@label_right) > 0 do
                  " rounded-tr-none rounded-br-none "
                else
                  ""
                end <>
                if length(@label_left) > 0 do
                  " rounded-tl-none rounded-bl-none "
                else
                  ""
                end <>
                if @disabled do
                  "bg-accent_1 border-accent_2"
                else
                  ""
                end
            )
          }
        >
          <%= if length(@icon_left) > 0 do %>
            <.icon_left>
              <%= render_slot(@icon_left) %>
            </.icon_left>
          <% end %>
          <input
            disabled={@disabled}
            readOnly={@read_only}
            phx-blur={
              JS.transition({"ease duration-200", "border-black", "border-accent_2"},
                to: "#" <> Keyword.get(@input_wrapper, :id, @id)
              )
            }
            phx-focus={
              JS.transition({"ease duration-200", "border-accent_2", "border-black"},
                to: "#" <> Keyword.get(@input_wrapper, :id, @id)
              )
            }
            class={
              Tails.classes([
                @style <>
                  if @disabled do
                    " cursor-not-allowed "
                  else
                    ""
                  end,
                @class
              ])
            }
            type={@type}
            placeholder={@placeholder}
          />
          <%= if length(@icon_right) > 0 do %>
            <.icon_right>
              <%= render_slot(@icon_right) %>
            </.icon_right>
          <% end %>
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
    <.input_label class={Tails.classes([@style, @class])}>
      <%= render_slot(@inner_block) %>
    </.input_label>
    """
  end

  slot :inner_block
  attr :class, :string, default: nil

  def label_left(assigns) do
    assigns = assign(assigns, style: "rounded-tl-0 rounded-bl-0")

    ~H"""
    <.input_label class={Tails.classes([@style, @class])} is_right?={false}>
      <%= render_slot(@inner_block) %>
    </.input_label>
    """
  end

  slot :inner_block
  attr :class, :string, default: nil

  def input_block_label(assigns) do
    assigns =
      assign(assigns,
        style: "block font-normal text-accent_6 pt-0 pb-0 pr-0 pl-px mb-2 text-base leading-6"
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
          py-0 px-gap_half text-accent_4 bg-accent_1
          border-solid border border-accent_2
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

  # .input-icon {
  #   box-sizing: border-box;
  #   display: inline-flex;
  #   width: calc(var(--input-height) - 2px);
  #   flex-shrink: 0;
  #   height: 100%;
  #   align-items: center;
  #   justify-content: center;
  #   margin: 0;
  #   padding: 0;
  #   line-height: 1;
  #   position: relative;
  #   cursor: ${clickable ? 'pointer' : 'default'};
  #   pointer-events: ${clickable ? 'auto' : 'none'};
  # }
  # .input-icon :global(svg) {
  #   width: calc(var(--input-height) - 2px);
  #   height: calc(var(--input-height) - 2px);
  #   transform: scale(0.44);
  # }
  slot :inner_block
  attr :class, :string, default: nil

  def icon_right(assigns) do
    assigns =
      assign(assigns,
        style:
          "box-border inline-flex w-[2.5rem] shrink h-full items-center justify-center m-0 p-0 leading-none relative"
      )

    ~H"""
    <div class={Tails.classes([@style, @class])}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  slot :inner_block
  attr :class, :string, default: nil

  def icon_left(assigns) do
    assigns =
      assign(assigns,
        style:
          "box-border inline-flex w-[2.5rem] shrink h-full items-center justify-center m-0 p-0 leading-none relative"
      )

    ~H"""
    <div class={Tails.classes([@style, @class])}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
