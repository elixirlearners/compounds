/*
  Implement hover states to the text area.
  We have to use hooks to add hover states because,
  using Tailwind's hover: and focus: directly doesn't yield the intended results.
  The hover: has a higher priority than the focus:, so
  hover styles will be override the focus styles even when the text area is focused.
*/
export default ComTextArea = {
  mounted() {
    const text_area = this.el;
    const is_errored = text_area.hasAttribute("error");

    this.destructor = () => {
      text_area.removeEventListener("mouseenter", handleMouseEnter);
      text_area.removeEventListener("mouseout", handleMouseOut);
      text_area.removeEventListener("focus", handleFocus);
    }

    text_area.addEventListener("mouseenter", event => handleMouseEnter(event, text_area, is_errored));
    text_area.addEventListener("mouseout", event => handleMouseOut(event, text_area, is_errored));
    text_area.addEventListener("focus", event => handleFocus(event, text_area, is_errored));
  },

  // TODO: test if this destructor work in alpha 1.0
  destroyed() {
    this.destructor();
  }
}


// Add hover classes on mouse enter
function handleMouseEnter(_event, text_area, is_errored) {
  // We don't want to add the hover border if the text area is focused
  const is_focused = document.activeElement === text_area;
  if (is_focused) return;
  status_classes = statusClasses(is_errored);
  text_area.classList.add(status_classes);
}

// Remove the hover border on mouse out
function handleMouseOut(_event, text_area, is_errored) {
  status_classes = statusClasses(is_errored);
  text_area.classList.remove(status_classes);
}

// Remove the hover border on focus
function handleFocus(_event, text_area, is_errored) {
  status_classes = statusClasses(is_errored);
  text_area.classList.remove(status_classes);
}



// Pure functions
// ================================================================

// Return classes based on the component status
function statusClasses(error) {
  if (error) {
    return "ring-red-300";
  }
  else {
    return "border-neutral-400";
  }
}

// ================================================================
