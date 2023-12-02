export default ComModal = {
  mounted() {
    const modal = this.el;
    const trigger = modal.querySelector(".compounds-trigger");
    const content = modal.querySelector(".compounds-content");
    const actions = modal.querySelectorAll(".compounds-action");

    content.style.top = "50%"
    content.style.left = "50%"
    content.style.transform = "translate(-50%, -50%)"

    const backdrop = spawnBackdrop()
    modal.appendChild(backdrop)

    const closeContentWrap = () => closeContent(content, backdrop)
    const keydownWrap = (event) => {
      if (event.key === "Escape") {
        closeContent(content, backdrop)
      }
    }
    const toggleContentWrap = () => toggleContent(content, backdrop)
    const contentTransitionWrap = () => {
      if (content.classList.contains("opacity-0")) {
        content.classList.add("invisible")
        content.classList.add("pointer-events-none")
      }
    }
    const backdropTransitionWrap = () => {
      if (backdrop.classList.contains("bg-opacity-0")) {
        backdrop.classList.add("invisible")
      }
    }

    // Add event listeners that closes the modal
    // for all actions that has the attribute "close"
    Array.from(actions).forEach(action => {
      if (action.hasAttribute("close")) {
        action.addEventListener("click", closeContentWrap)
      }
    })
    document.addEventListener("keydown", keydownWrap)
    backdrop.addEventListener("click", closeContentWrap)
    trigger.addEventListener("click", toggleContentWrap)
    content.addEventListener("transitionend", contentTransitionWrap)
    backdrop.addEventListener("transitionend", backdropTransitionWrap)


    this.destructor = () => {
      Array.from(actions).forEach(action => {
        if (action.hasAttribute("close")) {
          action.removeEventListener("click", closeContentWrap)
        }
      })
      document.removeEventListener("keydown", keydownWrap)
      backdrop.removeEventListener("click", closeContentWrap)
      trigger.removeEventListener("click", toggleContentWrap)
      content.removeEventListener("transitionend", contentTransitionWrap)
      backdrop.removeEventListener("transitionend", backdropTransitionWrap)
    }
  },

  destroyed() {
    this.destructor()
  }
}



function toggleContent(content, backdrop) {
  if (content.classList.contains("invisible")) {
    openContent(content, backdrop)
  } else {
    closeContent(content, backdrop)
  }
}

function openContent(content, backdrop) {
  content.classList.remove("opacity-0")
  content.classList.add("opacity-100")
  content.classList.remove("invisible")
  content.classList.remove("pointer-events-none")

  backdrop.classList.remove("invisible")
  backdrop.classList.add("bg-opacity-20")
  backdrop.classList.remove("bg-opacity-0")
}

function closeContent(content, backdrop) {
  content.classList.add("opacity-0")
  content.classList.remove("opacity-100")
  backdrop.classList.remove("bg-opacity-20")
  backdrop.classList.add("bg-opacity-0")
}


function spawnBackdrop() {
  const backdrop = document.createElement("div")
  backdrop.classList.add("fixed", "inset-0", "z-20", "bg-black", "invisible", "bg-opacity-0", "transition", "duration-200")
  return backdrop
}
