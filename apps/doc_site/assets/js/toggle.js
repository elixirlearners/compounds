export default {
  mounted() {
    this.el.addEventListener("toggle", (event) => {
      let bg_color = get_bg_color(this.el)
      this.el.classList.toggle("checked");
      if(this.el.classList.contains("checked")){
        this.el.classList.add(bg_color);
        this.el.firstElementChild.classList.add("left-[calc(100%_-_0.875rem_-_2px)]");
        this.el.firstElementChild.classList.remove("left-px");
        this.el.firstElementChild.classList.add("shadow-none");
      } else {
        this.el.classList.remove(bg_color);
        this.el.firstElementChild.classList.remove("left-[calc(100%_-_0.875rem_-_2px)]");
        this.el.firstElementChild.classList.add("left-px");
        this.el.firstElementChild.classList.remove("shadow-none");
      }
    });
  }
};

function get_bg_color(el) {
  const type = el.getAttribute('data-comp-type');
  if(type === "primary"){return "bg-success"}
  if(type === "secondary"){return "bg-accent_6"}
  if(type === "success"){return "bg-success"}
  if(type === "warning"){return "bg-warning"}
  if(type === "error"){return "bg-error"}
}
