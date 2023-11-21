defmodule Compounds.Accordion do
  @moduledoc """
    A simple Accordion  component.
  """

  use Phoenix.Component
  alias Phoenix.LiveView.JS

  attr :class, :string, default: ""
  attr :title, :string, default: "Title"
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
        default_classes: """
        border border-solid border-border border-x-0
        """
      )

    ~H"""
    <div class={Tails.classes([@default_classes, @class])}>
      <div class="cursor-pointer outline-0" role="button">
        <div class="flex justify-between items-center text-foreground">
          <h3 class="m-0 text-2xl font-bold"><%= @title %></h3>
          <.accordion_icon contents_id={@contents_id} />
        </div>
        <%= if length(@subtitle) > 0 do %>
          <div class="m-0 text-accent_4"><%= render_slot(@subtitle) %></div>
        <% end %>
        <div
          id={@contents_id}
          class="pt-5 pr-0 pb-5 pl-0 leading-6 first:mt-0 last:mb-0 overflow-hidden"
          hidden
        >
          <%= render_slot(@contents) %>
        </div>
      </div>
    </div>
    """
  end

  attr :contents_id, :string, required: true

  defp accordion_icon(assigns) do
    ~H"""
    <svg
      phx-click={
        JS.transition({"ease duration-200", "rotate-0", "rotate-180"})
        |> JS.toggle(
          in: {"ease delay-200", "h-0", "h-auto"},
          out: {"ease delay-200", "h-auto", "h-0"},
          to: "#" <> @contents_id
        )
      }
      class="w-6 h-6"
      viewBox="0 0 24 24"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
      fill="none"
      shapeRendering="geometricPrecision"
    >
      <path d="M6 9l6 6 6-6" />
    </svg>
    """
  end
end
