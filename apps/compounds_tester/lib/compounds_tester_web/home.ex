defmodule CompoundsTesterWeb.Home do
  @moduledoc """
  The main page of the application, used to display all components in one showcase.
  """

  use Phoenix.LiveView
  import CompoundsTesterWeb.Core.Checkbox

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{})}
  end

  def render(assigns) do
    style_a = """
      .checkbox_a {
        height: 2rem;
        width: 2rem;
        border: 4px solid blue; 
        border-radius: 8px
      }
    """

    style_b = """
      .checkbox_b {
        height: 2rem;
        width: 2rem;
        border: 4px solid red; 
        border-radius: 8px
      }
    """

    ~H"""
    <div class="grid grid-cols-6 gap-y-12 p-16 h-full w-full">
      <!-- Tailwind -->
      <.checkbox style={style_a} class="checkbox_a" />
      <!-- Because there are no component level style scoping in Phoenix LiveView
        we have to give it a different class -->
      <.checkbox style={style_b} class="checkbox_b" />
      <!-- When using tailwind, we override the default css by setting style to ""-->
      <.checkbox style="" class="rounded-md w-8 h-8 border-4 border-green-600" />
    </div>
    """
  end

  def handle_event() do
  end
end
