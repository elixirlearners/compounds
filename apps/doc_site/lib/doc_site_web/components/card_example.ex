defmodule DocSiteWeb.CardExample do
  use DocSiteWeb, :live_component

  alias DocSiteWeb.CoreComponents

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{})}
  end

  def render(assigns) do
    ~H"""
    <Compounds.Card.card>
      <Compounds.Card.header>
        <Compounds.Card.title>
          Create Project
        </Compounds.Card.title>
        <Compounds.Card.description>
          Deploy your new project in one-click.
        </Compounds.Card.description>
      </Compounds.Card.header>
      <Compounds.Card.content class="flex flex-col space-y-4">
        <Compounds.Input.input class="w-full" placeholder="Your project's name">
          <:label_left>
            Name
          </:label_left>
        </Compounds.Input.input>
        <Compounds.Input.input placeholder="Your project's framework">
          <:label_right>
            Framework
          </:label_right>
        </Compounds.Input.input>
      </Compounds.Card.content>
      <Compounds.Card.footer>
        <div class="w-full flex justify-between">
          <Compounds.Button.button type="secondary">
            Cancel
          </Compounds.Button.button>
          <Compounds.Button.button>
            Deploy
          </Compounds.Button.button>
        </div>
      </Compounds.Card.footer>
    </Compounds.Card.card>
    """
  end
end
