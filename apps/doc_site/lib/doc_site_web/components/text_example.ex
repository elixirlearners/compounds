defmodule DocSiteWeb.TextExample do
  @moduledoc """
  Example text component
  """
  use DocSiteWeb, :live_component

  alias DocSiteWeb.CoreComponents
  alias Compounds.Text

  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{})}
  end

  def render(assigns) do
    ~H"""
    <div class="flex flex-col">
      <Text.h1 type="primary">
        Big 'ol h1 tag with primary type
      </Text.h1>
      <Text.h2 type="secondary">
        "h2" tag text with secondary type
      </Text.h2>
      <Text.h3 type="tertiary">
        "h3" tag text with tertiary type
      </Text.h3>
      <Text.h4 type="error">
        "h4" tag text with error type
      </Text.h4>
      <Text.h5 type="warning">
        "h5" tag text with warning type
      </Text.h5>
      <Text.h6 type="success">
        "h6" tag text with success type
      </Text.h6>
      <Text.span>
        "span" the default tag text
      </Text.span>
      <Text.p>
        "p" tag text
      </Text.p>
      <Text.small>
        "small" tag text
      </Text.small>
      <Text.p bold>
        This is a bold "p" tag
      </Text.p>
      <Text.p italic>
        This is an italic "p" tag
      </Text.p>
      <Text.p bold italic>
        This is a bold & italic "p" tag
      </Text.p>
      <Text.q>
        "q" blockquote tag text
      </Text.q>
      <Text.details>
        <Text.summary>
          Summary
        </Text.summary>
        This is some details
      </Text.details>
      <Text.ul>
        <Text.li>
          This
        </Text.li>
        <Text.li>
          is an
        </Text.li>
        <Text.li bold>
          unorderd list
        </Text.li>
      </Text.ul>
      <Text.ol>
        <Text.li>
          This
        </Text.li>
        <Text.li>
          is an
        </Text.li>
        <Text.li bold>
          orderd list
        </Text.li>
      </Text.ol>
      <Text.pre>
        {"This is":
        "a pre tag"}
      </Text.pre>
      <Text.code>This is a code tag</Text.code>
    </div>
    """
  end
end
