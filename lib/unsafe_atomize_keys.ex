defmodule UnsafeAtomizeKeys do
  @doc """
  Function to convert all binary keys to atoms in a map. Keys of other types will be left
  unchanged. The conversion will deeply traverse nested maps and lists. See README for explanation
  of why this function is "unsafe".

  ## Examples

    iex> unsafe_atomize_keys(%{"a" => "b", :c => "d"})
    %{a: "b", c: "d"}

    iex> unsafe_atomize_keys(%{"deep" => %{"key" => "value"}})
    %{deep: %{key: "value"}}

    iex> unsafe_atomize_keys(%{"list" => [%{"key" => "value"}]})
    %{list: [%{key: "value"}]}
  """
  def unsafe_atomize_keys(%{} = map) do
    deep_atomize(map)
  end

  defp deep_atomize(%{} = map) do
    map
    |> Enum.map(fn
      {k, v} when is_binary(k) ->
        {String.to_atom(k), deep_atomize(v)}

      {k, v} ->
        {k, deep_atomize(v)}
    end)
    |> Map.new()
  end

  defp deep_atomize(list) when is_list(list) do
    Enum.map(list, &deep_atomize/1)
  end

  defp deep_atomize(v), do: v
end
