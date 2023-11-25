defmodule DocSiteWeb.DropdownExample do
  use DocSiteWeb, :live_component

  alias DocSiteWeb.CoreComponents

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{})}
  end

  def render(assigns) do
    ~H"""
    <Compounds.Dropdown.dropdown class="w-56" id="my-dropdown">
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
            <CoreComponents.icon name="hero-wrench-screwdriver" class="h-4 w-4" />
          </:icon>
          Admin Dashboard
        </Compounds.Dropdown.link_item>
        <Compounds.Dropdown.link_item href={~p"/"}>
          <:icon>
            <CoreComponents.icon name="hero-shopping-cart" class="h-4 w-4" />
          </:icon>
          My Orders
        </Compounds.Dropdown.link_item>
        <Compounds.Dropdown.link_item href={~p"/"}>
          <:icon>
            <CoreComponents.icon name="hero-cog-8-tooth" class="h-4 w-4" />
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
    """
  end
end
