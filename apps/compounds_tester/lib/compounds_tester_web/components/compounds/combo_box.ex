defmodule Compounds.ComboBox do
  use Phoenix.Component

  slot :inner_block
  attr :options, :list, default: []
  attr :selected, :string, default: nil
  attr :class, :string, default: nil
  attr :id, :string, default: Compounds.Id.generate("combo-box")
  attr :rest, :global

  @spec combo_box(map()) :: Phoenix.LiveView.Rendered.t()
  def combo_box(assigns) do
    ~H"""
    <div
      class={
        Tails.classes([
          "flex flex-col space-y-3",
          @class
        ])
      }
      phx-hook="ComCombo"
      id={@id}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  slot :inner_block
  attr :class, :string, default: nil
  attr :rest, :global

  def input_wrapper(assigns) do
    ~H"""
    <!-- Input Wrapper -->
    <div
      class={
        Tails.classes([
          "flex items-center space-x-4 rounded-md px-5 border
         border-neutral-400 focus-within:ring-4 focus-within:ring-neutral-300 transition duration-200",
          @class
        ])
      }
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  attr :class, :string, default: nil
  attr :placeholder, :string, default: "Search..."
  attr :rest, :global

  def input(assigns) do
    ~H"""
    <!-- The compounds-input class is used by the ComCombo hook to fill in inputs -->
    <input
      class={
        Tails.classes([
          "compounds-input h-full flex-1 px-2 py-[0.7rem] outline-none placeholder-neutral-400"
        ])
      }
      placeholder={@placeholder}
      {@rest}
    />
    """
  end

  slot :inner_block
  attr :class, :string, default: nil
  attr :rest, :global

  def dropdown_icon(assigns) do
    ~H"""
    <!-- The dropdown-icon class is used by the ComCombo hook to transform the icon -->
    <button
      class={Tails.classes(["dropdown-icon transition ease-in-out duration-200 group", @class])}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </button>
    """
  end

  attr :options, :list, default: []
  attr :class, :string, default: nil
  attr :rest, :global

  def dropdown_menu(assigns) do
    ~H"""
    <ul class={Tails.classes(["dropdown-menu flex-col items-center justify-center
      hidden w-full rounded-md px-2 py-3 border border-neutral-400", @class])} {@rest}>
      <%= for option <- @options do %>
        <li
          aria-selected="false"
          class="aria-selected:bg-neutral-200 w-full p-2 rounded-md text-left cursor-pointer"
        >
          <%= option %>
        </li>
      <% end %>
    </ul>
    """
  end
end
