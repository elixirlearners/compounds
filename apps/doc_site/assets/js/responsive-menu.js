import { makeAnimation } from "./animations";

const toggleHiddenElement = (dom, options) => {
  const { root, trigger } = dom;
  const { eventName, toggledClassName, animation } = options;

  const show = () => {
    root.setAttribute("data-open", true);
    root.classList.remove(toggledClassName);

    root.getAnimations().forEach((anim) => {
      anim.pause();
    });

    animation.in.play();
  };

  const hide = () => {
    root.setAttribute("data-open", false);

    root.getAnimations().forEach((anim) => {
      anim.pause();
    });

    animation.out.play();
  };

  const addClassName = () => {
    root.classList.add(toggledClassName);
  };

  const toggleState = (_event) => {
    const isOpen = root.dataset.open === "true";
    isOpen ? hide() : show();
  };

  const setupListeners = () => {
    trigger.addEventListener(eventName, toggleState);
    animation.in.addEventListener("cancel", addClassName);
    animation.out.addEventListener("finish", addClassName);
  };

  const removeListeners = () => {
    trigger.removeEventListener(eventName, toggleState);
    animation.in.removeEventListener("cancel", addClassName);
    animation.out.removeEventListener("finish", addClassName);
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
          {
            eventName: "click",
            toggledClassName: "hidden",
            animation: makeAnimation(this.el, "fadeDown"),
          }
        )
      );
    });
  },
  destroyed() {
    this.instances.forEach((removeListener) => removeListener());
  },
};
