$(":checkbox").on("click", function(){
  var cb = $(this)
  , url = "/lists/" + cb.data("list") + "/tasks/" + cb.data("task") + "/toggle"
  , checked = cb.attr("checked")

  var result = $.ajax({
    dataType: "json",
    type: "post",
    url: url
  });

  result.done(function(data){
    if (!data.success) {
      cb.attr("checked", checked);
    }
  });

  result.fail(function(){
    alert("Alguma coisa quebrou. :(");
    cb.attr("checked", checked);
  });
});
