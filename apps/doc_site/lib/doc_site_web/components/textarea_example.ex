defmodule DocSiteWeb.TextAreaExample do
  use DocSiteWeb, :live_component

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{})}
  end

  def render(assigns) do
    assigns =
      assign(
        assigns,
        :placeholder,
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
      )

    ~H"""
    <div class="flex flex-col space-y-10 mb-10">
      <div class="flex flex-col ">
        <Compounds.Text.h4 type="secondary">
          Default
        </Compounds.Text.h4>
        <Compounds.TextArea.text_area placeholder={@placeholder} />
      </div>

      <div class="flex flex-col">
        <Compounds.Text.h4 type="secondary">
          Resizable
        </Compounds.Text.h4>
        <Compounds.TextArea.text_area placeholder={@placeholder} class="resize" />
      </div>

      <div class="flex flex-col">
        <Compounds.Text.h4 type="secondary">
          Disabled
        </Compounds.Text.h4>
        <Compounds.TextArea.text_area placeholder={@placeholder} disabled />
      </div>

      <div class="flex flex-col">
        <Compounds.Text.h4 type="secondary">
          Error
        </Compounds.Text.h4>
        <Compounds.TextArea.text_area placeholder={@placeholder} error="There has been an error" />
      </div>

      <div class="flex flex-col">
        <Compounds.Text.h4 type="secondary">
          Error & Disabled
        </Compounds.Text.h4>
        <Compounds.TextArea.text_area
          placeholder={@placeholder}
          disabled
          error="There has been an error"
        />
      </div>
    </div>
    """
  end
end
