export default {
  mounted() {
    this.el.style.maxHeight = "0px";
    this.el.style.transition = "max-height 0.2s ease-out"

    this.el.addEventListener("expand", (event) => {
      if(this.el.style.maxHeight !== "0px") {
        this.el.style.maxHeight = "0px";
      } else {
        this.el.style.maxHeight = this.el.scrollHeight + "px";
      }
    })
  }
};
