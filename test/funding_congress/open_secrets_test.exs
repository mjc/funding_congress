defmodule FundingCongress.OpenSecretsTest do
  use FundingCongress.DataCase

  import Money.Sigils

  alias FundingCongress.OpenSecrets

  describe "contributors" do
    alias FundingCongress.OpenSecrets.Contributor

    import FundingCongress.OpenSecretsFixtures

    @invalid_attrs %{individual_contributions: nil, name: nil, pac_contributions: nil, total: nil}

    test "list_contributors/0 returns all contributors" do
      contributor = contributor_fixture()
      assert OpenSecrets.list_contributors() == [contributor]
    end

    test "get_contributor!/1 returns the contributor with given id" do
      contributor = contributor_fixture()
      assert OpenSecrets.get_contributor!(contributor.id) == contributor
    end

    test "create_contributor/1 with valid data creates a contributor" do
      valid_attrs = %{
        individual_contributions: 42,
        name: "some name",
        pac_contributions: 42,
        total: 42
      }

      assert {:ok, %Contributor{} = contributor} = OpenSecrets.create_contributor(valid_attrs)
      assert contributor.individual_contributions == ~M[42]USD
      assert contributor.name == "some name"
      assert contributor.pac_contributions == ~M[42]USD
      assert contributor.total == ~M[42]USD
    end

    test "create_contributor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = OpenSecrets.create_contributor(@invalid_attrs)
    end

    test "update_contributor/2 with valid data updates the contributor" do
      contributor = contributor_fixture()

      update_attrs = %{
        individual_contributions: 43,
        name: "some updated name",
        pac_contributions: 43,
        total: 43
      }

      assert {:ok, %Contributor{} = contributor} =
               OpenSecrets.update_contributor(contributor, update_attrs)

      assert contributor.individual_contributions == ~M[43]USD
      assert contributor.name == "some updated name"
      assert contributor.pac_contributions == ~M[43]USD
      assert contributor.total == ~M[43]USD
    end

    test "update_contributor/2 with invalid data returns error changeset" do
      contributor = contributor_fixture()

      assert {:error, %Ecto.Changeset{}} =
               OpenSecrets.update_contributor(contributor, @invalid_attrs)

      assert contributor == OpenSecrets.get_contributor!(contributor.id)
    end

    test "delete_contributor/1 deletes the contributor" do
      contributor = contributor_fixture()
      assert {:ok, %Contributor{}} = OpenSecrets.delete_contributor(contributor)
      assert_raise Ecto.NoResultsError, fn -> OpenSecrets.get_contributor!(contributor.id) end
    end

    test "change_contributor/1 returns a contributor changeset" do
      contributor = contributor_fixture()
      assert %Ecto.Changeset{} = OpenSecrets.change_contributor(contributor)
    end
  end

  describe "representatives" do
    alias FundingCongress.OpenSecrets.Representative

    import FundingCongress.OpenSecretsFixtures

    @invalid_attrs %{cid: nil, first_name: nil, last_name: nil, party: nil}

    test "list_representatives/0 returns all representatives" do
      representative = representative_fixture()
      assert OpenSecrets.list_representatives() == [representative]
    end

    test "get_representative!/1 returns the representative with given id" do
      representative = representative_fixture()
      assert OpenSecrets.get_representative!(representative.id) == representative
    end

    test "create_representative/1 with valid data creates a representative" do
      valid_attrs = %{cid: "some cid", first_name: "some first_name", last_name: "some last_name", party: "some party"}

      assert {:ok, %Representative{} = representative} = OpenSecrets.create_representative(valid_attrs)
      assert representative.cid == "some cid"
      assert representative.first_name == "some first_name"
      assert representative.last_name == "some last_name"
      assert representative.party == "some party"
    end

    test "create_representative/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = OpenSecrets.create_representative(@invalid_attrs)
    end

    test "update_representative/2 with valid data updates the representative" do
      representative = representative_fixture()
      update_attrs = %{cid: "some updated cid", first_name: "some updated first_name", last_name: "some updated last_name", party: "some updated party"}

      assert {:ok, %Representative{} = representative} = OpenSecrets.update_representative(representative, update_attrs)
      assert representative.cid == "some updated cid"
      assert representative.first_name == "some updated first_name"
      assert representative.last_name == "some updated last_name"
      assert representative.party == "some updated party"
    end

    test "update_representative/2 with invalid data returns error changeset" do
      representative = representative_fixture()
      assert {:error, %Ecto.Changeset{}} = OpenSecrets.update_representative(representative, @invalid_attrs)
      assert representative == OpenSecrets.get_representative!(representative.id)
    end

    test "delete_representative/1 deletes the representative" do
      representative = representative_fixture()
      assert {:ok, %Representative{}} = OpenSecrets.delete_representative(representative)
      assert_raise Ecto.NoResultsError, fn -> OpenSecrets.get_representative!(representative.id) end
    end

    test "change_representative/1 returns a representative changeset" do
      representative = representative_fixture()
      assert %Ecto.Changeset{} = OpenSecrets.change_representative(representative)
    end
  end
end
