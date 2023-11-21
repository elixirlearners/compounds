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
const tab_prefix = "tab-";
const content_prefix = "content-";

let Hooks = {}
Hooks.ComTabs = {
  mounted() {
    this.el.addEventListener("switch-tabs", (event) => {
      const active_key = event.detail.active_key;

      // Do nothing if the actived tab is disabled
      const active_tab = this.el.querySelector(`[key="${tab_prefix}${active_key}"]`);
      if (active_tab.disabled) {
        return;
      }

      // Hide all other contents and show only the active one
      let contents = Array.from(this.el.querySelector(".tabs-content").children);
      showActiveContent(contents, active_key)

      // Change the styles of tabs depending on if they're active or non active
      let tabs = Array.from(this.el.querySelector(".tabs-header").children);
      styleActiveTab(tabs, active_key)
    })

    // On mount, we want to immediately switch to the active tab.
    const active_key = this.el.getAttribute("active_key");
    this.el.dispatchEvent(new CustomEvent("switch-tabs", { detail: { active_key } }));
  }
}

function showActiveContent(contents, active_key) {
  contents.forEach(content => {
    if (content.getAttribute("key") === content_prefix + active_key) {
      content.classList.remove("hidden");
    } else {
      content.classList.add("hidden");
    }
  });
}

function styleActiveTab(tabs, active_key) {
  tabs.forEach(tab => {
    if (tab.getAttribute("key") === tab_prefix + active_key) {
      tab.classList.remove("border-transparent", "text-slate-600");
      tab.classList.add("text-black");
    } else {
      tab.classList.remove("text-black");
      tab.classList.add("border-transparent", "text-slate-600");
    }
  });
}


Hooks.ComCombo = {
  mounted() {
    this.el.addEventListener("click", (event) => {
      const dropdown_icon = this.el.querySelector(".dropdown-icon");
      const dropdown_menu = this.el.querySelector(".dropdown-menu");
      // An element in the dropdown menu was clicked
      if (event.target.parentNode.classList.contains("dropdown-menu")) {
        handleDropdownClick(event);
      }
      // An element in the input wrapper was clicked
      else {
        handleInputClick(dropdown_icon, dropdown_menu, event);
      }
    })
  }
}

function handleDropdownClick(event) {
  console.log("dropdown clicked")
}

function handleInputClick(dropdown_icon, dropdown_menu, event) {
  console.log("input clicked")
  const target = event.target
  // if the input is clicked we want to:
  // 1. show the dropdown
  // 2. rotate the icon to the up position

  // if the dropdown_icon is clicked we want to:
  // 1. toggle the dropdown
  // 2. toggle the icon rotation between up and down
  if (target.parentNode.classList.contains("dropdown-icon")) {
    // Toggle the dropdown and the icon rotation
    if (dropdown_icon.style.transform !== "rotate(180deg)") {
      dropdown_icon.style.transform = "rotate(180deg)";
      dropdown_menu.classList.remove("hidden");
      dropdown_menu.classList.add("flex");
    }
    else {
      dropdown_icon.style.transform = "";
      dropdown_menu.classList.remove("flex");
      dropdown_menu.classList.add("hidden");
    }
  }
  else {
    // Show the dropdown and rotate the icon to the down position
    if (dropdown_icon.style.transform !== "rotate(180deg)") {
      dropdown_icon.style.transform = "rotate(180deg)";
      dropdown_menu.classList.remove("hidden");
      dropdown_menu.classList.add("flex");
    }
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
