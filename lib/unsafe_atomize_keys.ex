defmodule UnsafeAtomizeKeys do
  @doc """
  Function to convert all binary keys to atoms in a map. Keys of other types will be left
  unchanged. The conversion will deeply traverse nested maps and lists. See README for explanation
  of why this function is "unsafe".

  The optional `func` argument is a function that accepts a string and performs some kind of
  transformation on that string.

  ## Examples

    iex> unsafe_atomize_keys(%{"a" => "b", :c => "d"})
    %{a: "b", c: "d"}

    iex> unsafe_atomize_keys(%{"deep" => %{"key" => "value"}})
    %{deep: %{key: "value"}}

    iex> unsafe_atomize_keys(%{"list" => [%{"key" => "value"}]})
    %{list: [%{key: "value"}]}

    iex> unsafe_atomize_keys(%{"theKey" => "b", :c => "d"}, &Macro.underscore/1)
    %{the_key: "b", c: "d"}
  """
  def unsafe_atomize_keys(%{} = map, func \\ &Function.identity/1) when is_function(func) do
    deep_atomize(map, func)
  end

  defp deep_atomize(%{} = map, func) do
    Map.new(map, fn
      {k, v} when is_binary(k) ->
        {k |> func.() |> String.to_atom(), deep_atomize(v, func)}

      {k, v} ->
        {k, deep_atomize(v, func)}
    end)
  end

  defp deep_atomize(list, func) when is_list(list) do
    Enum.map(list, &deep_atomize(&1, func))
  end

  defp deep_atomize(v, _func), do: v
end
