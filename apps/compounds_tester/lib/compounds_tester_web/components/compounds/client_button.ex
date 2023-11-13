defmodule Compounds.ClientButton do
  use Phoenix.Component
  alias Phoenix.LiveView.JS

  @doc """
  """

  # TODO how do you make this open a modal client side with JS on click?
  def client_button(assigns) do
    ~H"""
    <button class="p-2 bg-slate-900">
      Click Me!
    </button>
    """
  end
end
