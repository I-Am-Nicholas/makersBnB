$('#submit').click(function(){
  $.post('http://localhost:9292/places/new',{placename: $('#placename').val(), location: $('#location').val(), description: $('#description').val(), price: $('#price').val()});
});
