defmodule Twadmin.Repo do
  use Ecto.Repo,
    otp_app: :twadmin,
    adapter: Ecto.Adapters.Postgres
end
