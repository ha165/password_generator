defmodule PasswordGeneratorTest do
  use ExUnit.Case
  doctest PasswordGenerator

  setup do
    options = %{
      "length" => "10",
      "numbers" => "false",
      "symbols" => "false",
      "uppercase" => "false"
    }

    options_type = %{
      lowercase: Enum.map(?a..?z, &<<&1>>),
      uppercase: Enum.map(?A..?Z, &<<&1>>),
      numbers: Enum.map(?0..?9, &<<&1>>),
      symbols: String.split("!@#$%^&*()_+-=[]{}|;:,.<>?/~", "", trim: true)
    }

    {:ok, result} = PasswordGenerator.generate_password(options)

    %{
      options: options,
      options_type: options_type,
      result: result
    }
  end

  test "returns a string", %{result: result} do
    assert is_binary(result)
  end

  test "returns error when no length is given" do
    options = %{"invalid" => "false"}
    assert {:error, _error} = PasswordGenerator.generate_password(options)
  end

  test "returns error when length is not a number" do
    options = %{"length" => "ab"}
    assert {:error, _error} = PasswordGenerator.generate_password(options)
  end

  test "length of returned string is the option provided" do
    options = %{"length" => "5"}
    {:ok, result} = PasswordGenerator.generate_password(options)
    assert String.length(result) == 5
  end

  test "returns only lowercase letters by default", %{
    result: result,
    options_type: options_type
  } do
    assert String.contains?(result, options_type.lowercase)

    refute String.contains?(result, options_type.uppercase)
    refute String.contains?(result, options_type.numbers)
    refute String.contains?(result, options_type.symbols)
  end

  test "returns error when option values are not booleans" do
    options = %{
      "length" => "10",
      "numbers" => "invalid",
      "symbols" => "false",
      "uppercase" => "0"
    }

    assert {:error, _error} = PasswordGenerator.generate_password(options)
  end

  test "returns error when options are not allowed" do
    options = %{"length" => "5", "invalid" => "true"}
    assert {:error, _error} = PasswordGenerator.generate_password(options)
  end

  test "returns error when one option is not allowed" do
    options = %{"length" => "5", "numbers" => "true", "invalid" => "true"}
    assert {:error, _error} = PasswordGenerator.generate_password(options)
  end
end
