defmodule Compounds.Popover do
  use Phoenix.Component
  # TODO Long term:
  # Modify modals to create
  # - fullscreen: a modal that takes up almost the entire screen
  # - fullscreen_takeover: a modal that takes up the entire screen
  # However, only do this if dom patches doesn't override the fullscreen modals everytime
  # Render popover as modals on mobile

  slot :inner_block
  attr :class, :string, default: nil
  attr :id, :string, default: nil
  attr :rest, :global

  def popover(assigns) do
    assigns = assign(assigns, id: assigns[:id] || Compounds.Id.generate("popover"))

    ~H"""
    <div class={Tails.classes(["relative", @class])} id={@id} {@rest} phx-hook="ComPopover">
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  slot :inner_block
  attr :class, :string, default: nil
  attr :rest, :global

  def trigger(assigns) do
    # compounds-trigger is used by the phx-hook to target this element
    ~H"""
    <button class={Tails.classes(["compounds-trigger", @class])} {@rest}>
      <%= render_slot(@inner_block) %>
    </button>
    """
  end

  slot :inner_block
  attr :class, :string, default: nil
  attr :id, :string, default: nil
  attr :rest, :global

  def content(assigns) do
    assigns = assign(assigns, id: assigns[:id] || Compounds.Id.generate("popover-content"))
    # compounds-content is used by the phx-hook to target this element
    ~H"""
    <.focus_wrap
      class={
        Tails.classes([
          "compounds-content rounded-md shadow border bg-white p-4 w-fit h-fit absolute mt-2 opacity-0 ease-in duration-75",
          @class
        ])
      }
      id={@id}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </.focus_wrap>
    """
  end
end
