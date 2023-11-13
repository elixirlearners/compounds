// If you want to use Phoenix channels, run `mix help phx.gen.channel`
// to get started and then uncomment the line below.
// import "./user_socket.js"

// You can include dependencies in two ways.
//
// The simplest option is to put them in assets/vendor and
// import them using relative paths:
//
//     import "../vendor/some-package.js"
//
// Alternatively, you can `npm install some-package --prefix assets` and import
// them using a path starting with the package name:
//
//     import "some-package"
//

// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html"
// Establish Phoenix Socket and LiveView configuration.
import { Socket } from "phoenix"
import { LiveSocket } from "phoenix_live_view"
import topbar from "../vendor/topbar"


// Compounds custom JS hooks
// ==============================================
let Hooks = {}

Hooks.ComTabs = {
  mounted() {
    this.el.addEventListener("switch-tabs", (event) => {
      let content_prefix = "tab-content-";
      let tab_prefix = "tab-";
      let active_id = event.detail.active_id;

      // Do nothing if the clicked tab is disabled
      let clicked_tab = this.el.querySelector("#" + tab_prefix + active_id);
      if (clicked_tab.disabled) {
        return;
      }

      // Change the styles of tabs depending on if they're active or non active
      let tabs = Array.from(this.el.querySelector(".tabs-header").children);
      tabs.forEach(tab => {
        if (tab.id === tab_prefix + active_id) {
          tab.classList.remove("border-transparent", "text-slate-600");
          tab.classList.add("text-black");
        } else {
          tab.classList.remove("text-black");
          tab.classList.add("border-transparent", "text-slate-600");
        }
      });

      // Hide all other contents and show only the active one
      let contents = Array.from(this.el.querySelector(".tabs-content").children);
      contents.forEach(content => {
        if (content.id === content_prefix + active_id) {
          content.classList.remove("hidden");

        } else {
          content.classList.add("hidden");
        }
      });

    })
  }
}
// ==============================================



let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {
  hooks: Hooks,
  params: { _csrf_token: csrfToken }
})

// Show progress bar on live navigation and form submits
topbar.config({ barColors: { 0: "#29d" }, shadowColor: "rgba(0, 0, 0, .3)" })
window.addEventListener("phx:page-loading-start", _info => topbar.show(300))
window.addEventListener("phx:page-loading-stop", _info => topbar.hide())

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket
