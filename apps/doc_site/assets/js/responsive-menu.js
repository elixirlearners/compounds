import animate from "./animations";

/**
 * Toggles the visibility of a hidden element.
 *
 * @param {Object} dom - The DOM object containing the element to toggle.
 * @param {Object} options - The options for toggling the element.
 * @param {HTMLElement} options.root - The root element to toggle.
 * @param {HTMLElement} options.trigger - The trigger element to listen for events.
 * @param {string} options.eventName - The event name to listen for on the trigger element.
 * @param {string} options.toggledClassName - The class name to toggle on the root element.
 * @param {CompoundAnimation} options.animationShow - The animation to play when showing the element.
 * @param {CompoundAnimation} options.animationHide - The animation to play when hiding the element.
 * @return {Function} - A function to remove the event listeners.
 */
const toggleHiddenElement = (dom, options) => {
  const { root, trigger } = dom;
  const { eventName, toggledClassName, animationShow, animationHide } = options;

  const show = () => {
    animationShow.play({
      onBegin: () => {
        root.setAttribute("data-open", true);
        root.classList.remove(toggledClassName);
      },
    });
  };

  const hide = () => {
    animationHide.play({
      onBegin: () => root.setAttribute("data-open", false),
      onFinish: () => root.classList.add(toggledClassName),
    });
  };

  const toggleState = (_event) => {
    const isOpen = root.dataset.open === "true";
    isOpen ? hide() : show();
  };

  const setupListeners = () => {
    trigger.addEventListener(eventName, toggleState);
  };

  const removeListeners = () => {
    trigger.removeEventListener(eventName, toggleState);
  };

  setupListeners();

  return removeListeners;
};

export default {
  instances: [],
  mounted() {
    const id = this.el.getAttribute("id");
    const animationShow = animate(this.el).opacity(1);
    const animationHide = animate(this.el).opacity(0);

    document.querySelectorAll(`[data-menutrigger=${id}]`).forEach((trigger) => {
      this.instances.push(
        toggleHiddenElement(
          { root: this.el, trigger },
          {
            eventName: "click",
            toggledClassName: "hidden",
            animationShow,
            animationHide,
          }
        )
      );
    });
  },
  destroyed() {
    this.instances.forEach((removeListener) => removeListener());
  },
};
