defmodule CompoundsTester.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CompoundsTesterWeb.Telemetry,
      CompoundsTester.Repo,
      {DNSCluster, query: Application.get_env(:compounds_tester, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: CompoundsTester.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: CompoundsTester.Finch},
      # Start a worker by calling: CompoundsTester.Worker.start_link(arg)
      # {CompoundsTester.Worker, arg},
      # Start to serve requests, typically the last entry
      CompoundsTesterWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CompoundsTester.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CompoundsTesterWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
