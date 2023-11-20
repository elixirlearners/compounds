defmodule CompoundsTesterWeb.Home do
  use CompoundsTesterWeb, :live_view

  @moduledoc """
  The main page of the application, used to display all components in one showcase.
  """

  use Phoenix.LiveView
  import Compounds.Card
  import Compounds.Checkbox
  import Compounds.ClientButton
  import Compounds.Dropdown
  alias Compounds.Input

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{})}
  end

  def render(assigns) do
    ~H"""
    <div class="grid grid-cols-6 gap-y-12 p-16 h-full w-full gap-10">
      <div class="col-span-6">
        <Input.input>
          <:input_block_label>
            I'm a block label!
          </:input_block_label>
        </Input.input>
      </div>
      <div class="col-span-6">
        <Input.input clearable?={true}>
          <:input_block_label>
            I'm clearable
          </:input_block_label>
        </Input.input>
      </div>
      <div class="col-span-6">
        <Input.input>
          <:label_right>
            Label Right
          </:label_right>
        </Input.input>
      </div>
      <div class="col-span-6">
        <Input.input>
          <:label_left>
            Label Left
          </:label_left>
        </Input.input>
      </div>
      <div class="col-span-6">
        <Input.input>
          <:label_left>
            Label Left
          </:label_left>
          <:label_right>
            Label Right
          </:label_right>
        </Input.input>
      </div>
      <div class="col-span-6">
        <Input.input disabled?={true}>
          <:label_left>
            I'm Disabled
          </:label_left>
        </Input.input>
      </div>
      <div class="col-span-6">
        <Input.input read_only?={true} placeholder="Cant edit me!">
          <:label_left>
            I'm read only
          </:label_left>
        </Input.input>
      </div>
      <div class="col-span-6">
        <Input.input placeholder="Icon left">
          <:icon_left>
            <CompoundsTesterWeb.CoreComponents.icon name="hero-folder" />
          </:icon_left>
        </Input.input>
      </div>
      <div class="col-span-6">
        <Input.input placeholder="Icon right">
          <:icon_right>
            <CompoundsTesterWeb.CoreComponents.icon name="hero-folder" />
          </:icon_right>
        </Input.input>
      </div>
      <div class="col-span-6">
        <Input.input placeholder="Icon right">
          <:icon_right>
            <CompoundsTesterWeb.CoreComponents.icon name="hero-folder" />
          </:icon_right>
          <:label_left>
            Label left
          </:label_left>
        </Input.input>
      </div>
      <div class="col-span-6">
        <Input.input placeholder="Icon right">
          <:icon_right>
            <CompoundsTesterWeb.CoreComponents.icon name="hero-folder" />
          </:icon_right>
          <:label_right>
            Label right
          </:label_right>
        </Input.input>
      </div>
      <div class="col-span-6">
        <Input.input placeholder="Icon left">
          <:icon_left>
            <CompoundsTesterWeb.CoreComponents.icon name="hero-folder" />
          </:icon_left>
          <:label_left>
            Label left
          </:label_left>
        </Input.input>
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

      <.card>
        <.card_header>
          <.card_title>
            Card Title
          </.card_title>
          <.card_description>
            Card Description
          </.card_description>
        </.card_header>
        <.card_content>
          <form class="space-y-4">
            <div>
              <label>Could we have your cookies?</label>
              <input class="border rounded w-full" />
            </div>
            <div>
              <label>Pretty please?</label>
              <input class="border rounded w-full" />
            </div>
          </form>
        </.card_content>
        <.card_footer class="flex flex-row w-full justify-between">
          <button class="rounded-md px-3 py-1 bg-slate-900 text-white font-medium hover:bg-stone-700 transition ease-out duration-200">
            Accept
          </button>
          <button class="rounded-md px-3 py-1 bg-slate-900 text-white font-medium hover:bg-stone-700 transition ease-out duration-200">
            Decline
          </button>
        </.card_footer>
      </.card>
    </div>
    """
  end

  def handle_event() do
  end
end
