const toggleHiddenElement = (dom, options) => {
  const { root, trigger } = dom;
  const { eventName, toggledClassName, animationConfig } = options;

  const show = () => {
    root.setAttribute("data-open", true);
    root.classList.remove(toggledClassName);

    root.getAnimations().forEach((anim) => {
      anim.cancel();
    });

    const anim = root.animate(animationConfig.in, animationConfig.options);

    anim.oncancel = () => {
      root.classList.add(toggledClassName);
    };
  };

  const hide = () => {
    root.setAttribute("data-open", false);

    root.getAnimations().forEach((anim) => {
      anim.cancel();
    });

    const anim = root.animate(animationConfig.out, animationConfig.options);
    anim.onfinish = () => {
      root.classList.add(toggledClassName);
    };
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
      const animationConfig = {
        in: [
          { opacity: 0, transform: "translateY(-10px)" },
          { opacity: 100, transform: "translateY(0px)" },
        ],
        out: [{ opacity: 100 }, { opacity: 0 }],
        options: { duration: 200, iterations: 1 },
      };

      this.instances.push(
        toggleHiddenElement(
          { root: this.el, trigger },
          {
            eventName: "click",
            toggledClassName: "hidden",
            animationConfig,
          }
        )
      );
    });
  },
  destroyed() {
    this.instances.forEach((removeListener) => removeListener());
  },
};
