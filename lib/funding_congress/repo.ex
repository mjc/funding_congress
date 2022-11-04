defmodule FundingCongress.Repo do
  use Ecto.Repo,
    otp_app: :funding_congress,
    adapter: Ecto.Adapters.Postgres
end
