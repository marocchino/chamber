add_field =->
  if $(".chapter[value=]").size() == 0
    i = parseInt($(".chapter:last").attr("id").replace(/[a-z_]+/g,"")) + 1
    $(".chapter:last").after("<br/><label class=\"string optional\" for=\"book_chapters_attributes_#{i}_title\"> Chapter #{i + 1}</label><input class=\"string optional chapter\" id=\"book_chapters_attributes_#{i}_title\" maxlength=\"255\" name=\"book[chapters_attributes][#{i}][title]\" size=\"50\" type=\"text\">")
    $(".chapter:last").blur(add_field).focus()
    false
$(".chapter").blur add_field
