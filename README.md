# AWSSandboxS3

The goal of this project is to make testing an S3 api easy and to ensure responses are isolated per test.

## Installation

This package can be installed by adding `aws_sandbox_s3` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:aws_sandbox_s3, "~> 0.1.0"}
  ]
end
```

The docs can be found at <https://hexdocs.pm/aws_sandbox_s3>.

## Sandboxing

For test isolation via the `AWSSandboxS3` to work, you must start it in your setup, or your test_helper.exs:

```elixir
# test/test_helper.exs

ExUnit.start()

# Add the line below:
AWSSandboxS3.start_link()
```