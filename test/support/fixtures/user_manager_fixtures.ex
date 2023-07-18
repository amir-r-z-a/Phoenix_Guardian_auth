defmodule AuthGuard.UserManagerFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AuthGuard.UserManager` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        username: "some username",
        password: "some password"
      })
      |> AuthGuard.UserManager.create_user()

    user
  end
end
