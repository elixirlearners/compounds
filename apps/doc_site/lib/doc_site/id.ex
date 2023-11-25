defmodule Compounds.Id do
  @moduledoc """
  This is a simple utility to make semi-unique ID's for HTML elements

  This algo does not guarantee that there will never be a naming collision

  Use the labeled version to decrease the risk
  """
  @alphanum "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
  @alpha "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"

  @spec make_id(String.t(), integer()) :: String.t()
  def make_id(seed_string, size) do
    List.duplicate(nil, size)
    |> Enum.map(fn _ -> String.at(seed_string, :rand.uniform(String.length(seed_string) - 1)) end)
    |> List.to_string()
  end

  @doc """
  Generates an ID with a label prepended
  """
  @spec generate(String.t()) :: String.t()
  def generate(label) do
    label <> "-" <> make_id(@alphanum, 9)
  end

  @doc """
  Generates an ID
  """
  @spec generate() :: String.t()
  def generate() do
    make_id(@alpha, 16)
  end
end
