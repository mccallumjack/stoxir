defmodule Stoxir do
  @api Stoxir.IEx
  defdelegate quote(symbol),         to: @api
  defdelegate chart(symbol),         to: @api
  defdelegate chart(symbol, period), to: @api
  defdelegate company(symbol),       to: @api
  defdelegate key_stats(symbol),     to: @api
  defdelegate news(symbol),          to: @api
  defdelegate news(symbol, last),    to: @api
  defdelegate financials(symbol),    to: @api
  defdelegate earnings(symbol),      to: @api
  defdelegate logo(symbol),          to: @api
  defdelegate price(symbol),         to: @api
  defdelegate price(symbol),         to: @api
end
