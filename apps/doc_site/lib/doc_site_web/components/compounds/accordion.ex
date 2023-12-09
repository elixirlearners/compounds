defmodule Compounds.Accordion do
  @moduledoc """
    A simple Accordion  component.
  """

  use Phoenix.Component
  alias Phoenix.LiveView.JS

  attr :class, :string, default: nil
  attr :title, :string, required: true
  attr :shadow, :boolean, default: false
  attr :expanded?, :boolean, default: false
  attr :id, :string, default: Compounds.Id.generate("contents")
  slot :subtitle, required: false

  slot :contents, required: true do
    attr :id, :string, required: false
    attr :class, :string, required: false
  end

  def accordion(assigns) do
    assigns =
      assign(assigns,
        contents_id: Keyword.get(assigns.contents, :id, Compounds.Id.generate("contents")),
        default_classes:
          "pt-5 pb-5 m-0 " <>
            if assigns.shadow do
              "shadow-small border-0 rounded-theme p-gap"
            else
              "border border-solid border-border border-x-0 h-fit"
            end
      )

    ~H"""
    <div class={Tails.classes([@default_classes, @class])}>
      <div
        class="cursor-pointer outline-0"
        role="button"
        phx-click={
          JS.dispatch("flip", to: "#" <> @contents_id <> "-icon")
          |> JS.dispatch("expand", to: "#" <> @contents_id)
        }
      >
        <div class="flex justify-between items-center text-foreground">
          <h3 class="m-0 text-2xl font-bold select-none"><%= @title %></h3>
          <.accordion_icon contents_id={@contents_id} />
        </div>
        <%= if length(@subtitle) > 0 do %>
          <div class="m-0 text-accent_4"><%= render_slot(@subtitle) %></div>
        <% end %>
        <div
          id={@contents_id}
          phx-hook="Expand"
          data-compounds-animation-duration="300"
          data-compounds-animation-easing="easeInOut"
          data-compounds-animation-fill="forwards"
          class="max-h-0 pr-0 pl-0 leading-6 first:mt-0 last:mb-0 overflow-hidden"
        >
          <div>
            <%= render_slot(@contents) %>
          </div>
        </div>
      </div>
    </div>
    """
  end

  attr :contents_id, :string, required: true
  attr :class, :string, default: nil

  defp accordion_icon(assigns) do
    ~H"""
    <svg
      id={@contents_id <> "-icon"}
      phx-hook="Flip"
      data-compounds-animation-duration="200"
      data-compounds-animation-easing="easeInOut"
      data-compounds-animation-fill="forwards"
      class={Tails.classes(["w-6 h-6", @class])}
      viewBox="0 0 24 24"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
      fill="none"
      shapeRendering="geometricPrecision"
      style="color: currentColor;"
    >
      <path d="M6 9l6 6 6-6" />
    </svg>
    """
  end
end
