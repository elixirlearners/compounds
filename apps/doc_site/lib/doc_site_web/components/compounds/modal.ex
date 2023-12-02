defmodule Compounds.Modal do
  use Phoenix.Component

  slot :inner_block
  attr :class, :string, default: nil
  attr :id, :string, default: nil
  attr :rest, :global

  def modal(assigns) do
    assigns = assign(assigns, id: assigns[:id] || Compounds.Id.generate("modal"))

    ~H"""
    <div class={Tails.classes(["", @class])} id={@id} {@rest} phx-hook="ComModal">
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  slot :inner_block
  attr :class, :string, default: nil
  attr :rest, :global

  def trigger(assigns) do
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
    assigns = assign(assigns, id: assigns[:id] || Compounds.Id.generate("modal-content"))

    ~H"""
    <.focus_wrap
      class={
        Tails.classes([
          "compounds-content absolute z-30 rounded-xl border border-[#cccccc] bg-white opacity-0 invisible pointer-events-none transition ease-in-out duration-300",
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

  slot :inner_block
  attr :class, :string, default: nil
  attr :id, :string, default: nil
  attr :rest, :global

  def actions(assigns) do
    ~H"""
    <div class={
      Tails.classes(["bg-neutral-100 border-t border-neutral-200 rounded-b-xl p-4", @class])
    }>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  slot :inner_block
  attr :close, :boolean, default: false
  attr :class, :string, default: nil
  attr :rest, :global

  def action(assigns) do
    # compounds-actions is used by the modal.js hook
    ~H"""
    <div class={Tails.classes(["compounds-action", @class])} close={@close} {@rest}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
