defmodule FundingCongressWeb.RepresentativeControllerTest do
  use FundingCongressWeb.ConnCase

  import FundingCongress.OpenSecretsFixtures

  @create_attrs %{cid: "some cid", first_name: "some first_name", last_name: "some last_name", party: "some party"}
  @update_attrs %{cid: "some updated cid", first_name: "some updated first_name", last_name: "some updated last_name", party: "some updated party"}
  @invalid_attrs %{cid: nil, first_name: nil, last_name: nil, party: nil}

  describe "index" do
    test "lists all representatives", %{conn: conn} do
      conn = get(conn, Routes.representative_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Representatives"
    end
  end

  describe "new representative" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.representative_path(conn, :new))
      assert html_response(conn, 200) =~ "New Representative"
    end
  end

  describe "create representative" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.representative_path(conn, :create), representative: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.representative_path(conn, :show, id)

      conn = get(conn, Routes.representative_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Representative"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.representative_path(conn, :create), representative: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Representative"
    end
  end

  describe "edit representative" do
    setup [:create_representative]

    test "renders form for editing chosen representative", %{conn: conn, representative: representative} do
      conn = get(conn, Routes.representative_path(conn, :edit, representative))
      assert html_response(conn, 200) =~ "Edit Representative"
    end
  end

  describe "update representative" do
    setup [:create_representative]

    test "redirects when data is valid", %{conn: conn, representative: representative} do
      conn = put(conn, Routes.representative_path(conn, :update, representative), representative: @update_attrs)
      assert redirected_to(conn) == Routes.representative_path(conn, :show, representative)

      conn = get(conn, Routes.representative_path(conn, :show, representative))
      assert html_response(conn, 200) =~ "some updated cid"
    end

    test "renders errors when data is invalid", %{conn: conn, representative: representative} do
      conn = put(conn, Routes.representative_path(conn, :update, representative), representative: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Representative"
    end
  end

  describe "delete representative" do
    setup [:create_representative]

    test "deletes chosen representative", %{conn: conn, representative: representative} do
      conn = delete(conn, Routes.representative_path(conn, :delete, representative))
      assert redirected_to(conn) == Routes.representative_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.representative_path(conn, :show, representative))
      end
    end
  end

  defp create_representative(_) do
    representative = representative_fixture()
    %{representative: representative}
  end
end
