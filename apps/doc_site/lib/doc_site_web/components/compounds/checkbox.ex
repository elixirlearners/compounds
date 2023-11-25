defmodule Compounds.Checkbox do
  use Phoenix.Component

  @doc """
    A simple checkbox component.

    # Attributes:
    * `checked` - A boolean that determines whether the checkbox is checked or not.
    * `class` - A TailwindCSS class string, this will be merged with the default class string.

    # Example:
    ```
    <.checkbox checked={true} class="rounded-md w-8 h-8 border-4 border-green-600" />
    ```

  """

  attr :checked, :boolean, default: false
  attr :class, :string, default: nil

  def checkbox(assigns) do
    ~H"""
    <input
      class={Tails.classes(["rounded border border-slate-300", @custom_style])}
      type="checkbox"
      checked={@checked}
    />
    """
  end
end
