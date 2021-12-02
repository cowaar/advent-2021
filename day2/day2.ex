defmodule Day2 do
  def run() do
    input = parse_input()

    {horiz, depth} = Enum.reduce(input, {0, 0}, &update_coords1/2)
    IO.inspect(horiz * depth)

    {horiz2, depth2, _} = Enum.reduce(input, {0, 0, 0}, &update_coords2/2)
    IO.inspect(horiz2 * depth2)
  end

  def update_coords2(cmds, coords) do
    {dir, size} = cmds
    {x, y, aim} = coords

    case dir do
      "forward" -> {x + size, y + size * aim, aim}
      "down" -> {x, y, aim + size}
      "up" -> {x, y, aim - size}
    end
  end

  def update_coords1(cmds, coords) do
    {dir, size} = cmds
    {x, y} = coords

    case dir do
      "forward" -> {x + size, y}
      "down" -> {x, y + size}
      "up" -> {x, y - size}
    end
  end

  defp parse_input() do
    File.read!("input.txt")
    |> String.split("\r\n", trim: true)
    |> Enum.map(fn
      x ->
        [dir, size] = String.split(x, " ", trim: true, parts: 2)
        {dir, String.to_integer(size)}
    end)
  end
end

Day2.run()
