defmodule Mix.Tasks.Compound.Gen do
  @moduledoc "Generates a compound module."
  @shortdoc "Generates a compound module."

  use Mix.Task

  @switches [
    all: :boolean,
    card: :boolean,
    input: :boolean,
    toast: :boolean
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

    if Keyword.has_key?(opts, :all) do
      generate_all(opts)
    else
      opts
      |> Enum.each(&generate_components/1)
    end
  end

  defp generate_all(opts) do
    if opts[:all] do
      for key <- Keyword.keys(@switches), key != :all do
        generate_components({key, true})
      end
    end
  end

  defp generate_components({:card, true}) do
    generate("card.ex", function_name: "test")
  end

  defp generate_components({:input, true}) do
    generate("input.ex", function_name: "test")
  end

  defp generate_components({:toast, true}) do
    generate("toast.ex", function_name: "test")
  end

  defp generate(template_file, _assigns) do
    result =
      Path.join(get_templates_dir(), template_file)
      |> File.read!()

    # |> EEx.compile_file
    # |> Code.eval_quoted(assigns: assigns)
    destination =
      get_and_create_comp_dir()
      |> Path.join(template_file)

    Mix.Shell.IO.info(
      "Creating " <> IO.ANSI.green() <> template_file <> IO.ANSI.reset() <> " at #{destination}"
    )

    if File.exists?(destination) do
      if Mix.Shell.IO.yes?("File #{destination} already exists, overwrite?") do
        File.write!(destination, result)
      end
    else
      File.write!(destination, result)
    end

    Mix.Shell.IO.info(IO.ANSI.green() <> "* " <> template_file <> IO.ANSI.reset() <> " created.")
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
