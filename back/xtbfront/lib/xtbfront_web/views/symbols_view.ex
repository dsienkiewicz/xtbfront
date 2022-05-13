defmodule XtbfrontWeb.SymbolsView do
  use XtbfrontWeb, :view

  alias XtbfrontWeb.SymbolsView

  def render("index.json", %{symbols: symbols}) do
    render_many(symbols, SymbolsView, "list-item.json", as: :item)
  end

  def render(
        "list-item.json",
        %{item: item}
      ) do
    %{
      symbol: item.symbol,
      group_name: item.group_name,
      category_name: item.category_name,
      description: item.description
    }
  end

  def render(
        "show.json",
        %{item: item}
      ) do
    %{
      ask: item.ask,
      bid: item.bid,
      category_name: item.category_name,
      contract_size: item.contract_size,
      currency: item.currency,
      currency_pair: item.currency_pair,
      currency_profit: item.currency_profit,
      description: item.description,
      expiration: item.expiration,
      group_name: item.group_name,
      high: item.high,
      initial_margin: item.initial_margin,
      instant_max_volume: item.instant_max_volume,
      leverage: item.leverage,
      long_only: item.long_only,
      lot_max: item.lot_max,
      lot_min: item.lot_min,
      lot_step: item.lot_step,
      low: item.low,
      margin_hedged: item.margin_hedged,
      margin_hedged_strong: item.margin_hedged_strong,
      margin_maintenance: item.margin_maintenance,
      margin_mode: item.margin_mode,
      percentage: item.percentage,
      pips_precision: item.pips_precision,
      precision: item.precision,
      profit_mode: item.profit_mode,
      quote_id: item.quote_id,
      short_selling: item.short_selling,
      spread_raw: item.spread_raw,
      spread_table: item.spread_table,
      starting: item.starting,
      step_rule_id: item.step_rule_id,
      stops_level: item.stops_level,
      swap_rollover_3_days: item.swap_rollover_3_days,
      swap_enable: item.swap_enable,
      swap_long: item.swap_long,
      swap_short: item.swap_short,
      swap_type: item.swap_type,
      symbol: item.symbol,
      tick_size: item.tick_size,
      tick_value: item.tick_value,
      time: item.time,
      time_string: item.time_string,
      trailing_enabled: item.trailing_enabled,
      type: item.type
    }
  end
end
