defmodule Day5 do
  def run do
    parse_rows()
    |> Enum.map(fn coords ->
      [x1, y1] = List.first(coords)
      [x2, y2] = List.last(coords)

      if x1 == x2 do
        Enum.to_list(y1..y2)
        |> Enum.map(fn y -> [x1, y] end)
      end

      if y1 == y2 do
        Enum.to_list(x1..x2)
        |> Enum.map(fn x -> [x, y1] end)
      end
    end)
    |> IO.inspect()
  end

  def parse_rows() do
    File.read!("test.txt")
    |> String.split("\r\n", trim: true)
    |> Enum.map(fn x ->
      String.split(x, " -> ", trim: true)
      |> Enum.map(fn x ->
        String.split(x, ",", trim: true)
        |> Enum.map(fn num -> String.to_integer(num) end)
      end)
    end)
  end
end

Day5.run()
