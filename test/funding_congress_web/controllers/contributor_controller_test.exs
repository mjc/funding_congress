defmodule FundingCongressWeb.ContributorControllerTest do
  use FundingCongressWeb.ConnCase

  import FundingCongress.OpenSecretsFixtures

  @create_attrs %{individual_contributions: 42, name: "some name", pac_contributions: 42, total: 42}
  @update_attrs %{individual_contributions: 43, name: "some updated name", pac_contributions: 43, total: 43}
  @invalid_attrs %{individual_contributions: nil, name: nil, pac_contributions: nil, total: nil}

  describe "index" do
    test "lists all contributors", %{conn: conn} do
      conn = get(conn, Routes.contributor_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Contributors"
    end
  end

  describe "new contributor" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.contributor_path(conn, :new))
      assert html_response(conn, 200) =~ "New Contributor"
    end
  end

  describe "create contributor" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.contributor_path(conn, :create), contributor: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.contributor_path(conn, :show, id)

      conn = get(conn, Routes.contributor_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Contributor"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.contributor_path(conn, :create), contributor: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Contributor"
    end
  end

  describe "edit contributor" do
    setup [:create_contributor]

    test "renders form for editing chosen contributor", %{conn: conn, contributor: contributor} do
      conn = get(conn, Routes.contributor_path(conn, :edit, contributor))
      assert html_response(conn, 200) =~ "Edit Contributor"
    end
  end

  describe "update contributor" do
    setup [:create_contributor]

    test "redirects when data is valid", %{conn: conn, contributor: contributor} do
      conn = put(conn, Routes.contributor_path(conn, :update, contributor), contributor: @update_attrs)
      assert redirected_to(conn) == Routes.contributor_path(conn, :show, contributor)

      conn = get(conn, Routes.contributor_path(conn, :show, contributor))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, contributor: contributor} do
      conn = put(conn, Routes.contributor_path(conn, :update, contributor), contributor: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Contributor"
    end
  end

  describe "delete contributor" do
    setup [:create_contributor]

    test "deletes chosen contributor", %{conn: conn, contributor: contributor} do
      conn = delete(conn, Routes.contributor_path(conn, :delete, contributor))
      assert redirected_to(conn) == Routes.contributor_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.contributor_path(conn, :show, contributor))
      end
    end
  end

  defp create_contributor(_) do
    contributor = contributor_fixture()
    %{contributor: contributor}
  end
end
