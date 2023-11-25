export default {
 mounted() {
    this.el.setAttribute("data-flipped", "false");
    this.el.style.transition = "rotate 0.2s ease-out"

    this.el.addEventListener("flip", (event) => {
      let is_flipped = (/true/i).test(this.el.getAttribute("data-flipped"));
      if(is_flipped){
        this.el.style.rotate = "0deg";
      } else {
        this.el.style.rotate = "180deg";
      }
      this.el.setAttribute("data-flipped", !is_flipped);
    });
  }
};
