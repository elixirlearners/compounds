defmodule Compounds.Checkbox do
  use Phoenix.Component
  alias Phoenix.LiveView.JS

  @doc """
    A simple checkbox component.

    # Attributes:
    * `checked` - A boolean that determines whether the checkbox is checked or not. 
    * `custom_style` - A TailwindCSS class string, this will be merged with the default class string. 

    # Example:
    ```
    <.checkbox checked={true} class="rounded-md w-8 h-8 border-4 border-green-600" />
    ```

  """

  attr :checked, :boolean, default: false
  attr :custom_style, :string, default: nil

  def checkbox(assigns) do
    assigns = assign(assigns, style: "rounded border border-slate-300")

    ~H"""
    <input class={Tails.classes([@style, @custom_style])} type="checkbox" checked={@checked} />
    """
  end
end
