defmodule Twadmin.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the PubSub system
      {Phoenix.PubSub, name: Twadmin.PubSub},
      # Start the Endpoint (http/https)
      TwadminWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: Twadmin.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    TwadminWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
