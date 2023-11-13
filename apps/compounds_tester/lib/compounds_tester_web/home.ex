defmodule CompoundsTesterWeb.Home do
  use CompoundsTesterWeb, :live_view

  @moduledoc """
  The main page of the application, used to display all components in one showcase.
  """

  use Phoenix.LiveView
  import Compounds.Tabs

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{})}
  end

  def render(assigns) do
    ~H"""
    <div class="grid grid-cols-6 gap-y-12 p-16 h-full w-full gap-10">
      <div class="col-span-6">
        <Compounds.Dropdown.dropdown id="my-dropdown">
          <:trigger></:trigger>
          Open
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

      <div class="col-span-2">
        <.tabs active_id="1">
          <.tabs_header>
            <.tab id="1">
              <Compounds.Icon.icon src="/images/logo.svg" />
              <p>Tab 1</p>
            </.tab>
            <.tab id="2" disabled={true}>
              Tab 2
            </.tab>
            <.tab id="3">
              Tab 3
            </.tab>
            <.tab id="4">
              Tab 4
            </.tab>
            <.tab id="5">
              Tab 5
            </.tab>
            <.tab id="6">
              Tab 6
            </.tab>
          </.tabs_header>

          <.tabs_content>
            <.content id="1">
              Tab 1 content
            </.content>
            <.content id="2">
              Tab 2 content
            </.content>
            <.content id="3">
              Tab 3 content
            </.content>
            <.content id="4">
              Tab 4 content
            </.content>
            <.content id="5">
              Tab 5 content
            </.content>
            <.content id="6">
              Tab 6 content
            </.content>
          </.tabs_content>
        </.tabs>
      </div>
    </div>
    """
  end

  def handle_event() do
  end
end
