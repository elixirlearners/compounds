defmodule Compounds.Spinner do
  use Phoenix.Component

  @moduledoc """
    An iOS-esque spinner component.

    Style from https://codepen.io/vdel26/pen/DOXzEo
    By: victordg
  """

  attr :color, :string, default: "#71717a"
  attr :class, :string, default: nil
  attr :blade_width, :string, default: "4%"
  attr :blade_height, :string, default: "16%"
  attr :blade_round, :string, default: "20px"
  attr :opacity_start, :string, default: "1"
  attr :opacity_end, :string, default: "0.25"
  attr :rest, :global

  def spinner(assigns) do
    assigns = assign(assigns, :spinner_class, Compounds.Id.generate("spinner"))

    ~H"""
    <style>
      div.<%= @spinner_class %> div {
      width: <%= @blade_width %>;
      height: <%= @blade_height %>;
      background: <%= @color %>;
      position: absolute;
      left: 49%;
      top: 43%;
      opacity: 0;
      -webkit-border-radius: <%= @blade_round %>;
      -webkit-box-shadow: 0 0 3px rgba(0,0,0,0.2);
      -webkit-animation: fade 1s linear infinite;
      }

      @-webkit-keyframes fade {
      from {opacity: <%= @opacity_start %>;}
      to {opacity: <%= @opacity_end %>;}
      }
    </style>
    <!-- The compounds-spinner class applies the CSS -->
    <div
      class={Tails.classes(["#{@spinner_class} compounds-spinner w-10 h-10 relative", @class])}
      {@rest}
    >
      <div class="compounds-bar1" />
      <div class="compounds-bar2" />
      <div class="compounds-bar3" />
      <div class="compounds-bar4" />
      <div class="compounds-bar5" />
      <div class="compounds-bar6" />
      <div class="compounds-bar7" />
      <div class="compounds-bar8" />
      <div class="compounds-bar9" />
      <div class="compounds-bar10" />
      <div class="compounds-bar11" />
      <div class="compounds-bar12" />
    </div>
    """
  end
end
