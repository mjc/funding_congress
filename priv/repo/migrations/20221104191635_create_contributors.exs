defmodule FundingCongress.Repo.Migrations.CreateContributors do
  use Ecto.Migration

  def change do
    create table(:contributors) do
      add :name, :string
      add :total, :integer
      add :pac_contributions, :integer
      add :individual_contributions, :integer

      timestamps()
    end
  end
end
