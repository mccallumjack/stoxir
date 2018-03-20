defmodule Stoxir.Mixfile do
  use Mix.Project

  @description """
    Simple wrapper for the IEx Trading Stocks API (https://iextrading.com/developer/docs/#stocks)
  """

  def project do
    [
      app: :stoxir,
      version: "0.1.2",
      elixir: "~> 1.6",
      description: @description,
      start_permanent: Mix.env == :prod,
      package: package(),
      deps: deps()

    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 1.0"},
      {:jason, "~> 1.0"},
      {:exvcr, "~> 0.10", only: :test},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp package do
    [
      maintainers: ["mccallumjack"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/mccallumjack/stoxir"}
    ]
  end

end
