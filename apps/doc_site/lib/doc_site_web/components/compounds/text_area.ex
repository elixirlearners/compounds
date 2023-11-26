defmodule Compounds.TextArea do
  use Phoenix.Component
  alias DocSiteWeb.CoreComponents

  # 1.0 todos
  # TODO: extract error related elements into a separate components
  # This is so users can customize pass in a custom error component, with custom styles.
  # TODO: use phx-hook to give text_areas a different ring-color when focused with a keyboard

  attr :class, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :error, :string, default: nil
  attr :id, :string
  attr :rest, :global

  def text_area(assigns) do
    assigns =
      assign(
        assigns,
        :default_class,
        Tails.classes([
          "compounds-focus-outline w-[80rem] h-36 rounded-md border
          border-neutral-200 transition ease-out duration-150 resize-none
          focus:border-neutral-600 focus:ring focus:ring-neutral-300 p-4 placeholder-neutral-400",
          status_classes(assigns.disabled, assigns.error)
        ])
      )

    assigns = assign(assigns, id: assigns[:id] || Compounds.Id.generate("text-area"))

    ~H"""
    <div class="flex flex-col space-y-2">
      <textarea
        class={Tails.classes([@default_class, @class])}
        disabled={@disabled}
        error={not is_nil(@error)}
        phx-hook="ComTextArea"
        id={@id}
        {@rest}
      />
      <%= if @error do %>
        <div class="flex flex-row space-x-2 items-center">
          <CoreComponents.icon name="hero-exclamation-circle" class="bg-error" />
          <!-- Temporarily using <p> for now because the Text component was adding a mx-4 that I couldn't override -->
          <p class="text-error front-normal tracking-[-0.005625em] font-sans my-0 text-base leading-[1.625em]">
            <%= @error %>
          </p>
        </div>
      <% end %>
    </div>
    """
  end

  defp status_classes(disabled, error) do
    " #{disabled_classes(disabled)} #{error_classes(error)}"
  end

  defp disabled_classes(true = _disabled), do: "cursor-not-allowed"
  defp disabled_classes(false = _disabled), do: ""

  defp error_classes(error) when not is_nil(error), do: "ring-red-100 ring border-red-600"
  defp error_classes(_error), do: ""
end
