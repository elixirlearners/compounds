defmodule Compounds.Id do
  @chars "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
  @length 6

  @spec generate(String.t()) :: String.t()
  def generate(label) do
    id =
      List.duplicate(nil, @length)
      |> Enum.map(fn _ -> String.at(@chars, :rand.uniform(String.length(@chars) - 1)) end)
      |> List.to_string()

    label <> "-" <> id
  end
end
