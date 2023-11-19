defmodule CompoundsTesterWeb.Home do
  use CompoundsTesterWeb, :live_view

  @moduledoc """
  The main page of the application, used to display all components in one showcase.
  """

  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{})}
  end

  def render(assigns) do
    ~H"""
    <div class="p-16 h-full w-full flex flex-col items-center space-y-16">
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
              <button class="bg-white border border-neutral-200 rounded-md px-3 py-2 hover:bg-neutral-200 transition ease-out duration-200 font-medium">
                Cancel
              </button>
              <button class="bg-black rounded-md px-3 py-2 hover:bg-neutral-700 transition ease-out duration-200 text-white font-medium">
                Deploy
              </button>
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
