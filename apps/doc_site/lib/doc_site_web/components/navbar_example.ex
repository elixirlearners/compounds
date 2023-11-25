defmodule DocSiteWeb.NavbarExample do
  use DocSiteWeb, :live_component

  alias DocSiteWeb.CoreComponents

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{})}
  end

  def render(assigns) do
    ~H"""
    <Compounds.Navbar.navbar>
      <:left>
        <.link class="flex items-center">
          <Compounds.Icon.icon src="/images/logo.svg" class="w-6" />
          <span class="font-medium ml-3 text-md tracking-tight sm:inline-flex hidden">Compounds</span>
        </.link>
      </:left>
      <:middle>
        <Compounds.Input.input placeholder="Search">
          <:icon_left>
            <CoreComponents.icon name="hero-magnifying-glass" />
          </:icon_left>
        </Compounds.Input.input>
      </:middle>

      <:right>
        <Compounds.Navbar.menu id="nav_menu">
          <:item>
            <.link class="p-2 text-sm hover:bg-gray-100 rounded-lg ease-in-out duration-200">
              Home
            </.link>
          </:item>
          <:item>
            <.link class="p-2 text-sm hover:bg-gray-100 rounded-lg ease-in-out duration-200">
              Deploy
            </.link>
          </:item>
          <:item>
            <.link class="p-2 text-sm hover:bg-gray-100 rounded-lg ease-in-out duration-200">
              Work
            </.link>
          </:item>
          <:item>
            <.link class="p-2 text-sm hover:bg-gray-100 rounded-lg ease-in-out duration-200">
              About
            </.link>
          </:item>
        </Compounds.Navbar.menu>

        <Compounds.Navbar.menu_trigger target_id="nav_menu">
          <CoreComponents.icon name="hero-bars-3" class="h-6 w-6" />
          <:close>
            <CoreComponents.icon name="hero-x-mark" class="h-6 w-6" />
          </:close>
        </Compounds.Navbar.menu_trigger>
      </:right>
    </Compounds.Navbar.navbar>
    """
  end
end
