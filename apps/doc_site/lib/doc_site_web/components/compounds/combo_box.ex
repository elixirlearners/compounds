defmodule Compounds.ComboBox do
  use Phoenix.Component

  # 1.0 todos
  # TODO: Add "no result" text
  # TODO: disabled status
  # TODO: error status

  slot :inner_block
  attr :options, :list, default: []
  attr :selected, :string, default: nil
  attr :class, :string, default: nil
  attr :id, :string
  attr :rest, :global

  @spec combo_box(map()) :: Phoenix.LiveView.Rendered.t()

  def combo_box(assigns) do
    assigns = assign(assigns, id: assigns[:id] || Compounds.Id.generate("combo-box"))

    ~H"""
    <div
      class={
        Tails.classes([
          "flex flex-col space-y-3 w-fit h-fit relative",
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
          "flex items-center space-x-3 rounded-md px-3 w-64 text-sm
         transition duration-200 compounds-focus-outline",
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
          "compounds-input h-full w-full flex-1 py-[0.7rem] outline-none placeholder-neutral-400"
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
    <ul
      class={
        Tails.classes([
          "dropdown-menu absolute top-full z-10 bg-white flex-col items-center justify-center text-sm
      hidden w-64 rounded-md px-2 py-3 border border-neutral-400",
          @class
        ])
      }
      {@rest}
    >
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
