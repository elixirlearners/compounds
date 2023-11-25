const tab_prefix = "tab-";
const content_prefix = "content-";

export default ComTabs = {
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
