defmodule Controlflow do
  def check_max_load(load) do
    if load < 55 do
      "Load is normal"
    else
      "Load is too high"
    end
  end

  def check_fuel_level(fuel) do
    cond do
      fuel > 75 ->
        "Fuel level is high"

      fuel >= 25 and fuel <= 75 ->
        "Fuel level is normal"

      fuel < 25 ->
        "Fuel level is low"
    end
  end

  def error_code_message(code) do
    case code do
      200 -> "OK"
      201 -> "Created"
      204 -> "No Content"
      301 -> "Moved Permanently"
      302 -> "Found"
      304 -> "Not Modified"
      307 -> "Temporary Redirect"
      308 -> "Permanent Redirect"
      400 -> "Bad Request"
      401 -> "Unauthorized"
      403 -> "Forbidden"
      404 -> "Not Found"
      500 -> "Internal Server Error"
      n when is_integer(n) and n > 501 -> :error
      _ -> "Unknown Error"
    end
  end
end
