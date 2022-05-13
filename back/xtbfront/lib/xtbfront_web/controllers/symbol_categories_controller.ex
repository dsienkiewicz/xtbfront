defmodule XtbfrontWeb.SymbolCategoriesController do
  use XtbfrontWeb, :controller

  alias Xtbfront.Symbols

  def index(
        conn,
        %{
          "_start" => start_page,
          "_end" => end_page,
          "_order" => sort_order
        } = _params
      ) do
    categories = Symbols.get_categories()
    total = Enum.count(categories) |> to_string()

    start_page = String.to_integer(start_page)
    end_page = String.to_integer(end_page)

    sort_order = map_sort_order(sort_order)

    categories =
      categories
      |> Enum.sort(sort_order)
      |> Enum.drop(start_page)
      |> Enum.take(end_page - start_page)

    conn
    |> put_resp_header("X-Total-Count", total)
    |> render("index.json", categories: categories)
  end

  defp map_sort_order(sort_order) do
    case sort_order do
      "asc" -> :asc
      "desc" -> :desc
      _ -> :asc
    end
  end
end
