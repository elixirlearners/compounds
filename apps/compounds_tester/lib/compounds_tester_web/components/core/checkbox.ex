defmodule CompoundsTesterWeb.Core.Checkbox do
  use Phoenix.Component
  alias Phoenix.LiveView.JS

  attr :style, :string,
    default: """
      .checkbox {
        height: 1rem;
        width: 1rem;
        border: 1px solid #000; 
        border-radius: 4px
      }
    """

  attr :checked, :boolean, default: false
  attr :class, :string, default: "checkbox"

  def checkbox(assigns) do
    ~H"""
    <style>
      <%= @style %>
    </style>
    <input class={@class} type="checkbox" checked={@checked} />
    """
  end
end
