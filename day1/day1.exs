defmodule Day1 do
  def run() do
    input = parse_input()
    IO.puts(loop(input, 0))
  end

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

  defp parse_input() do
    File.read!("input.txt")
    |> String.split("\r\n", trim: true)
    |> Enum.map(&String.to_integer/1)
  end
end

Day1.run()
