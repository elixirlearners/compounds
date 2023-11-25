defmodule DocSiteWeb.InputExample do
  use DocSiteWeb, :live_component

  alias DocSiteWeb.CoreComponents

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{})}
  end

  def render(assigns) do
    ~H"""
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
        <CoreComponents.icon name="hero-folder" />
      </:icon_left>
    </Compounds.Input.input>
    <Compounds.Input.input placeholder="Icon right">
      <:icon_right>
        <CoreComponents.icon name="hero-folder" />
      </:icon_right>
    </Compounds.Input.input>
    <Compounds.Input.input placeholder="Icon right">
      <:icon_right>
        <CoreComponents.icon name="hero-folder" />
      </:icon_right>
      <:label_left>
        Label left
      </:label_left>
    </Compounds.Input.input>
    <Compounds.Input.input placeholder="Icon right">
      <:icon_right>
        <CoreComponents.icon name="hero-folder" />
      </:icon_right>
      <:label_right>
        Label right
      </:label_right>
    </Compounds.Input.input>
    <Compounds.Input.input placeholder="Icon left">
      <:icon_left>
        <CoreComponents.icon name="hero-folder" />
      </:icon_left>
      <:label_left>
        Label left
      </:label_left>
    </Compounds.Input.input>
    """
  end
end
