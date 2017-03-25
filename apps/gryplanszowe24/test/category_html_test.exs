defmodule CategoryHtmlTest do
  use ExUnit.Case

  @category_html "<li>
	<a href=\"http://www.gryplanszowe24.pl/657-zabawy-kreatywne\" title=\"Zabawy Kreatywne\">Zabawy Kreatywne</a>
	</li>"

  test "should make category from html" do
      category = Gryplanszowe24.CategoryHtml.get_category(@category_html)

      assert category.name == "Zabawy Kreatywne"
  end
end
