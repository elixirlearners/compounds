defmodule Mix.Tasks.Compound.Gen do
  @moduledoc "Generates a compound module."
  @shortdoc "Generates a compound module."

  use Mix.Task

  @switches [
    card: :boolean,
    input: :boolean,
    toast: :boolean,
  ]

  @default_opts []

  @doc false
  @impl Mix.Task
  def run(args) do
    if Mix.Project.umbrella?() do
      Mix.raise(
        "mix compound.gen must be invoked from within your *_web application root directory"
      )
    end

    {:ok, opts, _args} = 
      args
      |> parse_args
      |> validate_args!
    opts
      |> Enum.each(&generate/1)
  end

  defp generate({:card, true}) do
    { result, _bindings } = 
      Path.join(get_templates_dir(), "card.ex")
      |> EEx.compile_file
      |> Code.eval_quoted(assigns: [function_name: "test"])
    project_name = 
    get_and_create_comp_dir()
    |> Path.join("/card.ex")
    |> File.write(result)
  end

  defp generate({:input, true}) do
    { result, _bindings } = 
      Path.join(get_templates_dir(), "input.ex")
      |> EEx.compile_file
      |> Code.eval_quoted(assigns: [function_name: "test"])
    project_name = 
    get_and_create_comp_dir()
    |> Path.join("/input.ex")
    |> File.write(result)
  end

  defp generate({:toast, true}) do
    { result, _bindings } = 
      Path.join(get_templates_dir(), "toast.ex")
      |> EEx.compile_file
      |> Code.eval_quoted(assigns: [function_name: "test"])
    project_name = 
    get_and_create_comp_dir()
    |> Path.join("/toast.ex")
    |> File.write(result)
  end

  defp get_root_dir, do: :code.priv_dir(Application.get_application(__MODULE__))
  defp get_templates_dir, do: get_root_dir() |> Path.join("/templates")

  defp get_and_create_comp_dir do
    file_path = get_comp_dir()
    if File.exists?(file_path) do
      file_path
    else
      File.mkdir_p!(file_path)
      file_path
    end
  end

  defp get_comp_dir do
    "lib/#{Keyword.get(Mix.Project.config(), :app)}_web/components/compounds" 
  end


  defp parse_args(args) do
    {parsed, args, _invalid} = OptionParser.parse(args, strict: @switches)
    merged_parsed =
      @default_opts
      |> Keyword.merge(parsed)
    {merged_parsed, args}
  end

  defp validate_args!({merged_parsed, args}) do
    {:ok, merged_parsed, args}
  end
end
