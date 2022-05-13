defmodule Xtbfront.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      XtbfrontWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Xtbfront.PubSub},
      # Start the Endpoint (http/https)
      XtbfrontWeb.Endpoint,
      # Start a worker by calling: Xtbfront.Worker.start_link(arg)
      # {Xtbfront.Worker, arg}
      Xtbfront.XtbApi
    ]

    inject_env_variables()

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Xtbfront.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    XtbfrontWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp inject_env_variables do
    Dotenvy.source([
      ".env",
      System.get_env()
    ])

    Application.put_env(:xtbfront, :xtb_user, Dotenvy.env!("XTB_API_USERNAME", :string!))
    Application.put_env(:xtbfront, :xtb_passwd, Dotenvy.env!("XTB_API_PASSWORD", :string!))
  end
end
