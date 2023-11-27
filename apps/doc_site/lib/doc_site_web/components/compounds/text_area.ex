defmodule Compounds.TextArea do
  use Phoenix.Component

  attr :class, :string, default: nil
  attr :rest, :global

  def text_area(assigns) do
    ~H"""
    <textarea class={Tails.classes(["", @class])}></textarea>
    """
  end
end
