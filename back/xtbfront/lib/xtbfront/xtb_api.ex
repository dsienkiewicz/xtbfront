defmodule Xtbfront.XtbApi do
  use Supervisor

  def start_link(init_arg) do
    Supervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  @impl true
  def init(_init_arg) do
    children = [
      {XtbClient.Connection, connection_params()}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end

  defp connection_params() do
    %{
      app_name: "XtbFront",
      type: :demo,
      url: "wss://ws.xtb.com",
      user: Application.fetch_env!(:xtbfront, :xtb_user),
      password: Application.fetch_env!(:xtbfront, :xtb_passwd),
      options: [name: XtbFront.Connection]
    }
  end
end
