defmodule FundingCongress.OpenSecrets do
  @moduledoc """
  The OpenSecrets context.
  """

  import Ecto.Query, warn: false
  alias FundingCongress.Repo

  alias FundingCongress.OpenSecrets.Contributor

  @doc """
  Returns the list of contributors.

  ## Examples

      iex> list_contributors()
      [%Contributor{}, ...]

  """
  def list_contributors do
    Repo.all(Contributor)
  end

  @doc """
  Gets a single contributor.

  Raises `Ecto.NoResultsError` if the Contributor does not exist.

  ## Examples

      iex> get_contributor!(123)
      %Contributor{}

      iex> get_contributor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_contributor!(id), do: Repo.get!(Contributor, id)

  @doc """
  Creates a contributor.

  ## Examples

      iex> create_contributor(%{field: value})
      {:ok, %Contributor{}}

      iex> create_contributor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_contributor(attrs \\ %{}) do
    %Contributor{}
    |> Contributor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a contributor.

  ## Examples

      iex> update_contributor(contributor, %{field: new_value})
      {:ok, %Contributor{}}

      iex> update_contributor(contributor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_contributor(%Contributor{} = contributor, attrs) do
    contributor
    |> Contributor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a contributor.

  ## Examples

      iex> delete_contributor(contributor)
      {:ok, %Contributor{}}

      iex> delete_contributor(contributor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_contributor(%Contributor{} = contributor) do
    Repo.delete(contributor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking contributor changes.

  ## Examples

      iex> change_contributor(contributor)
      %Ecto.Changeset{data: %Contributor{}}

  """
  def change_contributor(%Contributor{} = contributor, attrs \\ %{}) do
    Contributor.changeset(contributor, attrs)
  end

  alias FundingCongress.OpenSecrets.Representative

  @doc """
  Returns the list of representatives.

  ## Examples

      iex> list_representatives()
      [%Representative{}, ...]

  """
  def list_representatives do
    Repo.all(Representative)
  end

  @doc """
  Gets a single representative.

  Raises `Ecto.NoResultsError` if the Representative does not exist.

  ## Examples

      iex> get_representative!(123)
      %Representative{}

      iex> get_representative!(456)
      ** (Ecto.NoResultsError)

  """
  def get_representative!(id), do: Repo.get!(Representative, id)

  @doc """
  Creates a representative.

  ## Examples

      iex> create_representative(%{field: value})
      {:ok, %Representative{}}

      iex> create_representative(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_representative(attrs \\ %{}) do
    %Representative{}
    |> Representative.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a representative.

  ## Examples

      iex> update_representative(representative, %{field: new_value})
      {:ok, %Representative{}}

      iex> update_representative(representative, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_representative(%Representative{} = representative, attrs) do
    representative
    |> Representative.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a representative.

  ## Examples

      iex> delete_representative(representative)
      {:ok, %Representative{}}

      iex> delete_representative(representative)
      {:error, %Ecto.Changeset{}}

  """
  def delete_representative(%Representative{} = representative) do
    Repo.delete(representative)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking representative changes.

  ## Examples

      iex> change_representative(representative)
      %Ecto.Changeset{data: %Representative{}}

  """
  def change_representative(%Representative{} = representative, attrs \\ %{}) do
    Representative.changeset(representative, attrs)
  end

  alias FundingCongress.OpenSecrets.RepresentativeContribution

  @doc """
  Returns the list of representatives_contributors.

  ## Examples

      iex> list_representatives_contributors()
      [%RepresentativeContribution{}, ...]

  """
  def list_representatives_contributors do
    Repo.all(RepresentativeContribution)
  end

  @doc """
  Gets a single representative_contribution.

  Raises `Ecto.NoResultsError` if the Representative contribution does not exist.

  ## Examples

      iex> get_representative_contribution!(123)
      %RepresentativeContribution{}

      iex> get_representative_contribution!(456)
      ** (Ecto.NoResultsError)

  """
  def get_representative_contribution!(id), do: Repo.get!(RepresentativeContribution, id)

  @doc """
  Creates a representative_contribution.

  ## Examples

      iex> create_representative_contribution(%{field: value})
      {:ok, %RepresentativeContribution{}}

      iex> create_representative_contribution(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_representative_contribution(attrs \\ %{}) do
    %RepresentativeContribution{}
    |> RepresentativeContribution.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a representative_contribution.

  ## Examples

      iex> update_representative_contribution(representative_contribution, %{field: new_value})
      {:ok, %RepresentativeContribution{}}

      iex> update_representative_contribution(representative_contribution, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_representative_contribution(%RepresentativeContribution{} = representative_contribution, attrs) do
    representative_contribution
    |> RepresentativeContribution.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a representative_contribution.

  ## Examples

      iex> delete_representative_contribution(representative_contribution)
      {:ok, %RepresentativeContribution{}}

      iex> delete_representative_contribution(representative_contribution)
      {:error, %Ecto.Changeset{}}

  """
  def delete_representative_contribution(%RepresentativeContribution{} = representative_contribution) do
    Repo.delete(representative_contribution)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking representative_contribution changes.

  ## Examples

      iex> change_representative_contribution(representative_contribution)
      %Ecto.Changeset{data: %RepresentativeContribution{}}

  """
  def change_representative_contribution(%RepresentativeContribution{} = representative_contribution, attrs \\ %{}) do
    RepresentativeContribution.changeset(representative_contribution, attrs)
  end
end
