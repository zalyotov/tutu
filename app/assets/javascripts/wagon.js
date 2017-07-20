$(document).ready(function(){
  $('.wagon-select').on('change', function(){
    wagonType = $(this).val();
    //alert(wagonType);

    $('.text-field').each(function(){
      if(!$(this).hasClass('hidden'))
        $(this).addClass('hidden');
    });

    switch(wagonType) {
      case 'SeatWagon':
        $('#wagon_seat_places').parent().removeClass('hidden');
        break;
      case 'SleepWagon':
        $('#wagon_places').parent().removeClass('hidden');
        break;
      case 'EconomWagon':
        $('#wagon_up_places').parent().removeClass('hidden');
        $('#wagon_down_places').parent().removeClass('hidden');
        $('#wagon_side_up_places').parent().removeClass('hidden');
        $('#wagon_side_down_places').parent().removeClass('hidden');
        break;
      case 'CoupeWagon':
        $('#wagon_up_places').parent().removeClass('hidden');
        $('#wagon_down_places').parent().removeClass('hidden');
        break;
    }
  });
});