defmodule Stoxir.IEx do
  @endpoint "https://api.iextrading.com/1.0/stock/"
  @simple_methods ~w(quote chart company key_stats news financials earnings logo price delayed_quote)a

  for method <- @simple_methods do
    def unquote(method)(symbol) do
      get("#{symbol}/#{unquote(method) |> String.replace("_", "-")}")
    end
  end

  def chart(symbol, period) do
    get("#{symbol}/chart/#{period}")
  end

  def news(symbol, last) when last in (1..50) do
    get("#{symbol}/news/last/#{last}")
  end

  def news(_symbol, _last) do
    {:error, "Last must be between 1 and 50"}
  end

  defp get(path), do: get(path, {})
  defp get(path, _options) do
    @endpoint <> path
    |> HTTPoison.get
    |> handle_response
    |> process_response_body
  end

  defp handle_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}), do: {:ok, body}

  defp process_response_body({:ok, body}) do
    body
    |> Poison.decode!
    |> decode_body
  end

  defp decode_body(body) when is_map(body), do: Enum.map(body, fn({k, v}) -> {String.to_atom(k), v} end)
  defp decode_body(body) when is_list(body), do: Enum.map(body, &(decode_body &1))
end
