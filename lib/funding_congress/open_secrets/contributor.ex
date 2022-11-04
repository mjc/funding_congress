defmodule FundingCongress.OpenSecrets.Contributor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contributors" do
    field :individual_contributions, Money.Ecto.Amount.Type
    field :name, :string
    field :pac_contributions, Money.Ecto.Amount.Type
    field :total, Money.Ecto.Amount.Type

    timestamps()
  end

  @doc false
  def changeset(contributor, attrs) do
    contributor
    |> cast(attrs, [:name, :total, :pac_contributions, :individual_contributions])
    |> validate_required([:name, :total, :pac_contributions, :individual_contributions])
  end
end
