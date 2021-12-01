defmodule Day1 do
  def run() do
    input = parse_input()
    IO.puts(Part1.loop(input, 0))
    IO.puts(Part2.loop(input, 0))
  end

  defp parse_input() do
    File.read!("input.txt")
    |> String.split("\r\n", trim: true)
    |> Enum.map(&String.to_integer/1)
  end
end

defmodule Part2 do
  def acc_if_set_higher(list, acc) do
    set = Enum.take(list, 4)

    cond do
      length(set) < 4 ->
        acc

      Enum.take(set, 3) |> Enum.sum() < Enum.take(set, -3) |> Enum.sum() ->
        acc + 1

      true ->
        acc
    end
  end

  def loop([], acc), do: acc

  def loop(list, acc) do
    new_acc = acc_if_set_higher(list, acc)
    loop(tl(list), new_acc)
  end
end

defmodule Part1 do
  def acc_if_higher(list, acc) do
    [head | tail] = list

    cond do
      tail == [] ->
        acc

      head < hd(tail) ->
        acc + 1

      true ->
        acc
    end
  end

  def loop([], acc), do: acc

  def loop(list, acc) do
    new_acc = acc_if_higher(list, acc)
    loop(tl(list), new_acc)
  end
end

Day1.run()
