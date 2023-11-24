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
// TODO variables should be camelCase, not snake_case. When in rome...
// TODO document all functions
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
    // Setup click events for the combo box
    this.el.addEventListener("click", (event) => {
      const combo_box = this.el;
      const dropdown_icon = combo_box.querySelector(".dropdown-icon");
      const dropdown_menu = combo_box.querySelector(".dropdown-menu");
      const input = combo_box.querySelector(".compounds-input");
      console.log(input)
      console.log(dropdown_menu)
      // An element in the dropdown menu was clicked
      if (event.target.parentNode.classList.contains("dropdown-menu")) {
        acceptSelected(input, dropdown_menu);
      }
      // An element in the input wrapper was clicked
      else {
        handleInputClick(dropdown_icon, dropdown_menu, event);
      }
    })
    this.el.querySelector(".compounds-input").addEventListener("focusout", (event) => {
      const dropdown_icon = this.el.querySelector(".dropdown-icon");
      const dropdown_menu = this.el.querySelector(".dropdown-menu");
      closeDropdown(dropdown_icon, dropdown_menu);
    })

    // Setup keyboard events for the combo box
    this.el.addEventListener("keydown", (event) => {
      const combo_box = this.el;
      const dropdown_menu = combo_box.querySelector(".dropdown-menu");
      const input = combo_box.querySelector(".compounds-input");

      // Query for the selected list item
      let selected_li = combo_box.querySelector("li[aria-selected='true']");

      // If there is no selected list item, select the first one
      if (!selected_li) {
        selected_li = combo_box.querySelector("li");
        selected_li.setAttribute("aria-selected", "true");
      }

      switch (event.key) {
        case 'ArrowDown':
          selected_li.setAttribute("aria-selected", "false");
          getNextSelection(selected_li).setAttribute("aria-selected", "true");
          break;
        case 'ArrowUp':
          selected_li.setAttribute("aria-selected", "false");
          getPreviousSelection(selected_li).setAttribute("aria-selected", "true");
          break;
        case 'Enter':
          // If the dropdown is open, accept the selected item
          if (!dropdown_menu.classList.contains("hidden")) {
            acceptSelected(input, dropdown_menu);
          }
          break;
      }
    })

    // Setup hover events for each list item
    const listItems = this.el.querySelectorAll('.dropdown-menu li');
    listItems.forEach(item => {
      item.addEventListener('mouseover', () => {
        // Reset aria-selected for all items
        listItems.forEach(li => li.setAttribute('aria-selected', 'false'));
        // Set aria-selected true for the hovered item
        item.setAttribute('aria-selected', 'true');
      });
    });
  }
}

function getNextSelection(element) {
  // Get the next selection in the dropdown menu
  if (element.nextElementSibling) {
    return element.nextElementSibling;
  }
  else {
    return element.parentNode.firstElementChild;
  }
}

function getPreviousSelection(element) {
  // Get the previous selection in the dropdown menu
  if (element.previousElementSibling) {
    return element.previousElementSibling;
  }
  else {
    return element.parentNode.lastElementChild;
  }
}


function toggleDropdown(dropdown_icon, dropdown_menu) {
  // Toggle the dropdown and the icon rotation
  if (dropdown_menu.classList.contains("hidden")) {
    openDropdown(dropdown_icon, dropdown_menu)
  }
  else {
    closeDropdown(dropdown_icon, dropdown_menu)
  }
}

function openDropdown(dropdown_icon, dropdown_menu) {
  // Show the dropdown and rotate the icon to the down position
  dropdown_icon.style.transform = "rotate(180deg)";
  dropdown_menu.classList.remove("hidden");
  dropdown_menu.classList.add("flex");

  // Focus on the dropdown menu's elements
  // If there are no selected elements in the dropdown, select the first one
  const selected_li = dropdown_menu.querySelector("li[aria-selected='true']");
  if (!selected_li) {
    dropdown_menu.querySelector("li").setAttribute("aria-selected", "true");
  }
}

function closeDropdown(dropdown_icon, dropdown_menu) {
  // Hide the dropdown and rotate the icon to the down position
  dropdown_icon.style.transform = "";
  dropdown_menu.classList.remove("flex");
  dropdown_menu.classList.add("hidden");
}


function handleInputClick(dropdown_icon, dropdown_menu, event) {
  // Toggle dropdown if the icon is clicked 
  if (event.target.parentNode.classList.contains("dropdown-icon")) {
    toggleDropdown(dropdown_icon, dropdown_menu);
  }
  // Open dropdown if input is clicked 
  else {
    openDropdown(dropdown_icon, dropdown_menu);
  }
}

function acceptSelected(input, dropdown_menu) {
  // Accept the selected item in the dropdown menu
  const selected_li = dropdown_menu.querySelector("li[aria-selected='true']");
  input.value = selected_li.innerText;

  const dropdown_icon = input.parentNode.querySelector(".dropdown-icon");

  closeDropdown(dropdown_icon, dropdown_menu);
}

// ==============================================



let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {
  hooks: Hooks,
  params: { _csrf_token: csrfToken }
})

// Show progress bar on live navigation and form submits
topbar.config({ barColors: { 0: "#29d" }, shadowColor: "rgba(0, 0, 0, .3)" })
window.addEventListener("phx:page-loading-start", _info => topbar.show(301))
window.addEventListener("phx:page-loading-stop", _info => topbar.hide())

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket
