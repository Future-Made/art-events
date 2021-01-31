defmodule FutureMade.Repo do
  use Ecto.Repo,
    otp_app: :future_made,
    adapter: Ecto.Adapters.Postgres
end
