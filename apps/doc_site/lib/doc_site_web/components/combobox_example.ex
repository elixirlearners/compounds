defmodule DocSiteWeb.ComboboxExample do
  use DocSiteWeb, :live_component

  alias DocSiteWeb.CoreComponents

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{})}
  end

  def render(assigns) do
    ~H"""
    <div class="">
      <h3>Demo: Default</h3>
      <Compounds.ComboBox.combo_box>
        <Compounds.ComboBox.input_wrapper>
          <CoreComponents.icon
            name="hero-magnifying-glass"
            class="h-[1.15rem] w-[1.15rem] bg-neutral-500"
          />
          <Compounds.ComboBox.input class="" />
          <Compounds.ComboBox.dropdown_icon>
            <CoreComponents.icon
              name="hero-chevron-down"
              class="h-[1.15rem] w-[1.15rem] bg-neutral-500 cursor-pointer group-hover:bg-black transition ease-out duration-200"
            />
          </Compounds.ComboBox.dropdown_icon>
        </Compounds.ComboBox.input_wrapper>
        <Compounds.ComboBox.dropdown_menu options={["React", "Next.JS", "Remix", "Phoenix"]} />
      </Compounds.ComboBox.combo_box>
    </div>

    <div class="">
      <h3>Demo: Long</h3>
      <Compounds.ComboBox.combo_box>
        <Compounds.ComboBox.input_wrapper class="w-96">
          <CoreComponents.icon
            name="hero-magnifying-glass"
            class="h-[1.15rem] w-[1.15rem] bg-neutral-500"
          />
          <Compounds.ComboBox.input class="" />
          <Compounds.ComboBox.dropdown_icon>
            <CoreComponents.icon
              name="hero-chevron-down"
              class="h-[1.15rem] w-[1.15rem] bg-neutral-500 cursor-pointer group-hover:bg-black transition ease-out duration-200"
            />
          </Compounds.ComboBox.dropdown_icon>
        </Compounds.ComboBox.input_wrapper>
        <Compounds.ComboBox.dropdown_menu
          class="w-96"
          options={["React", "Next.JS", "Remix", "Phoenix"]}
        />
      </Compounds.ComboBox.combo_box>
    </div>

    <div class="">
      <h3>Demo: Larger</h3>
      <Compounds.ComboBox.combo_box>
        <Compounds.ComboBox.input_wrapper class="w-[40rem] text-base">
          <CoreComponents.icon name="hero-magnifying-glass" class="h-5 w-5 bg-neutral-500" />
          <Compounds.ComboBox.input />
          <Compounds.ComboBox.dropdown_icon>
            <CoreComponents.icon
              name="hero-chevron-down"
              class="h-5 w-5 bg-neutral-500 cursor-pointer group-hover:bg-black transition ease-out duration-200"
            />
          </Compounds.ComboBox.dropdown_icon>
        </Compounds.ComboBox.input_wrapper>
        <Compounds.ComboBox.dropdown_menu
          class="w-[40rem] text-base"
          options={["React", "Next.JS", "Remix", "Phoenix"]}
        />
      </Compounds.ComboBox.combo_box>
    </div>
    """
  end
end
