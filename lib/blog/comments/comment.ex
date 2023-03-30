defmodule Blog.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  @moduledoc """
  This file sets the comments schema.
  """
  schema "comments" do
    field(:content, :string)
    belongs_to(:post, Blog.Posts.Post)
    belongs_to(:user, Blog.Users.User)

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:content, :post_id, :user_id])
    |> validate_required([:content, :post_id])
    |> foreign_key_constraint(:post_id)
    |> foreign_key_constraint(:user_id)

    # |> Ecto.Changeset.put_assoc(:posts, comment)
  end
end
