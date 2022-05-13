defmodule Xtbfront.Symbols do
  def get_all() do
    %{data: symbols} = XtbClient.Connection.get_all_symbols(XtbFront.Connection)
    symbols
  end

  def get_groups() do
    symbols = get_all()

    symbols
    |> Enum.map(& &1.group_name)
    |> Enum.uniq()
  end

  def get_categories() do
    symbols = get_all()

    symbols
    |> Enum.map(& &1.category_name)
    |> Enum.uniq()
  end
end
