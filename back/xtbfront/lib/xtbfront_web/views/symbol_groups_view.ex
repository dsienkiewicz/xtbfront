defmodule XtbfrontWeb.SymbolGroupsView do
  use XtbfrontWeb, :view

  alias XtbfrontWeb.SymbolGroupsView

  def render("index.json", %{groups: groups}) do
    render_many(groups, SymbolGroupsView, "group.json", as: :item)
  end

  def render(
        "group.json",
        %{item: item}
      ) do
    %{
      symbol: item
    }
  end
end
