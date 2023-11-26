defmodule DocSiteWeb.ButtonExample do
  use DocSiteWeb, :live_component

  alias DocSiteWeb.CoreComponents

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{})}
  end

  def render(assigns) do
    ~H"""
    <div class="flex flex-row items-center space-x-4">
      <Compounds.Button.button type="primary">
        Primary
      </Compounds.Button.button>

      <Compounds.Button.button type="secondary">
        Secondary
      </Compounds.Button.button>

      <Compounds.Button.button type="tertiary">
        Tertiary
      </Compounds.Button.button>

      <Compounds.Button.button type="error">
        Error
      </Compounds.Button.button>

      <Compounds.Button.button type="warning">
        Warning
      </Compounds.Button.button>

      <Compounds.Button.button disabled>
        Disabled
      </Compounds.Button.button>

      <Compounds.Button.button disabled>
        <div class="flex flex-row justify-evenly items-center h-full">
          <Compounds.Spinner.spinner class="w-7 h-7" />
          <p>Loading</p>
        </div>
      </Compounds.Button.button>

      <Compounds.Button.button type="secondary" class="p-3">
        <CoreComponents.icon name="hero-archive-box" />
      </Compounds.Button.button>

      <Compounds.Button.button type="secondary" class="p-3">
        <CoreComponents.icon name="hero-adjustments-horizontal" />
      </Compounds.Button.button>
    </div>
    """
  end
end
