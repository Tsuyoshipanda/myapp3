$(document).on('turbolinks:load', function(){
  function buildHTML(message){
              var html = `${message.id}
                          ${message.date}
                          ${message.message}`
              return html;
  }

  $('.form').on('submit', function(e){
    e.preventDefault()
    var formData = new FormData(this);
    var url = "/messages";
    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.messages').append(html);
      $('.submit').prop('disabled', false);
      $('.message_content').val('');
    })
    .fail(function(data){
      alert ('メッセージ送信に失敗しました');
    })
  })
});
