defmodule DocSiteWeb.AccordionExample do
  use DocSiteWeb, :live_component

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{})}
  end

  def render(assigns) do
    ~H"""
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
    """
  end
end
