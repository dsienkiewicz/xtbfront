defmodule XtbfrontWeb.SymbolCategoriesView do
  use XtbfrontWeb, :view

  alias XtbfrontWeb.SymbolCategoriesView

  def render("index.json", %{categories: categories}) do
    render_many(categories, SymbolCategoriesView, "category.json", as: :item)
  end

  def render(
        "category.json",
        %{item: item}
      ) do
    %{
      symbol: item
    }
  end
end
