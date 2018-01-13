defmodule Stoxir.Api do
  @moduledoc false
  @endpoint "https://api.iextrading.com/1.0/stock/"

  def get(path), do: get(path, {})
  def get(path, _options) do
    @endpoint <> path
    |> HTTPoison.get
    |> handle_response
    |> process_response_body
  end

  def get_with_root(path, root) do
    get(path)[root]
    |> decode_body
  end

  defp handle_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}), do: {:ok, body}
  defp handle_response({:ok, %HTTPoison.Response{status_code: 404, body: body}}), do: {:error, body}

  defp process_response_body({:error, body}), do: {:error, body}
  defp process_response_body({:ok, body}) do
    body
    |> Poison.decode!
    |> decode_body
  end

  defp decode_body({key, map}) when is_atom(key),    do: decode_body(map)
  defp decode_body(body)       when is_number(body), do: body
  defp decode_body(body)       when is_map(body),    do: Enum.map(body, fn({k, v}) -> {k |> underscore |> String.to_atom, v} end) |> Enum.into(%{})
  defp decode_body(body)       when is_list(body),   do: Enum.map(body, &(decode_body &1))

  defp underscore(camelCase), do: Macro.underscore(camelCase)
end
