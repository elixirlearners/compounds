import animate from "./animations";

export default {
  mounted() {
    const animation = animate(this.el).rotate("180deg");

    this.el.setAttribute("data-flipped", "false");

    this.el.addEventListener("flip", (_) => {
      const isFlipped = /true/i.test(this.el.getAttribute("data-flipped"));
      if (isFlipped) {
        animation.reverse();
      } else {
        animation.play();
      }
      this.el.setAttribute("data-flipped", !isFlipped);
    });
  },
};
