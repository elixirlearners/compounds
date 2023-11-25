export default ComCombo = {
  mounted() {
    const combo_box = this.el;
    const dropdown_icon = combo_box.querySelector(".dropdown-icon");
    const dropdown_menu = combo_box.querySelector(".dropdown-menu");
    const input = combo_box.querySelector(".compounds-input");

    // Setup event listeners on mounted.
    combo_box.addEventListener("click", event => handleComboClick(event, dropdown_icon, dropdown_menu, input));
    document.addEventListener("click", event => handleDocumentClick(event, combo_box, dropdown_icon, dropdown_menu));
    combo_box.addEventListener("keydown", event => handleKeyDown(event, combo_box, dropdown_menu, input));
    input.addEventListener("input", event => handleInput(event, combo_box, dropdown_icon, dropdown_menu));
    setupHoverEvents(combo_box, dropdown_menu);
  },

  destroyed() {
    // TODO: remove all event listeners
  }
}

// Setup hover events for each option in the dropdown menu
function setupHoverEvents(combo_box, dropdown_menu) {
  // On hover, set aria-selected to true for the hovered item
  // and false for all other items
  const options = combo_box.querySelectorAll('.dropdown-menu li');
  options.forEach(option => {
    option.addEventListener('mouseover', () => {
      clearSelections(dropdown_menu);
      option.setAttribute('aria-selected', 'true');
    });
  });
}


// Handles the input event for the combo box.
function handleInput(event, combo_box, dropdown_icon, dropdown_menu) {
  openDropdown(dropdown_icon, dropdown_menu);
  // Filter the dropdown menu items based on the input value
  const input_text = event.target.value.toLowerCase();
  const listItems = combo_box.querySelectorAll('.dropdown-menu li');
  listItems.forEach(item => {
    if (item.innerText.toLowerCase().includes(input_text)) {
      item.classList.remove("hidden");
    }
    else {
      item.classList.add("hidden");
    }
  });

  // Make the first visible option the selected one
  const first_visible_option = combo_box.querySelector(".dropdown-menu li:not(.hidden)");
  if (first_visible_option) {
    clearSelections(dropdown_menu);
    first_visible_option.setAttribute("aria-selected", "true");
  }


}

function handleKeyDown(event, combo_box, dropdown_menu, input) {
  // Query for the first selected option
  let selected_option = combo_box.querySelector("li[aria-selected='true']");

  // If there is no selected option, select the first one
  if (!selected_option) {
    selected_option = combo_box.querySelector("li");
    selected_option.setAttribute("aria-selected", "true");
  }

  // Keyboard navigations for selecting options
  switch (event.key) {
    case 'ArrowDown':
      selected_option.setAttribute("aria-selected", "false");
      getNextSelection(selected_option).setAttribute("aria-selected", "true");
      break;
    case 'ArrowUp':
      selected_option.setAttribute("aria-selected", "false");
      getPreviousSelection(selected_option).setAttribute("aria-selected", "true");
      break;
    case 'Enter':
      // Only accept the selected option if the dropdown is currently open
      if (!dropdown_menu.classList.contains("hidden")) {
        acceptSelected(input, dropdown_menu);
      }
      break;
  }

}

// Close the dropdown if the user clicks outside of the combo box
function handleDocumentClick(event, combo_box, dropdown_icon, dropdown_menu) {
  if (!combo_box.contains(event.target)) {
    closeDropdown(dropdown_icon, dropdown_menu);
  }
}

// Handle click events on the combo box
function handleComboClick(event, dropdown_icon, dropdown_menu, input) {
  // An element in the dropdown menu was clicked
  if (event.target.parentNode.classList.contains("dropdown-menu")) {
    acceptSelected(input, dropdown_menu);
    return;
  }

  // An element in the input wrapper was clicked
  if (event.target.parentNode.classList.contains("dropdown-icon")) {
    // Toggle dropdown if the icon is clicked
    toggleDropdown(dropdown_icon, dropdown_menu);
  }
  else {
    // Open dropdown if input is clicked
    openDropdown(dropdown_icon, dropdown_menu);
  }
}

// Clear all selections in the dropdown menu
function clearSelections(dropdown_menu) {
  const listItems = dropdown_menu.querySelectorAll('.dropdown-menu li');
  listItems.forEach(item => item.setAttribute("aria-selected", "false"));
}

// Get the next selection in the dropdown menu.
// Loop back to the first option if necessary.
function getNextSelection(element) {
  if (element.nextElementSibling) {
    return element.nextElementSibling;
  }
  else {
    return element.parentNode.firstElementChild;
  }
}

// Get the previous selection in the dropdown menu.
// Loop back to the last option if necessary.
function getPreviousSelection(element) {
  // Get the previous selection in the dropdown menu
  if (element.previousElementSibling) {
    return element.previousElementSibling;
  }
  else {
    return element.parentNode.lastElementChild;
  }
}


// Show or hide the dropdown menu and rotate the dropdown icon
function toggleDropdown(dropdown_icon, dropdown_menu) {
  if (dropdown_menu.classList.contains("hidden")) {
    openDropdown(dropdown_icon, dropdown_menu)
  }
  else {
    closeDropdown(dropdown_icon, dropdown_menu)
  }
}

// Show the dropdown menu and rotate the icon to the down position
function openDropdown(dropdown_icon, dropdown_menu) {
  dropdown_icon.style.transform = "rotate(180deg)";
  dropdown_menu.classList.remove("hidden");
  dropdown_menu.classList.add("flex");

  // If there are no selected elements in the dropdown,
  // we select the first option by default.
  const selected_option = dropdown_menu.querySelector("li[aria-selected='true']");
  if (!selected_option) {
    dropdown_menu.querySelector("li").setAttribute("aria-selected", "true");
  }
}

// Hide the dropdown menu and rotate the icon to the down position
function closeDropdown(dropdown_icon, dropdown_menu) {
  dropdown_icon.style.transform = "";
  dropdown_menu.classList.remove("flex");
  dropdown_menu.classList.add("hidden");
}


// Accept the selected option in the dropdown menu
// Fill the input with the selected option text and close the dropdown menu
function acceptSelected(input, dropdown_menu) {
  const selected_li = dropdown_menu.querySelector("li[aria-selected='true']");
  const selection_text = selected_li.innerText;
  input.value = selection_text;

  const dropdown_icon = input.parentNode.querySelector(".dropdown-icon");
  closeDropdown(dropdown_icon, dropdown_menu);
}
