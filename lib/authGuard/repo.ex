defmodule AuthGuard.Repo do
  use Ecto.Repo,
    otp_app: :authGuard,
    adapter: Ecto.Adapters.Postgres
end
