defmodule Compounds.ModalButton do
  use Phoenix.Component
  alias Phoenix.LiveView.JS

  @doc """
  """

  def modal_button(assigns) do
    ~H"""
    <div class="p-2 bg-slate-900 text-white rounded-md w-fit h-fit relative">
      <button phx-click={toggle_modal()}>
        Click Me!
      </button>
      <div
        id="modal"
        phx-click-away={toggle_modal()}
        class="absolute bottom-0 left-full transform translate-y-1/2  w-96 h-56 bg-slate-100 rounded-md hidden"
      >
      </div>
    </div>
    """
  end

  def toggle_modal(js \\ %JS{}) do
    js
    |> JS.toggle(
      to: "#modal",
      in: {"ease-in duration-100", "opacity-0", "opacity-100"},
      out: {"ease-in duration-75", "opacity-75", "opacity-0"}
    )
  end
end
