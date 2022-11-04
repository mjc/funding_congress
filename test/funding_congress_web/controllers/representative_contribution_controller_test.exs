defmodule FundingCongressWeb.RepresentativeContributionControllerTest do
  use FundingCongressWeb.ConnCase

  import FundingCongress.OpenSecretsFixtures

  @create_attrs %{cycle: ~D[2022-11-03], notice: "some notice", origin: "some origin", source: "some source"}
  @update_attrs %{cycle: ~D[2022-11-04], notice: "some updated notice", origin: "some updated origin", source: "some updated source"}
  @invalid_attrs %{cycle: nil, notice: nil, origin: nil, source: nil}

  describe "index" do
    test "lists all representatives_contributors", %{conn: conn} do
      conn = get(conn, Routes.representative_contribution_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Representatives contributors"
    end
  end

  describe "new representative_contribution" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.representative_contribution_path(conn, :new))
      assert html_response(conn, 200) =~ "New Representative contribution"
    end
  end

  describe "create representative_contribution" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.representative_contribution_path(conn, :create), representative_contribution: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.representative_contribution_path(conn, :show, id)

      conn = get(conn, Routes.representative_contribution_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Representative contribution"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.representative_contribution_path(conn, :create), representative_contribution: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Representative contribution"
    end
  end

  describe "edit representative_contribution" do
    setup [:create_representative_contribution]

    test "renders form for editing chosen representative_contribution", %{conn: conn, representative_contribution: representative_contribution} do
      conn = get(conn, Routes.representative_contribution_path(conn, :edit, representative_contribution))
      assert html_response(conn, 200) =~ "Edit Representative contribution"
    end
  end

  describe "update representative_contribution" do
    setup [:create_representative_contribution]

    test "redirects when data is valid", %{conn: conn, representative_contribution: representative_contribution} do
      conn = put(conn, Routes.representative_contribution_path(conn, :update, representative_contribution), representative_contribution: @update_attrs)
      assert redirected_to(conn) == Routes.representative_contribution_path(conn, :show, representative_contribution)

      conn = get(conn, Routes.representative_contribution_path(conn, :show, representative_contribution))
      assert html_response(conn, 200) =~ "some updated notice"
    end

    test "renders errors when data is invalid", %{conn: conn, representative_contribution: representative_contribution} do
      conn = put(conn, Routes.representative_contribution_path(conn, :update, representative_contribution), representative_contribution: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Representative contribution"
    end
  end

  describe "delete representative_contribution" do
    setup [:create_representative_contribution]

    test "deletes chosen representative_contribution", %{conn: conn, representative_contribution: representative_contribution} do
      conn = delete(conn, Routes.representative_contribution_path(conn, :delete, representative_contribution))
      assert redirected_to(conn) == Routes.representative_contribution_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.representative_contribution_path(conn, :show, representative_contribution))
      end
    end
  end

  defp create_representative_contribution(_) do
    representative_contribution = representative_contribution_fixture()
    %{representative_contribution: representative_contribution}
  end
end
