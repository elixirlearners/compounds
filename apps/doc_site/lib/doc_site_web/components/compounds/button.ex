defmodule Compounds.Button do
  use Phoenix.Component
  require Logger

  @moduledoc """
    A simple button component.
  """

  slot :inner_block
  attr :class, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :type, :string, default: "primary"
  attr :rest, :global

  @spec button(map()) :: Phoenix.LiveView.Rendered.t()
  def button(assigns) do
    assigns = assign(assigns, :default_class, type_to_style(assigns.type))

    ~H"""
    <button class={Tails.classes([@default_class, @class])} disabled={@disabled} {@rest}>
      <%= render_slot(@inner_block) %>
    </button>
    """
  end

  defp type_to_style(type) do
    case type do
      "primary" ->
        "bg-black rounded-md px-4 py-2 hover:bg-neutral-700 transition ease-out duration-200 text-white font-medium"

      "secondary" ->
        "bg-white border border-neutral-200 rounded-md px-4 py-2 hover:bg-neutral-200 transition ease-out duration-200 font-medium"

      "tertiary" ->
        "bg-white rounded-md px-4 py-2 hover:bg-neutral-200 transition ease-out duration-200 font-medium"

      "error" ->
        "bg-red-600 rounded-md px-4 py-2  hover:brightness-75 transition ease-out duration-200 text-white font-medium"

      "warning" ->
        "bg-amber-500 rounded-md px-4 py-2 hover:brightness-75 transition ease-out duration-200 text-black font-medium"

      _ ->
        Logger.warning(
          "Invalid button type: #{type}. Warning in #{__ENV__.module} at line #{__ENV__.line}"
        )

        "bg-black rounded-md px-3 px-4 py-2 hover:bg-neutral-700 transition ease-out duration-200 text-white font-medium"
    end <>
      " disabled:bg-neutral-100 disabled:border disabled:border-neutral-200 disabled:text-neutral-500 disabled:cursor-not-allowed"
  end
end
