# UnsafeAtomizeKeys

[![Package](https://img.shields.io/hexpm/v/unsafe_atomize_keys.svg)](https://hex.pm/packages/unsafe_atomize_keys) [![Documentation](http://img.shields.io/badge/hex.pm-docs-green.svg?style=flat)](https://hexdocs.pm/unsafe_atomize_keys) ![CI](https://github.com/balexand/unsafe_atomize_keys/actions/workflows/elixir.yml/badge.svg)

Function to convert all binary keys to atoms in a map. Keys of other types will be left unchanged.
The conversion will deeply traverse nested maps and lists.

The name "unsafe" refers to the fact that atoms in Elixir/Erlang are not garbage collected. If
this function is called on maps with an unbounded number of keys then system resources could be
depleted. This is intended for use when calling trusted APIs that will have a finite number of
unique keys.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `unsafe_atomize_keys` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:unsafe_atomize_keys, "~> 1.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/unsafe_atomize_keys](https://hexdocs.pm/unsafe_atomize_keys).
