defmodule Compounds.Text do
  use Phoenix.Component
  use Phoenix.HTML
  require Logger

  @moduledoc """
  Typographic component that wraps the built in typographic styles for the theme.
  """

  slot :inner_block
  attr :class, :string, default: nil
  attr :type, :string, default: "primary"
  attr :tag, :string, default: "span"
  attr :small, :boolean, required: false
  attr :font, :string, default: "1rem"
  attr :scale, :integer, default: 1
  attr :bold, :boolean, default: false
  attr :italic, :boolean, default: false
  attr :rest, :global

  @spec text(map()) :: Phoenix.LiveView.Rendered.t()
  def text(assigns) do
    assigns = assign(assigns, :default_class, "")

    ~H"""
    <%= raw(build_element(assigns)) %>
    """
  end

  def small(assigns) do
    text(Map.put(assigns, :tag, "small"))
  end

  def p(assigns) do
    text(Map.put(assigns, :tag, "p"))
  end

  def h1(assigns) do
    text(Map.put(assigns, :tag, "h1"))
  end

  def h2(assigns) do
    text(Map.put(assigns, :tag, "h2"))
  end

  def h3(assigns) do
    text(Map.put(assigns, :tag, "h3"))
  end

  def h4(assigns) do
    text(Map.put(assigns, :tag, "h4"))
  end

  def h5(assigns) do
    text(Map.put(assigns, :tag, "h5"))
  end

  def h6(assigns) do
    text(Map.put(assigns, :tag, "h6"))
  end

  def q(assigns) do
    text(Map.put(assigns, :tag, "q"))
  end

  def ol(assigns) do
    text(Map.put(assigns, :tag, "ol"))
  end

  def ul(assigns) do
    text(Map.put(assigns, :tag, "ul"))
  end

  def li(assigns) do
    text(Map.put(assigns, :tag, "li"))
  end

  def code(assigns) do
    text(Map.put(assigns, :tag, "code"))
  end

  def pre(assigns) do
    text(Map.put(assigns, :tag, "pre"))
  end

  def pre(assigns) do
    text(Map.put(assigns, :tag, "pre"))
  end

  def details(assigns) do
    text(Map.put(assigns, :tag, "details"))
  end

  def summary(assigns) do
    text(Map.put(assigns, :tag, "summary"))
  end

  def span(assigns) do
    text(Map.put(assigns, :tag, "span"))
  end

  defp build_element(assigns) do
    Phoenix.LiveViewTest.rendered_to_string(~H"""
    <%= render_slot(assigns.inner_block) %>
    """)
    |> get_tag(assigns)
  end

  defp get_tag(element, assigns) do
    tag = tag_as_string(assigns.tag)
    class = type_to_style(assigns.type) <> Tails.classes([assigns.class, tag_class(tag)])
    element = get_weights(element, assigns)
    "<#{tag} class=\"#{class}\">#{element}</#{tag}>"
  end

  defp get_weights(element, assigns) do
    element
    |> bold(assigns.bold)
    |> italic(assigns.italic)
  end

  defp bold(element, bold) when bold do
    "<b class=\"front-semibold\">#{element}</b>"
  end

  defp bold(element, _bold), do: element

  defp italic(element, italic) when italic do
    "<i class=\"italic\">#{element}</i>"
  end

  defp italic(element, _italic), do: element

  defp type_to_style(type) do
    case type do
      "primary" ->
        "text-accent_8 "

      "secondary" ->
        "text-accent_6 "

      "tertiary" ->
        "text-accent_4 "

      "error" ->
        "text-error "

      "warning" ->
        "text-warning "

      "success" ->
        "text-success "

      _ ->
        ""
    end
  end

  defp tag_class("small") do
    "front-normal tracking-[-0.005625em] font-sans m-0 leading-6 text-small"
  end

  defp tag_class("p") do
    "front-normal tracking-[-0.005625em] font-sans mx-4 my-0 text-base leading-[1.625em]"
  end

  defp tag_class("h1") do
    "text-[inherit] m-0 mb-[0.7rem] text-5xl tracking-tight leading-6 font-bold"
  end

  defp tag_class("h2") do
    "text-[inherit] m-0 mb-[0.7rem] text-4xl tracking-tight font-semibold"
  end

  defp tag_class("h3") do
    "text-[inherit] m-0 mb-[0.7rem] text-2xl tracking-tight font-semibold"
  end

  defp tag_class("h4") do
    "text-[inherit] m-0 mb-[0.7rem] text-lg tracking-tight font-semibold"
  end

  defp tag_class("h5") do
    "text-[inherit] m-0 mb-[0.7rem] text-base tracking-[-0.01em] font-semibold"
  end

  defp tag_class("h6") do
    "text-[inherit] m-0 mb-[0.7rem] text-sm tracking-[-0.005em] font-semibold"
  end

  defp tag_class("q") do
    """
    p-[calc(0.667_*_theme(spacing.gap))_theme(spacing.gap)]
    text-accent_5 bg-accent_1 rounded-theme mx-0 my-6 border border-solid border-border first:mt-0 last:mb-0
    before:content-none after:content-none
    """
  end

  defp tag_class("ol") do
    "p-0 m-gap_half ml-gap text-foreground list-decimal"
  end

  defp tag_class("ul") do
    """
    p-0 list-none m-gap_half ml-gap text-foreground
    [&>li]:before:content-['-']
    [&>li]:before:inline-block
    [&>li]:before:text-accent_4
    [&>li]:before:absolute
    [&>li]:before:ml-[-0.9375em]
    """
  end

  defp tag_class("li") do
    "mb-2.5 text-base leading-6"
  end

  defp tag_class("code") do
    """
    text-code font-mono text-[0.9em] whitespace-pre-wrap
    before:content-['\`'] after:content-['\`']
    """
  end

  defp tag_class("pre") do
    """
    px-[calc(theme(spacing.gap)_*_0.9)] py-gap
    mx-0 my-gap
    border border-solid border-accent_2 rounded-theme
    font-mono whitespace-pre overflow-auto leading-6 text-left text-sm
    [&>code]:text-foreground
    [&>code]:text-base
    [&>code]:leading-6
    [&>code]:whitespace-pre
    [&>code]:before:display-none
    [&>code]:after:display-none
    """
  end

  defp tag_class("details") do
    """
      p-[calc(0.667_*_theme(spacing.gap))_theme(spacing.gap)]
      mx-0 my-6
      rounded-theme border border-solid border-border pl-gap bg-accent_1
      focus:outline-none hover:outline-none active:outline-none
    """
  end

  defp tag_class("summary") do
    "bg-cursor-pointer select-none outline-none"
  end

  defp tag_class("span") do
    "text-inherit text-[inherit] font-[inherit]"
  end

  defp tag_class(_), do: ""

  defp tag_as_string(tag) do
    supported_tags = [
      "small",
      "p",
      "h1",
      "h2",
      "h3",
      "h4",
      "h5",
      "h6",
      "q",
      "ol",
      "ul",
      "li",
      "code",
      "pre",
      "details",
      "summary"
    ]

    if Enum.member?(supported_tags, tag) do
      tag
    else
      "span"
    end
  end
end
