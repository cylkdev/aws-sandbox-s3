defmodule AwsSandboxS3.MixProject do
  use Mix.Project

  def project do
    [
      app: :aws_sandbox_s3,
      version: "0.1.0",
      elixir: "~> 1.13.4",
      start_permanent: Mix.env() == :prod,
      description: "AWSSandboxS3 is a simple library to mock S3 api requests.",
      deps: deps(),
      docs: docs(),
      package: package(),
      test_coverage: [tool: ExCoveralls],
      dialyzer: [
        plt_add_apps: [:ex_unit, :mix, :credo],
        list_unused_filters: true,
        plt_local_path: "dialyzer",
        plt_core_path: "dialyzer"
      ],
      preferred_cli_env: [
        dialyzer: :test,
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
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
      {:ex_doc, "~> 0.27", only: :dev, runtime: false},
      {:sandbox_registry, "~> 0.1.1"}
    ]
  end

  defp package do
    [
      maintainers: ["Kurt Hogarth"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/cylkdev/aws-sandbox-s3.git"},
      files: ~w(mix.exs README.md CHANGELOG.md LICENSE lib)
    ]
  end

  defp docs do
    [
      main: "AWSSandboxS3",
      source_url: "https://github.com/cylkdev/aws-sandbox-s3.git"
    ]
  end
end
