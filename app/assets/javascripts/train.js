$(document).ready(function(){
  $('a.edit-train').on('click', function(e){
    e.preventDefault();

    stationId = $(this).data('trainId');
    title = $('#train-title-' + stationId);
    form = $('#edit-train-' + stationId);

    if($(this).hasClass('cancel'))
    {
      $(this).html('Редактировать');
      $(this).removeClass('cancel');
    }
    else
    {
      $(this).html('Отменить редактирование');
      $(this).addClass('cancel');      
    }

    title.toggle();
    form.toggle();
  });
});