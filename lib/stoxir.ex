defmodule Stoxir do
  @backend Stoxir.IEx

  defdelegate quote(symbol),         to: @backend
  defdelegate chart(symbol),         to: @backend
  defdelegate chart(symbol, period), to: @backend
  defdelegate company(symbol),       to: @backend
  defdelegate key_stats(symbol),     to: @backend, as: :stats
  defdelegate news(symbol),          to: @backend
  defdelegate news(symbol, last),    to: @backend
  defdelegate financials(symbol),    to: @backend
  defdelegate earnings(symbol),      to: @backend
  defdelegate logo(symbol),          to: @backend
  defdelegate price(symbol),         to: @backend
  defdelegate delayed_quote(symbol), to: @backend
end
