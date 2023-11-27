defmodule Compounds.Toggle do
  use Phoenix.Component
  alias Phoenix.LiveView.JS
  require Logger

  @moduledoc """
    A simple toggle component.
  """

  slot :inner_block
  attr :class, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :type, :string, default: "primary"
  attr :checked, :boolean, default: false
  attr :rest, :global

  @spec toggle(map()) :: Phoenix.LiveView.Rendered.t()
  def toggle(assigns) do
    assigns =
      assign(assigns,
        toggle_id: Compounds.Id.generate("toggle"),
        inner_id: Compounds.Id.generate("toggle-inner")
      )

    ~H"""
    <label class="
      inline-block align-middle whitespace-nowrap select-none relative
      h-3.5 w-7
      pt-[0.1875rem] pr-0 pb-[0.1875rem] pl-0 m-0
      ">
      <input
        class="overflow-hidden hidden h-0 w-0 opacity-0 absolute bg-transparent z-[-1]"
        type="checkbox"
        phx-click={JS.dispatch("toggle", to: "##{@toggle_id}")}
      />
      <div
        id={@toggle_id}
        phx-hook="Toggle"
        data-comp-type={@type}
        class="
          h-4 w-full
          rounded-[4rem]
          transition-[background,border] dely-[0.12s] duration-[0.2s] ease-out
          relative border border-solid border-transparent
          bg-accent_2
          p-0
        "
      >
        <span
          phx-mounted={if @checked, do: JS.dispatch("toggle", to: "##{@toggle_id}")}
          id={@inner_id}
          class="
            w-[calc(theme(fontSize.base)_-_2px)]
            h-[calc(theme(fontSize.base)_-_2px)]
            absolute top-1/2 translate-y-[-50%] left-px
            shadow-toggle
            transition-[left] duration-300 ease-out
            rounded-[50%]
            bg-background
            "
        />
      </div>
    </label>
    """
  end
end
