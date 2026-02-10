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
  @allowed_options [:length, :numbers, :symbols, :uppercase]
  @doc """
  Generates passwords for given options.

  ## Examples
      options = %{
        length: "5",
        numbers: "false",
        symbols: "false",
        uppercase: "false"
      }
      iex> PasswordGenerator.generate(options)
      "abcdef"


     options = %{
        length: "5",
        numbers: "true",
        symbols: "true",
        uppercase: "true"
      }
      iex> PasswordGenerator.generate(options)
      "aB3$d"
  """

  @spec generate(options :: map()) :: {:ok, String.t()} | {:error, bitstring()}
  def generate(options) do
    length = Map.get(options, "length")
    validate_length(length,options)

  end
defp validate_length(false,_options) do: {:error,"please provide a length"}
defp validate_length(true,_options) do 
 numbers = Enum.map(0..9, &Integer.to_string(&1))
 length = options["length"]
 length = String.contains?(length,numbers)
 validate_length_is_integer(length,options)
end
defp validate_length_is_integer(false,_options) do
  {:error,"length should be an integer"}
end
defp validate_length_is_integer(true,options) do
  length = options["length"] |> String.trim() |> String.to_integer()
  options_without_length = Map.delete(options, ["length"])
  option_values = Map.values(options_without_length)
  value = 
  options_values|> Enum.all?(fn x -> String.to_atom(x) |> is_boolean() end)
end
end
