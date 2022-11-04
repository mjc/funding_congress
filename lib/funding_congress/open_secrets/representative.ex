defmodule FundingCongress.OpenSecrets.Representative do
  use Ecto.Schema
  import Ecto.Changeset

  schema "representatives" do
    field :cid, :string
    field :first_name, :string
    field :last_name, :string
    field :party, :string

    timestamps()
  end

  @doc false
  def changeset(representative, attrs) do
    representative
    |> cast(attrs, [:cid, :first_name, :last_name, :party])
    |> validate_required([:cid, :first_name, :last_name, :party])
  end
end
