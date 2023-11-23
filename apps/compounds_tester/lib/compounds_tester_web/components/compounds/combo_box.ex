defmodule Compounds.ComboBox do
  use Phoenix.Component
  # TODO: set enter on dropdown not opened to be a no op
  # TODO: fix clicking on dropdown icon not focusing input
  # TODO: close the dropdown on click away
  # TODO: close the dropdown on escape key
  # TODO: focus input when dropdown icon is clicked
  # TODO: clear button
  # TODO: final visual cleanup

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
      <!-- Input wrapper -->
      <%= render_slot(@inner_block) %>
      <!-- Dropdown Menu -->
      <ul
        id={Compounds.Id.generate("dropdown-menu")}
        class="dropdown-menu flex-col items-center justify-center hidden w-full
        rounded-md px-2 py-3 border border-neutral-400"
      >
        <%= for option <- @options do %>
          <li
            aria-selected="false"
            class="aria-selected:bg-neutral-200 w-full px-3 py-2 rounded-md text-left cursor-pointer"
          >
            <%= option %>
          </li>
        <% end %>
      </ul>
    </div>
    """
  end

  slot :inner_block
  attr :class, :string, default: nil
  attr :rest, :global

  def input_wrapper(assigns) do
    ~H"""
    <!-- Input Wrapper -->
    <div class={
      Tails.classes([
        "flex items-center space-x-4 rounded-md px-5 py-3 border
         border-neutral-400 focus-within:ring-4 focus-within:ring-neutral-300",
        @class
      ])
    }>
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
      class={Tails.classes(["compounds-input flex-1 px-2 outline-none  placeholder-neutral-400"])}
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
    <div class={
      Tails.classes(["dropdown-icon transition-transform duration-200 ease-in-out", @class])
    }>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
