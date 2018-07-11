defmodule Flames.Mixfile do
  use Mix.Project

  def project do
    [
      app: :flames,
      version: "0.1.0",
      deps: deps(),
      elixir:  "~> 1.4",
      package: package(),
      description: "Boilerplate for Phoenix 1.3 applications",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
    ]
  end

  defp package do
    [
      name: :flames,
      files: ["lib", "mix.exs", "README.md", "LICENSE.md", "template"],
      maintainers: ["Daniel Berkompas <daniel@infinite.red>"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/danbruder/flames",
      }
    ]
  end

  defp deps do
    [
      {:mix_templates, "> 0.0.0",  app: false},
      {:ex_doc, "> 0.0.0",  only: [:dev, :test]},
    ]
  end
end
