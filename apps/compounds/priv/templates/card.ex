defmodule Compounds.Core.Card do
  @moduledoc """
    A simple card component.
  """
  
  use Phoenix.Component
  alias Phoenix.LiveView.JS


  attr :class_card, :string,
    default: """
    """
  attr :class_header, :string,
    default: """
    """
  attr :class_body, :string,
    default: """
    """
  attr :class_footer, :string,
    default: """
    """

  slot :header
  slot :body
  slot :footer

  def checkbox(assigns) do
    ~H"""
    <div class={@class_card}>
      <div class={@class_header}>
        <%= render_slot(@header) || "Card Header" %>
      </div>
      <div class={@class_body}>
        <%= render_slot(@body) || "Card body here" %>
      </div>
      <div class={@class_footer}>
        <%= render_slot(@footer) || "Card Footer" %>
      </div>
    <div>
    """
  end
end
