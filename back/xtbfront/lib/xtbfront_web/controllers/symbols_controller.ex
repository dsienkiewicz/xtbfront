defmodule XtbfrontWeb.SymbolsController do
  use XtbfrontWeb, :controller

  alias Xtbfront.Symbols

  def index(
        conn,
        %{
          "_start" => start_page,
          "_end" => end_page,
          "_sort" => sort_column,
          "_order" => sort_order
        } = params
      ) do
    symbols = Symbols.get_all()

    start_page = String.to_integer(start_page)
    end_page = String.to_integer(end_page)

    sort_column = map_column_name(sort_column)
    sort_order = map_sort_order(sort_order)

    filters = prepare_filters(params)

    filtered_symbols =
      symbols
      |> Enum.filter(&apply_filters(&1, filters))

    total = Enum.count(filtered_symbols) |> to_string()

    result =
      filtered_symbols
      |> Enum.sort_by(&Map.get(&1, sort_column), sort_order)
      |> Enum.drop(start_page)
      |> Enum.take(end_page - start_page)

    conn
    |> put_resp_header("X-Total-Count", total)
    |> render("index.json", symbols: result)
  end

  def index(
        conn,
        %{
          "_start" => _start_page,
          "_end" => _end_page
        } = params
      ) do
    index(conn, Map.merge(params, %{"_sort" => "symbol", "_order" => "asc"}))
  end

  def show(conn, %{"id" => id} = _params) do
    symbol =
      Symbols.get_all()
      |> Enum.find(&(&1.symbol == id))

    conn
    |> render("show.json", item: symbol)
  end

  defp map_column_name(sort_column) do
    case sort_column do
      "symbol" -> :symbol
      "groupName" -> :group_name
      "categoryName" -> :category_name
      "description" -> :description
      _ -> :symbol
    end
  end

  defp map_sort_order(sort_order) do
    case sort_order do
      "asc" -> :asc
      "desc" -> :desc
      _ -> :asc
    end
  end

  defp prepare_filters(filters) do
    filters
    |> Enum.filter(fn {key, _value} -> String.starts_with?(key, "$.") end)
    |> Enum.map(fn {"$." <> key, value} -> {map_column_name(key), value} end)
    |> Enum.into(%{})
  end

  defp apply_filters(item, filters) do
    filters
    |> Enum.map(fn {key, value} -> value == Map.get(item, key) end)
    |> Enum.all?()
  end
end
