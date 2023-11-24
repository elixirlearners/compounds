const toggleHiddenElement = (dom, options) => {
  const { root, trigger } = dom;
  const { eventName, toggledClassName } = options;

  const show = () => {
    root.setAttribute("data-open", true);
    root.classList.remove(toggledClassName);
  };

  const hide = () => {
    root.classList.add(toggledClassName);
    root.setAttribute("data-open", false);
  };

  const toggleState = (_event) => {
    const isOpen = root.dataset.open === "true";
    isOpen ? hide() : show();
  };

  const setupListeners = () => {
    trigger.addEventListener(eventName, toggleState);
  };

  const removeListeners = () => {
    removeEventListener(eventName, toggleState);
  };

  setupListeners();

  return removeListeners;
};

export default {
  instances: [],
  mounted() {
    const id = this.el.getAttribute("id");
    document.querySelectorAll(`[data-menutrigger=${id}]`).forEach((trigger) => {
      this.instances.push(
        toggleHiddenElement(
          { root: this.el, trigger },
          { eventName: "click", toggledClassName: "hidden" }
        )
      );
    });
  },
  destroyed() {
    this.instances.forEach((removeListener) => removeListener());
  },
};
