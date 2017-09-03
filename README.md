# Stoxir

Stoxir is a client library for the [IEx Trading Stocks API](https://iextrading.com/developer/docs/#stocks)

## Installation

The package can be installed by adding `stoxir` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:stoxir, "~> 0.1.0"}
  ]
end
```

## Usage

#### Quote
```elixir
iex(1)> Stoxir.quote("AAPL")
[avg_total_volume: 26303703, calculation_price: "close", change: "N/A",
change_percent: "N/A", company_name: "Apple Inc.", delayed_price: 163.97,
delayed_price_time: 1504299599152, latest_price: nil, latest_source: "N/A",
latest_time: "N/A", latest_volume: 16559979, market_cap: "N/A",
pe_ratio: "N/A", previous_close: "N/A",
primary_exchange: "Nasdaq Global Select", sector: "Technology", symbol: "AAPL",
week52_high: 164.94, week52_low: nil, ytd_change: 0.412397761515282]
```

#### Chart
```elixir
iex(2)> Stoxir.chart("AAPL")
[[change: -0.77, change_over_time: 0, change_percent: -0.515, close: 148.73,
  date: "2017-07-31", high: 150.33, label: "Jul 31", low: 148.13, open: 149.9,
  unadjusted_close: 148.73, unadjusted_volume: 19845920, volume: 19845920,
  vwap: 148.9056],
 [change: 9.86, change_over_time: 0.06629462784912267, change_percent: 6.629,
  close: 158.59, date: "2017-08-01", high: 158.92, label: "Aug 1",
  low: 156.6701, open: 157.06, unadjusted_close: 158.59,
  unadjusted_volume: 21194042, volume: 21194042, vwap: 157.9816],
etc....

# Chart can be passed a period. Period must be one of 1d, 1m, 3m, 6m, ytd, 1y, 2y, 5
iex(4)> Stoxir.chart("AAPL", "1m")
[[change: -0.77, change_over_time: 0, change_percent: -0.515, close: 148.73,
  date: "2017-07-31", high: 150.33, label: "Jul 31", low: 148.13, open: 149.9,
  unadjusted_close: 148.73, unadjusted_volume: 19845920, volume: 19845920,
  vwap: 148.9056],
 [change: 9.86, change_over_time: 0.06629462784912267, change_percent: 6.629,
  close: 158.59, date: "2017-08-01", high: 158.92, label: "Aug 1",
  low: 156.6701, open: 157.06, unadjusted_close: 158.59,
  unadjusted_volume: 21194042, volume: 21194042, vwap: 157.9816],
etc...
```

#### Company
```elixir
iex(5)> Stoxir.company("AAPL")
[ceo: "Timothy D. Cook", company_name: "Apple Inc.",
 description: "Apple Inc is an American multinational technology company. It designs, manufactures, and markets mobile communication and media devices, personal computers, and portable digital music players.",
 exchange: "Nasdaq Global Select", industry: "Computer Hardware",
 issue_type: "cs", sector: "Technology", symbol: "AAPL",
 website: "http://www.apple.com"]
```

#### Key Stats
```elixir
iex(6)> Stoxir.key_stats("AAPL")
[eps_surprise_dollar: "N/A", week52high: 164.52, debt: 381442000000,
 ytd_change_percent: 0.412397761515282, insider_percent: "N/A",
 ex_dividend_date: "2017-08-10 00:00:00.0", return_on_assets: 14.15,
 company_name: "Apple Inc.", year1_change_percent: 0.546182846371348,
 price_to_sales: 3.7900262, month3_change_percent: 0.07390678188007345,
 ebitda: 74688000000, short_date: "2017-08-15", day200_moving_avg: 137.77939,
 number_of_estimates: 14, profit_margin: 20.73, revenue_per_share: 43,
 month1_change_percent: 0.10300544611040155, gross_profit: 86068000000,
 month6_change_percent: 0.1975326666180013,
 year5_change_percent: 0.7013363865087812, pe_ratio_high: "N/A",
 consensus_eps: 2.02, return_on_capital: "N/A", day50_moving_avg: 152.9643,
 float: 5155519365, dividend_yield: 1.5365853, short_ratio: 1.5008535,
 return_on_equity: 35.53, eps_surprise_percent: 3.9604, dividend_rate: 2.52,
 latest_eps: 8.29, institution_percent: 61.7, cash: 271467000000,
 short_interest: 39117077, latest_eps_date: "2016-09-30",
 day5_change_percent: 0.01597820028488272, revenue_per_employee: 1926784,
 revenue: 223507000000, week52low: 102.53,
 year2_change_percent: 0.4548598793898546, symbol: "AAPL",
 marketcap: 847097392000, ttm_eps: 8.55, pe_ratio_low: "N/A", beta: 1.267958,
 week52change: 57.297897, shares_outstanding: 5165228000, price_to_book: 6.4]
```

#### News
```elixir
iex(7)> Stoxir.news("AAPL")
[[datetime: "2017-09-02T10:56:00-04:00",
  headline: "Huawei launches its first A.I. mobile chip with Apple reportedly set to enter market",
  related: "AAPL,GOOGL", source: "CNBC", summary: "No summary available.",
  url: "https://api.iextrading.com/1.0/stock/aapl/article/5799056297769865"],
 [datetime: "2017-09-01T15:35:00-04:00",
  headline: "Alibaba vs Amazon: The race to $500 billion",
  related: "AAPL,AMZN,BABA,T,TSLA", source: "CNBC",
  summary: "No summary available.",
  url: "https://api.iextrading.com/1.0/stock/aapl/article/6986780013466879"],
etc..]

# News can be passed a range - default is 10
ex(8)> Stoxir.news("AAPL", 1)
[[datetime: "2017-09-02T10:56:00-04:00",
  headline: "Huawei launches its first A.I. mobile chip with Apple reportedly set to enter market",
  related: "AAPL,GOOGL", source: "CNBC", summary: "No summary available.",
  url: "https://api.iextrading.com/1.0/stock/aapl/article/5799056297769865"]]
```

#### Financials
```elixir
iex(9)> Stoxir.financials("AAPL")
[[cash_change: 3414000000, cash_flow: 8363000000, cost_of_revenue: 27920000000,
  current_assets: 112875000000, current_cash: 18571000000,
  current_debt: 18475000000, gross_profit: 17488000000, net_income: 8717000000,
  operating_expense: 6720000000, operating_gains_losses: "N/A",
  operating_income: 10768000000, operating_revenue: 45408000000,
  report_date: "2017-06-30", research_and_development: 2937000000,
  shareholder_equity: 132425000000, total_assets: 345173000000,
  total_cash: 76759000000, total_debt: 108339000000,
  total_liabilities: 212748000000, total_revenue: 45408000000],
etc...]
```

#### Earnings
```elixir
iex(10)> Stoxir.earnings("AAPL")
[[eps_report_date: "2017-08-01", eps_surprise_dollar: 0.1, actual_eps: 1.67,
  announce_time: "AMC", consensus_eps: 1.57, estimated_eps: 1.57,
  fiscal_end_date: "2017-06-30", fiscal_period: "Q3 2017",
  number_of_estimates: 13],
 [eps_report_date: "2017-05-02", eps_surprise_dollar: 0.08, actual_eps: 2.1,
  announce_time: "AMC", consensus_eps: 2.02, estimated_eps: 2.02,
  fiscal_end_date: "2017-03-31", fiscal_period: "Q2 2017",
  number_of_estimates: 14],
etc...]
```

#### Logo
```elixir
iex(11)> Stoxir.logo("AAPL")
[url: "https://storage.googleapis.com/iex/api/logos/AAPL.png"]
```

#### Price
```elixir
iex(12)> Stoxir.price("AAPL")
164.05
```

#### Delayed Quote
```elixir
iex(13)> Stoxir.delayed_quote("AAPL")
[delayed_price: 163.97, delayed_price_time: 1504299599152, delayed_size: 25,
 processed_time: 1504300501064, symbol: "AAPL"]
```

## Misc

IEx states the following in their documentation:

```
We’re building an app using the stocks endpoints. Stocks will come out of Beta when our app launches.
The data provided here is sourced from IEX and multiple third-party sources. 
IEX does not make any guarantees, representations or warranties as to the completeness or accuracy of the data provided.
```

## Contributing

Start by forking the repo, then run:

`MIX_ENV=test mix do deps.get, test`

Pull requests are always welcome
