defmodule DocSiteWeb.TabsExample do
  use DocSiteWeb, :live_component

  alias DocSiteWeb.CoreComponents

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{})}
  end

  def render(assigns) do
    ~H"""
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
    """
  end
end
