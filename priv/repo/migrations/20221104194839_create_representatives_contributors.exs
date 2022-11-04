defmodule FundingCongress.Repo.Migrations.CreateRepresentativesContributors do
  use Ecto.Migration

  def change do
    create table(:representatives_contributors) do
      add :cycle, :date
      add :origin, :string
      add :notice, :string
      add :source, :string
      add :representative_id, references(:representatives, on_delete: :nothing)
      add :contributor_id, references(:contributors, on_delete: :nothing)

      timestamps()
    end

    create index(:representatives_contributors, [:representative_id])
    create index(:representatives_contributors, [:contributor_id])
  end
end
