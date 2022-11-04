defmodule FundingCongressWeb.RepresentativeController do
  use FundingCongressWeb, :controller

  alias FundingCongress.OpenSecrets
  alias FundingCongress.OpenSecrets.Representative

  def index(conn, _params) do
    representatives = OpenSecrets.list_representatives()
    render(conn, "index.html", representatives: representatives)
  end

  def new(conn, _params) do
    changeset = OpenSecrets.change_representative(%Representative{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"representative" => representative_params}) do
    case OpenSecrets.create_representative(representative_params) do
      {:ok, representative} ->
        conn
        |> put_flash(:info, "Representative created successfully.")
        |> redirect(to: Routes.representative_path(conn, :show, representative))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    representative = OpenSecrets.get_representative!(id)
    render(conn, "show.html", representative: representative)
  end

  def edit(conn, %{"id" => id}) do
    representative = OpenSecrets.get_representative!(id)
    changeset = OpenSecrets.change_representative(representative)
    render(conn, "edit.html", representative: representative, changeset: changeset)
  end

  def update(conn, %{"id" => id, "representative" => representative_params}) do
    representative = OpenSecrets.get_representative!(id)

    case OpenSecrets.update_representative(representative, representative_params) do
      {:ok, representative} ->
        conn
        |> put_flash(:info, "Representative updated successfully.")
        |> redirect(to: Routes.representative_path(conn, :show, representative))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", representative: representative, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    representative = OpenSecrets.get_representative!(id)
    {:ok, _representative} = OpenSecrets.delete_representative(representative)

    conn
    |> put_flash(:info, "Representative deleted successfully.")
    |> redirect(to: Routes.representative_path(conn, :index))
  end
end
