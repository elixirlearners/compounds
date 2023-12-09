import animate from "./animations";

export default {
  mounted() {
    this.el.setAttribute("data-expanded", false);
    const animation = animate(this.el).maxHeight(`${this.el.scrollHeight}px`);

    this.el.addEventListener("expand", (_) => {
      const isExpanded = /true/i.test(this.el.getAttribute("data-expanded"));

      if (isExpanded) {
        animation.reverse();
      } else {
        animation.play();
      }

      this.el.setAttribute("data-expanded", !isExpanded);
    });
  },
};
