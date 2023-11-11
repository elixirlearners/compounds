defmodule CompoundsTesterWeb.Core.Checkbox do
  @moduledoc """
    A simple checkbox component.
  """
  
  use Phoenix.Component
  alias Phoenix.LiveView.JS

  attr :checked, :boolean, default: false
  attr :class, :string, default: nil

  def checkbox(assigns) do
    assigns = assign(assigns, style: "border-2 border-slate-200")

    ~H"""
    <input class={Tails.classes([@style, @class])} type="checkbox" checked={@checked} />
    """
  end
end
