defmodule DocSiteWeb.HomeController do
  use DocSiteWeb, :live_view

  def mount(_params, _session, socket) do
    components = [
      "Accordion",
      "Alert",
      "Avatar",
      "Button",
      "Card",
      "Combobox",
      "DataTable",
      "Dialog",
      "Drawer",
      "Dropdown",
      "Form",
      "Icon",
      "Input",
      "Navbar",
      "RadioGroup",
      "Separator",
      "Spinner",
      "Table",
      "Tabs",
      "Text",
      "TextArea",
      "Toast",
      "Toggle",
      "ToolTip",
      "Popover"
    ]

    {:ok, assign(socket, %{component_name: nil, components: components})}
  end

  # Set selected_component to the current URL param component_name whenever there's a live patch event
  def handle_params(%{"component_name" => component_name} = _params, _uri, socket) do
    {:noreply, assign(socket, :selected_component, String.downcase(component_name))}
  end

  def handle_params(_params, _uri, socket) do
    {:noreply, assign(socket, :selected_component, nil)}
  end

  def render_component_example(%{name: "accordion"} = assigns) do
    ~H"""
    <DocSiteWeb.AccordionExample.render />
    """
  end

  def render_component_example(%{name: "alert"} = assigns) do
    ~H"""
    <DocSiteWeb.AlertExample.render />
    """
  end

  def render_component_example(%{name: "avatar"} = assigns) do
    ~H"""
    <DocSiteWeb.AvatarExample.render />
    """
  end

  def render_component_example(%{name: "button"} = assigns) do
    ~H"""
    <DocSiteWeb.ButtonExample.render />
    """
  end

  def render_component_example(%{name: "card"} = assigns) do
    ~H"""
    <DocSiteWeb.CardExample.render />
    """
  end

  def render_component_example(%{name: "combobox"} = assigns) do
    ~H"""
    <DocSiteWeb.ComboboxExample.render />
    """
  end

  def render_component_example(%{name: "datatable"} = assigns) do
    ~H"""
    <DocSiteWeb.DataTableExample.render />
    """
  end

  def render_component_example(%{name: "dialog"} = assigns) do
    ~H"""
    <DocSiteWeb.DataTableExample.render />
    """
  end

  def render_component_example(%{name: "drawer"} = assigns) do
    ~H"""
    <DocSiteWeb.DrawerExample.render />
    """
  end

  def render_component_example(%{name: "dropdown"} = assigns) do
    ~H"""
    <DocSiteWeb.DropdownExample.render />
    """
  end

  def render_component_example(%{name: "form"} = assigns) do
    ~H"""
    <DocSiteWeb.FormExample.render />
    """
  end

  def render_component_example(%{name: "icon"} = assigns) do
    ~H"""
    <DocSiteWeb.IconExample.render />
    """
  end

  def render_component_example(%{name: "input"} = assigns) do
    ~H"""
    <DocSiteWeb.InputExample.render />
    """
  end

  def render_component_example(%{name: "navbar"} = assigns) do
    ~H"""
    <DocSiteWeb.NavbarExample.render />
    """
  end

  def render_component_example(%{name: "radiogroup"} = assigns) do
    ~H"""
    <DocSiteWeb.RadioGroupExample.render />
    """
  end

  def render_component_example(%{name: "separator"} = assigns) do
    ~H"""
    <DocSiteWeb.SeparatorExample.render />
    """
  end

  def render_component_example(%{name: "spinner"} = assigns) do
    ~H"""
    <DocSiteWeb.SpinnerExample.render />
    """
  end

  def render_component_example(%{name: "table"} = assigns) do
    ~H"""
    <DocSiteWeb.TableExample.render />
    """
  end

  def render_component_example(%{name: "tabs"} = assigns) do
    ~H"""
    <DocSiteWeb.TabsExample.render />
    """
  end

  def render_component_example(%{name: "text"} = assigns) do
    ~H"""
    <DocSiteWeb.TextExample.render />
    """
  end

  def render_component_example(%{name: "textarea"} = assigns) do
    ~H"""
    <DocSiteWeb.TextAreaExample.render />
    """
  end

  def render_component_example(%{name: "toast"} = assigns) do
    ~H"""
    <DocSiteWeb.ToastExample.render />
    """
  end

  def render_component_example(%{name: "toggle"} = assigns) do
    ~H"""
    <DocSiteWeb.ToggleExample.render />
    """
  end

  def render_component_example(%{name: "tooltip"} = assigns) do
    ~H"""
    <DocSiteWeb.ToolTipExample.render />
    """
  end

  def render_component_example(%{name: "popover"} = assigns) do
    ~H"""
    <DocSiteWeb.PopoverExample.render />
    """
  end

  def render_component_example(%{name: name} = assigns) do
    ~H"""
    <p>Select a component</p>
    """
  end
end
