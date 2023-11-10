defmodule CompoundsTester.Repo do
  use Ecto.Repo,
    otp_app: :compounds_tester,
    adapter: Ecto.Adapters.Postgres
end
