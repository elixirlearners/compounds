export default ComPopover = {
  mounted() {
    const popover = this.el;
    const trigger = popover.querySelector(".compounds-trigger");
    const content = popover.querySelector(".compounds-content");

    // Center the content under the trigger
    content.style.left = calculatePos(popover, trigger, content);

    // Assign names to wrapper functions, so we could remove them in the destructor.
    const triggerClickWrap = () => handleTriggerClick(content);
    const documentClickWrap = (event) => handleDocumentClick(event, popover, content);
    const keyDownWrap = (event) => handleKeyDown(event, content);

    trigger.addEventListener("click", triggerClickWrap);
    document.addEventListener("click", documentClickWrap);
    document.addEventListener("keydown", keyDownWrap);

    this.destructor = () => {
      trigger.removeEventListener("click", triggerClickWrap);
      document.removeEventListener("click", documentClickWrap);
      document.removeEventListener("keydown", keyDownWrap);
    }
  },

  destroyed() {
    this.destructor();
  }
}

// Toggle the popover content visibliity when user clicks the trigger
function handleTriggerClick(content) {
  toggleContent(content);
}

// Close the popover content when user clicks out
function handleDocumentClick(event, popover, content) {
  if (!popover.contains(event.target)) {
    closeContent(content);
  }
}

// Close the popover content when user presses Escape
function handleKeyDown(event, content) {
  if (event.key === "Escape") {
    closeContent(content);
  }
}

function toggleContent(content) {
  content.classList.toggle("opacity-0");
  content.classList.toggle("opacity-100");
}

function closeContent(content) {
  content.classList.add("opacity-0");
  content.classList.remove("opacity-100");
}


// Calculate the position of the popover content to center it under the trigger
function calculatePos(popover, trigger, content) {
  const triggerRect = trigger.getBoundingClientRect();
  const popoverRect = popover.getBoundingClientRect();
  const triggerCenter = triggerRect.left - popoverRect.left + triggerRect.width / 2;
  const contentWidth = content.offsetWidth;
  return `${triggerCenter - contentWidth / 2}px`;
}
