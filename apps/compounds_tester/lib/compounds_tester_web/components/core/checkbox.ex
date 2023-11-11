defmodule CompoundsTesterWeb.Core.Checkbox do
  @moduledoc """
    A simple checkbox component.
  """
  
  use Phoenix.Component
  alias Phoenix.LiveView.JS


  attr :checked, :boolean, default: false
  attr :class, :string

  def checkbox(assigns) do
    ~H"""
    <input class={@class} type="checkbox" checked={@checked} />
    """
  end
end
