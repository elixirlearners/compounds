defmodule CompoundsTesterWeb.Home do
  use Phoenix.LiveView

  use Phoenix.VerifiedRoutes,
    router: CompoundsTesterWeb.Router,
    endpoint: CompoundsTesterWeb.Endpoint

  @moduledoc """
  The main page of the application, used to display all components in one showcase.
  """

  # TODO: scale component default size down

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{})}
  end

  @spec render(any()) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~H"""
    <div class="p-16 h-full w-full flex flex-col items-center space-y-16">
      <div class="w-[50rem] h-[18rem]">
        <Compounds.ComboBox.combo_box>
          <Compounds.ComboBox.input_wrapper>
            <CompoundsTesterWeb.CoreComponents.icon
              name="hero-magnifying-glass"
              class="h-5 w-5 bg-neutral-500"
            />
            <Compounds.ComboBox.input />
            <Compounds.ComboBox.dropdown_icon>
              <CompoundsTesterWeb.CoreComponents.icon
                name="hero-chevron-down"
                class="h-5 w-5 bg-neutral-500 cursor-pointer group-hover:bg-black transition ease-out duration-200"
              />
            </Compounds.ComboBox.dropdown_icon>
          </Compounds.ComboBox.input_wrapper>
          <Compounds.ComboBox.dropdown_menu options={["React", "Next.JS", "Remix", "Phoenix"]} />
        </Compounds.ComboBox.combo_box>
      </div>

      <div class="w-56">
        <Compounds.Dropdown.dropdown id="my-dropdown">
          <:trigger>
            Open
          </:trigger>
          <Compounds.Dropdown.item_group>
            <Compounds.Dropdown.item>
              Logged in as <br />
              <span class="font-bold">
                root@localhost
              </span>
            </Compounds.Dropdown.item>
          </Compounds.Dropdown.item_group>
          <Compounds.Dropdown.item_group>
            <Compounds.Dropdown.link_item href={~p"/"}>
              <:icon>
                <CompoundsTesterWeb.CoreComponents.icon
                  name="hero-wrench-screwdriver"
                  class="h-4 w-4"
                />
              </:icon>
              Admin Dashboard
            </Compounds.Dropdown.link_item>
            <Compounds.Dropdown.link_item href={~p"/"}>
              <:icon>
                <CompoundsTesterWeb.CoreComponents.icon name="hero-shopping-cart" class="h-4 w-4" />
              </:icon>
              My Orders
            </Compounds.Dropdown.link_item>
            <Compounds.Dropdown.link_item href={~p"/"}>
              <:icon>
                <CompoundsTesterWeb.CoreComponents.icon name="hero-cog-8-tooth" class="h-4 w-4" />
              </:icon>
              Settings
            </Compounds.Dropdown.link_item>
          </Compounds.Dropdown.item_group>
          <Compounds.Dropdown.item_group>
            <Compounds.Dropdown.link_item href={~p"/"}>
              Log out
            </Compounds.Dropdown.link_item>
          </Compounds.Dropdown.item_group>
        </Compounds.Dropdown.dropdown>
      </div>

      <div>
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
              <!--Compounds.Button.button>
                Cancel
              </Compounds.Button.button>
              <Compounds.Button.button>
                Deploy
              </Compounds.Button.button-->
            </div>
          </Compounds.Card.footer>
        </Compounds.Card.card>
      </div>

      <div class="w-56">
        <Compounds.Tabs.tabs active_key="1">
          <Compounds.Tabs.tabs_header>
            <Compounds.Tabs.tab key="1">
              <Compounds.Icon.icon src="/images/logo.svg" />
              <p>Tab 1</p>
            </Compounds.Tabs.tab>
            <Compounds.Tabs.tab key="2" disabled={true}>
              Tab 2
            </Compounds.Tabs.tab>
            <Compounds.Tabs.tab key="3">
              Tab 3
            </Compounds.Tabs.tab>
          </Compounds.Tabs.tabs_header>
          <Compounds.Tabs.tabs_content>
            <Compounds.Tabs.content key="1">
              Tab 1 content
            </Compounds.Tabs.content>
            <Compounds.Tabs.content key="2">
              Tab 2 content
            </Compounds.Tabs.content>
            <Compounds.Tabs.content key="3">
              Tab 3 content
            </Compounds.Tabs.content>
          </Compounds.Tabs.tabs_content>
        </Compounds.Tabs.tabs>
      </div>
    </div>
    """
  end

  def handle_event() do
  end
end
