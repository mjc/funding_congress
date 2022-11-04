defmodule FundingCongress.Repo.Migrations.CreateRepresentatives do
  use Ecto.Migration

  def change do
    create table(:representatives) do
      add :cid, :string
      add :first_name, :string
      add :last_name, :string
      add :party, :string

      timestamps()
    end
  end
end
