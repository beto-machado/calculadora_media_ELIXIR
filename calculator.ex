defmodule Calculator do

  def start() do
    beto = %Student{name: "Beto Machado", results: build_subjects([5.2, 9.9, 5.0, 9.8, 7.6, 8.9])}
    ari = %Student{name: "Ari Milani", results: build_subjects([8.4, 7.5, 9.4, 2.8, 7.6, 8.9])}
    gui = %Student{name: "Gui Milani", results: build_subjects([1.3, 8.5, 8.9, 7.6, 8.9, 9.9])}
    paulo = %Student{name: "Paulo Henrique", results: build_subjects([5.4, 4.9, 2.2, 3.8, 7.6, 8.9])}
    arthur = %Student{name: "Arthur Machado", results: build_subjects([5.4, 4.9, 2.2, 3.8, 7.6, 8.9])}
    theo = %Student{name: "Theo Machado", results: build_subjects([5.4, 4.9, 2.2, 3.8, 7.6, 8.9])}

    result = calculate([beto, ari, gui, paulo, arthur, theo])
    best = best_result(result)
    {result, best}
  end

  defp calculate(students) do
    students
    |> Enum.map(
      &%{
        first_name: Student.first_name(&1),
        last_name: Student.last_name(&1),
        average: average(&1)
      }
    )
  end

  defp average(student) do
    total = Enum.count(student.results)

    result =
      student.results
      |> Enum.map(& &1.result)
      |> Enum.reduce(&(&1 + &2))

    Float.ceil(result / total, 2)
  end

  defp best_result(students) do
    best =
      students
      |> Enum.map(& &1.average)
      |> Enum.max()

    students
    |> Enum.filter(&(&1.average === best))
  end

  defp build_subjects(results) do
    subjects = ["Matemática", "Português", "Geografia", "História", "Física", "Química"]

    subjects
    |> Enum.map(&%Subject{name: &1, result: Enum.random(results)})
  end
end
