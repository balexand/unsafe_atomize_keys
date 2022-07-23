defmodule UnsafeAtomizeKeys.MixProject do
  use Mix.Project

  def project do
    [
      app: :unsafe_atomize_keys,
      description: "Function to convert all binary keys to atoms in a map.",
      version: "1.1.1",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: [
        licenses: ["MIT"],
        links: %{"GitHub" => "https://github.com/balexand/unsafe_atomize_keys"}
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end
