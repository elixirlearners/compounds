defmodule DocSiteWeb.SpinnerExample do
  use DocSiteWeb, :live_component

  alias DocSiteWeb.CoreComponents

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{})}
  end

  def render(assigns) do
    ~H"""
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
    """
  end
end
