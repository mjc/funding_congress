defmodule FundingCongressWeb.RepresentativeContributionController do
  use FundingCongressWeb, :controller

  alias FundingCongress.OpenSecrets
  alias FundingCongress.OpenSecrets.RepresentativeContribution

  def index(conn, _params) do
    representatives_contributors = OpenSecrets.list_representatives_contributors()
    render(conn, "index.html", representatives_contributors: representatives_contributors)
  end

  def new(conn, _params) do
    changeset = OpenSecrets.change_representative_contribution(%RepresentativeContribution{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"representative_contribution" => representative_contribution_params}) do
    case OpenSecrets.create_representative_contribution(representative_contribution_params) do
      {:ok, representative_contribution} ->
        conn
        |> put_flash(:info, "Representative contribution created successfully.")
        |> redirect(to: Routes.representative_contribution_path(conn, :show, representative_contribution))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    representative_contribution = OpenSecrets.get_representative_contribution!(id)
    render(conn, "show.html", representative_contribution: representative_contribution)
  end

  def edit(conn, %{"id" => id}) do
    representative_contribution = OpenSecrets.get_representative_contribution!(id)
    changeset = OpenSecrets.change_representative_contribution(representative_contribution)
    render(conn, "edit.html", representative_contribution: representative_contribution, changeset: changeset)
  end

  def update(conn, %{"id" => id, "representative_contribution" => representative_contribution_params}) do
    representative_contribution = OpenSecrets.get_representative_contribution!(id)

    case OpenSecrets.update_representative_contribution(representative_contribution, representative_contribution_params) do
      {:ok, representative_contribution} ->
        conn
        |> put_flash(:info, "Representative contribution updated successfully.")
        |> redirect(to: Routes.representative_contribution_path(conn, :show, representative_contribution))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", representative_contribution: representative_contribution, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    representative_contribution = OpenSecrets.get_representative_contribution!(id)
    {:ok, _representative_contribution} = OpenSecrets.delete_representative_contribution(representative_contribution)

    conn
    |> put_flash(:info, "Representative contribution deleted successfully.")
    |> redirect(to: Routes.representative_contribution_path(conn, :index))
  end
end
