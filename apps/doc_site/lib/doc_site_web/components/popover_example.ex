defmodule DocSiteWeb.PopoverExample do
  use DocSiteWeb, :live_component

  alias DocSiteWeb.CoreComponents

  # TODO: make inputs line up

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{})}
  end

  def render(assigns) do
    ~H"""
    <div class="flex justify-center w-full">
      <Compounds.Popover.popover>
        <Compounds.Popover.trigger>
          Open Popover
        </Compounds.Popover.trigger>
        <Compounds.Popover.content class="w-96">
          <div class="mb-4">
            <h4 class="text-base font-medium text-black mb-1">
              Dimensions
            </h4>
            <p class="text-sm text-neutral-500">
              Set the dimensions for the layer.
            </p>
          </div>
          <div class="flex flex-col justify-center space-y-2 w-full">
            <Compounds.Input.input class="w-full" placeholder="100%">
              <:label_left>
                Width
              </:label_left>
            </Compounds.Input.input>

            <Compounds.Input.input class="w-full" placeholder="300px">
              <:label_right>
                Max. width
              </:label_right>
            </Compounds.Input.input>

            <Compounds.Input.input class="w-full" placeholder="25px">
              <:label_left>
                Height
              </:label_left>
            </Compounds.Input.input>
            <Compounds.Input.input class="w-full" placeholder="none">
              <:label_right>
                Max. height
              </:label_right>
            </Compounds.Input.input>
          </div>
        </Compounds.Popover.content>
      </Compounds.Popover.popover>
    </div>
    """
  end
end
