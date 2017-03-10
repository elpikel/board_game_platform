defmodule ProductHtmlTest do
  use ExUnit.Case

  @html_product "<li class=\"ajax_block_product first_item item clearfix\"><div class=\"center_block\"><a href=\"http://www.gryplanszowe24.pl/gry-planszowe/7161-cluedo-5010993346677.html\" class=\"product_img_link\" title=\"Cluedo\"><img src=\"http://www.gryplanszowe24.pl/7161-7849-home/cluedo.jpg\" alt=\"gra planszowa - Cluedo\" width=\"192\" height=\"192\"></a></div><div class=\"right_block\"><div id=\"toppro\"><h2 style=\"visibility: visible;\"><a href=\"http://www.gryplanszowe24.pl/gry-planszowe/7161-cluedo-5010993346677.html\" title=\"Cluedo\" style=\"display: inline-block;\">Cluedo</a></h2><p class=\"product_desc\">Gra dla 3-6 osób. Rewelacyjna zabawa!</p></div><div id=\"cennik\"><span id=\"cena_bgcx\"><span class=\"cena_leftx\"></span><span class=\"price\">105,90 pln<span class=\"vat\">(brutto)</span></span><span class=\"cena_rightx\"></span></span><span id=\"stara\"></span></div><a class=\"button ajax_add_to_cart_button exclusive\" rel=\"ajax_id_product_7161\" href=\"http://www.gryplanszowe24.pl/cart?add&amp;id_product=7161&amp;token=01cfabef7363b857d2c115246636b1d4\" title=\"Dodaj\">Dodaj</a></div></li>"

    test "should parse html to product" do
      product = Gryplanszowe24.ProductHtml.get_product(@html_product)
      assert product.title == "Cluedo"
      assert product.description == "Gra dla 3-6 osób. Rewelacyjna zabawa!"
      assert product.price == 105.9
      assert product.url == "http://www.gryplanszowe24.pl/gry-planszowe/7161-cluedo-5010993346677.html"
      assert product.image == "http://www.gryplanszowe24.pl/7161-7849-home/cluedo.jpg"
    end
end
