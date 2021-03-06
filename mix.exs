defmodule Retry.Mixfile do
  use Mix.Project

  def project do
    [
      app: :retry,
      name: "retry",
      description:
        "Simple Elixir macros for linear retry, exponential backoff and wait with composable delays.",
      version: "0.11.2",
      elixir: "~> 1.5",
      source_url: "https://github.com/safwank/ElixirRetry",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        credo: :test,
        "coveralls.html": :test,
        commit: :test
      ],
      aliases: [
        commit: ["dialyzer", "credo --strict", "coveralls.html --trace"]
      ],
      default_task: "commit"
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:credo, "~> 0.10", only: :test},
      {:excoveralls, "~> 0.10", only: :test},
      {:dialyxir, "~> 0.5", only: [:dev, :test]},
      {:ex_doc, "~> 0.19", only: :dev},
      {:earmark, "~> 1.2", only: :dev}
    ]
  end

  defp package do
    [
      maintainers: ["Safwan Kamarrudin"],
      licenses: ["Apache 2.0"],
      links: %{github: "https://github.com/safwank/ElixirRetry"}
    ]
  end
end
