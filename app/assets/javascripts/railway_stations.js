$(document).ready(function(){
  $('a.edit-station').on('click', function(e){
    e.preventDefault();

    stationId = $(this).data('stationId');
    title = $('#railway-station-title-' + stationId);
    form = $('#edit-railway-station-' + stationId);

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