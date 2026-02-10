defmodule PasswordGenerator do
  @moduledoc """
  Generates random password depending on parameteres,modulle main functionis `generate(options)`  
  That functions takes the options map.
  Options Example:
  options =%{
  "length" => "5",
  numbers:"false",
  symbols:"false",
  uppercase:"false",
  }
  The options are only 4.`length` is the length of the password, and the other 3 options are for including numbers, symbols and uppercase letters in the password.
  """

  @doc """
  Hello world.

  ## Examples

      iex> PasswordGenerator.hello()
      :world

  """
end
