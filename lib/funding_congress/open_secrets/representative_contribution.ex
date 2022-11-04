defmodule FundingCongress.OpenSecrets.RepresentativeContribution do
  use Ecto.Schema
  import Ecto.Changeset

  schema "representatives_contributors" do
    field :cycle, :date
    field :notice, :string
    field :origin, :string
    field :source, :string
    field :representative_id, :id
    field :contributor_id, :id

    timestamps()
  end

  @doc false
  def changeset(representative_contribution, attrs) do
    representative_contribution
    |> cast(attrs, [:cycle, :origin, :notice, :source])
    |> validate_required([:cycle, :origin, :notice, :source])
  end
end
