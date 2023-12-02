defmodule DocSiteWeb.ModalExample do
  use DocSiteWeb, :live_component

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{})}
  end

  def render(assigns) do
    ~H"""
    <Compounds.Modal.modal class="">
      <Compounds.Modal.trigger>
        Open Modal
      </Compounds.Modal.trigger>
      <Compounds.Modal.content class="w-[33rem]">
        <div class="flex flex-col p-6 space-y-4">
          <h3 class="text-black font-semibold text-2xl">Create Token</h3>
          <p>
            Enter a unique name for your token to differentiate it from other tokens and then select the scope.
            <br /> <br /> Some content contained within the modal.
          </p>
        </div>
        <Compounds.Modal.actions class="w-full flex justify-between">
          <Compounds.Modal.action close={true}>
            <Compounds.Button.button type="secondary">
              Cancel
            </Compounds.Button.button>
          </Compounds.Modal.action>
          <Compounds.Modal.action close={true}>
            <Compounds.Button.button>
              Submit
            </Compounds.Button.button>
          </Compounds.Modal.action>
        </Compounds.Modal.actions>
      </Compounds.Modal.content>
    </Compounds.Modal.modal>
    """
  end
end
