defmodule FundingCongress.OpenSecretsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FundingCongress.OpenSecrets` context.
  """

  @doc """
  Generate a party.
  """
  def party_fixture(attrs \\ %{}) do
    {:ok, party} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> FundingCongress.OpenSecrets.create_party()

    party
  end

  @doc """
  Generate a contributor.
  """
  def contributor_fixture(attrs \\ %{}) do
    {:ok, contributor} =
      attrs
      |> Enum.into(%{
        individual_contributions: 42,
        name: "some name",
        pac_contributions: 42,
        total: 42
      })
      |> FundingCongress.OpenSecrets.create_contributor()

    contributor
  end

  @doc """
  Generate a representative.
  """
  def representative_fixture(attrs \\ %{}) do
    {:ok, representative} =
      attrs
      |> Enum.into(%{
        cid: "some cid",
        first_name: "some first_name",
        last_name: "some last_name",
        party: "some party"
      })
      |> FundingCongress.OpenSecrets.create_representative()

    representative
  end
end
