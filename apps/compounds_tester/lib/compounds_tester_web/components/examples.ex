defmodule CompoundsTesterWeb.Examples do
  @moduledoc """
    Contains our various past experiments to be used as a reference for future development.
    These experiments are stored as Phoenix components.
    To see the examples in action, import this module in `home.ex` and use the component in the render function.
  """

  use Phoenix.Component
  alias Phoenix.LiveView.JS
  import CompoundsTesterWeb.Core.Checkbox



  @doc """
    An example of how we can pass in CSS as a String attribute.
    TailwindCSS also works with this approach
  """
  def style_api(assigns) do
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
      <!-- We can pass in CSS as a String attribute -->
      <.checkbox style={style_a} class="checkbox_a" />
      <!-- Because there are no component level style scoping in Phoenix LiveView
        we have to give it a different class -->
      <.checkbox style={style_b} class="checkbox_b" />
      <!-- When using tailwind, we override the default css by setting style to ""-->
      <.checkbox style="" class="rounded-md w-8 h-8 border-4 border-green-600" />
    """

  end 




end