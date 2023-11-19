defmodule CompoundsTesterWeb.Home do
  use Phoenix.LiveView

  use Phoenix.VerifiedRoutes,
    router: CompoundsTesterWeb.Router,
    endpoint: CompoundsTesterWeb.Endpoint

  @moduledoc """
  The main page of the application, used to display all components in one showcase.
  """

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{})}
  end

  def render(assigns) do
    ~H"""
    <div class="grid grid-cols-6 gap-y-12 p-16 h-full w-full gap-10">
      <div class="grid grid-cols-2 col-span-6 gap-4">
        <Compounds.Accordion.accordion shadow={true} title="Card Accordion">
          <:contents>
            Contents go here
          </:contents>
        </Compounds.Accordion.accordion>
        <Compounds.Accordion.accordion title="The Accordion">
          <:contents>
            Contents go here
          </:contents>
        </Compounds.Accordion.accordion>
        <Compounds.Accordion.accordion title="The Accordion">
          <:subtitle>I'm a subtitle</:subtitle>
          <:contents>
            Contents go here
          </:contents>
        </Compounds.Accordion.accordion>
      </div>
      <div class="col-span-6">
        <Compounds.Accordion.accordion title="Inputs">
          <:contents>
            <div class="grid grid-cols-3 gap-4 ">
              <Compounds.Input.input>
                <:input_block_label>
                  I'm a block label!
                </:input_block_label>
              </Compounds.Input.input>
              <Compounds.Input.input clearable?={true}>
                <:input_block_label>
                  I'm clearable
                </:input_block_label>
              </Compounds.Input.input>
              <Compounds.Input.input>
                <:label_right>
                  Label Right
                </:label_right>
              </Compounds.Input.input>
              <Compounds.Input.input>
                <:label_left>
                  Label Left
                </:label_left>
              </Compounds.Input.input>
              <Compounds.Input.input>
                <:label_left>
                  Label Left
                </:label_left>
                <:label_right>
                  Label Right
                </:label_right>
              </Compounds.Input.input>
              <Compounds.Input.input disabled?={true}>
                <:label_left>
                  I'm Disabled
                </:label_left>
              </Compounds.Input.input>
              <Compounds.Input.input read_only?={true} placeholder="Cant edit me!">
                <:label_left>
                  I'm read only
                </:label_left>
              </Compounds.Input.input>
              <Compounds.Input.input placeholder="Icon left">
                <:icon_left>
                  <CompoundsTesterWeb.CoreComponents.icon name="hero-folder" />
                </:icon_left>
              </Compounds.Input.input>
              <Compounds.Input.input placeholder="Icon right">
                <:icon_right>
                  <CompoundsTesterWeb.CoreComponents.icon name="hero-folder" />
                </:icon_right>
              </Compounds.Input.input>
              <Compounds.Input.input placeholder="Icon right">
                <:icon_right>
                  <CompoundsTesterWeb.CoreComponents.icon name="hero-folder" />
                </:icon_right>
                <:label_left>
                  Label left
                </:label_left>
              </Compounds.Input.input>
              <Compounds.Input.input placeholder="Icon right">
                <:icon_right>
                  <CompoundsTesterWeb.CoreComponents.icon name="hero-folder" />
                </:icon_right>
                <:label_right>
                  Label right
                </:label_right>
              </Compounds.Input.input>
              <Compounds.Input.input placeholder="Icon left">
                <:icon_left>
                  <CompoundsTesterWeb.CoreComponents.icon name="hero-folder" />
                </:icon_left>
                <:label_left>
                  Label left
                </:label_left>
              </Compounds.Input.input>
            </div>
          </:contents>
        </Compounds.Accordion.accordion>
      </div>
      <div class="col-span-6">
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
              <Compounds.Button.button type="secondary">
                Cancel
              </Compounds.Button.button>
              <Compounds.Button.button></Compounds.Button.button>
              <Compounds.Button.button>
                Deploy
              </Compounds.Button.button>
            </div>
          </Compounds.Card.footer>
        </Compounds.Card.card>
      </div>

      <div class="w-96">
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
      <div class="flex flex-end justify-center items-center space-x-4">
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
          <div class="flex flex-row justify-evenly items-center">
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

      <div class="grid grid-cols-3 grid-rows-2 gap-4">
        <Compounds.Spinner.spinner />
        <Compounds.Spinner.spinner color="#0a0a0a" opacity_start="0.8" opacity_end="0" />
        <Compounds.Spinner.spinner blade_width="8%" blade_height="20%" />
        <Compounds.Spinner.spinner blade_round="0px" blade_width="5%" blade_height="20%" />
        <Compounds.Spinner.spinner
          blade_round="20px"
          blade_width="8%"
          blade_height="30%"
          opacity_start="1"
          opacity_end="0"
        />
        <Compounds.Spinner.spinner
          blade_round="10px"
          blade_width="5%"
          blade_height="25%"
          opacity_start="1"
          opacity_end="0"
        />
      </div>
    </div>
    """
  end

  def handle_event() do
  end
end
