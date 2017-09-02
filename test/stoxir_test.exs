defmodule StoxirTest do
  use ExUnit.Case
  doctest Stoxir
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    HTTPoison.start
  end

  test "quote" do
    use_cassette "iex_quote" do
      body = Stoxir.quote("AAPL")
      assert body[:symbol] == "AAPL"
      assert body[:company_name] == "Apple Inc."
    end
  end

  test "chart - default" do
    use_cassette "iex_default_chart" do
      [sample_week | _tail] = Stoxir.chart("AAPL")
      assert is_number(sample_week[:change])
      assert is_binary(sample_week[:label])
    end
  end

  test "chart - period" do
    use_cassette "iex_period_chart" do
      [sample_week | _tail] = Stoxir.chart("AAPL", "1m")
      assert is_number(sample_week[:change])
      assert is_binary(sample_week[:label])
    end
  end

  test "chart - invalid period" do
    assert {:error, _} = Stoxir.chart("AAPL", "3d")
  end

  test "company" do
    use_cassette "iex_company" do
      body = Stoxir.company("AAPL")
      assert body[:symbol] == "AAPL"
      assert body[:company_name] == "Apple Inc."
    end
  end

  test "key_stats" do
    use_cassette "iex_key_stats" do
      body = Stoxir.key_stats("AAPL")
      assert body[:symbol] == "AAPL"
      assert is_number(body[:debt])
    end
  end

  test "news - default" do
    use_cassette "iex_default_news" do
      [sample_week | _tail] = Stoxir.news("AAPL")
      assert is_binary(sample_week[:headline])
      assert is_binary(sample_week[:summary])
    end
  end

  test "news - period" do
    use_cassette "iex_period_news" do
      [sample_week | _tail] = Stoxir.news("AAPL", 1)
      assert is_binary(sample_week[:headline])
      assert is_binary(sample_week[:summary])
    end
  end

  test "financials" do
    use_cassette "iex_financials" do
      body = Stoxir.financials("AAPL")
      sample_financials = List.first(body)

      assert is_number(sample_financials[:total_liabilities])
      assert is_binary(sample_financials[:report_date])
    end
  end

  test "earnings" do
    use_cassette "iex_earnings" do
      body = Stoxir.earnings("AAPL")
      sample_earnings = List.first(body)

      assert is_number(sample_earnings[:actual_eps])
      assert is_binary(sample_earnings[:announce_time])
    end
  end

  test "logo" do
    use_cassette "iex_logo" do
      body = Stoxir.logo("AAPL")
      assert body[:url] == "https://storage.googleapis.com/iex/api/logos/AAPL.png"
    end
  end

  test "price" do
    use_cassette "iex_price" do
      price = Stoxir.price("AAPL")
      assert is_number(price)
    end
  end

  test "delayed_quote" do
    use_cassette "iex_delayed_quote" do
      body = Stoxir.delayed_quote("AAPL")
      assert body[:symbol] == "AAPL"
      assert is_number(body[:delayed_price])
    end
  end
end
