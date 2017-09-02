# Stoxir

Stoxir is a CLI stock and portfolio management tool written in Elixir.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `stoxir` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:stoxir, "~> 0.1.0"}
  ]
end
```

## Usage

#### Getting Stock Information

```elixir
Stoxir.search "Tesla"

Stoxir.quote "TSLA"
```
