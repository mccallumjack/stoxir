defmodule Stoxir.IEx do
  @moduledoc false
  import Stoxir.Api

  @simple_methods ~w(quote chart company stats news logo price delayed_quote)a

  for method <- @simple_methods do
    def unquote(method)(symbol) do
      get("#{symbol}/#{unquote(method) |> to_string |> String.replace("_", "-")}")
    end
  end

  def chart(symbol, period) when period in ~w(1d 1m 3m 6m ytd 1y 2y 5w) do
    get("#{symbol}/chart/#{period}")
  end
  def chart(_symbol, _period), do: {:error, "Period must be one of 1d, 1m, 3m, 6m, ytd, 1y, 2y, 5w"}

  def news(symbol, last) when last in (1..50) do
    get("#{symbol}/news/last/#{last}")
  end
  def news(_symbol, _last), do: {:error, "Last must be between 1 and 50"}

  def financials(symbol) do
    get_with_root("#{symbol}/financials", :financials)
  end

  def earnings(symbol) do
    get_with_root("#{symbol}/earnings", :earnings)
  end
end
