defmodule Stoxir do
  @moduledoc """
  Provides an interface to the IEx Trading Stocks API (https://iextrading.com/developer/docs/#stocks)
  """
  alias Stoxir.IEx

  @doc """
  GET /symbol/quote

  ## Examples

      Stoxir.quote("AAPL")

  ## Reference
  https://iextrading.com/developer/docs/#quote
  """
  @spec quote(binary) :: [key: binary | number]
  defdelegate quote(symbol), to: IEx

  @doc """
  GET /symbol/chart

  ## Examples

      Stoxir.chart("AAPL")

  ## Reference
  https://iextrading.com/developer/docs/#chart
  """
  @spec chart(binary) :: [key: binary | number]
  defdelegate chart(symbol), to: IEx

  @doc """
  GET /symbol/chart/period

  ## Examples

      Stoxir.chart("AAPL", "5y")

  ## Reference
  https://iextrading.com/developer/docs/#chart
  """
  @spec chart(binary, binary) :: [key: binary | number]
  defdelegate chart(symbol, period), to: IEx

  @doc """
  GET /symbol/company

  ## Examples

      Stoxir.company("AAPL")

  ## Reference
  https://iextrading.com/developer/docs/#company
  """
  @spec company(binary) :: [key: binary | number]
  defdelegate company(symbol), to: IEx

  @doc """
  GET /symbol/stats

  ## Examples

      Stoxir.key_stats("AAPL")

  ## Reference
  https://iextrading.com/developer/docs/#key-stats
  """
  @spec key_stats(binary) :: [key: binary | number]
  defdelegate key_stats(symbol), to: IEx, as: :stats

  @doc """
  GET /symbol/news

  ## Examples

      Stoxir.news("AAPL")

  ## Reference
  https://iextrading.com/developer/docs/#news
  """
  @spec news(binary) :: [key: binary | number]
  defdelegate news(symbol), to: IEx

  @doc """
  GET /symbol/news/range

  ## Examples

      Stoxir.news("AAPL", 5)

  ## Reference
  https://iextrading.com/developer/docs/#news
  """
  @spec news(binary, number) :: [key: binary | number]
  defdelegate news(symbol, last), to: IEx

  @doc """
  GET /symbol/financials

  ## Examples

      Stoxir.financials("AAPL")

  ## Reference
  https://iextrading.com/developer/docs/#financials
  """
  @spec financials(binary) :: [key: binary | number]
  defdelegate financials(symbol), to: IEx

  @doc """
  GET /symbol/earnings

  ## Examples

      Stoxir.earnings("AAPL")

  ## Reference
  https://iextrading.com/developer/docs/#earnings
  """
  @spec earnings(binary) :: [key: binary | number]
  defdelegate earnings(symbol), to: IEx

  @doc """
  GET /symbol/logo

  ## Examples

      Stoxir.logo("AAPL")

  ## Reference
  https://iextrading.com/developer/docs/#logo
  """
  @spec logo(binary) :: [key: binary]
  defdelegate logo(symbol), to: IEx

  @doc """
  GET /symbol/price

  ## Examples

      Stoxir.price("AAPL")

  ## Reference
  https://iextrading.com/developer/docs/#price
  """
  @spec price(binary) :: number
  defdelegate price(symbol), to: IEx

  @doc """
  GET /symbol/delayed-quote

  ## Examples

      Stoxir.delayed_quote("AAPL")

  ## Reference
  https://iextrading.com/developer/docs/#delayed-quote
  """
  @spec delayed_quote(binary) :: [key: binary | number]
  defdelegate delayed_quote(symbol), to: IEx
end
