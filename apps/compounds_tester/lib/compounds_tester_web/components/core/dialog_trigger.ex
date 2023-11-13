defmodule CompoundsTesterWeb.Core.DialogTrigger do
  use Phoenix.Component
  alias Phoenix.LiveView.JS


  @doc """
    A DialogTrigger is wrapper around a `Diaglog` and a `Trigger`.
    The `Trigger` is an element that is clicked to activates the Dialog.
    The `Dialog` is a window containing some information and/or actions. 

    # Slots:
    * `trigger` - The trigger that will activate the dialog.
    * `dialog` - The dialog that will be activated by the trigger.

    # Attributes:
    * `class` - A TailwindCSS class string, this will be merged with the default class string.
`   * TODO: target_anchor, position, offset, flipping?, min_padding, click_out
  """

  slot :trigger, required: true
  slot :dialog, required: true

  def popover(assigns) do
    ~H"""
      <div>
        <%= render_slot(@trigger) %>
      </div>
    """
  end

end
