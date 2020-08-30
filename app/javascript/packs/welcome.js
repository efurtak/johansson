








$(document).on('turbolinks:load', function() {

  $('[data-toggle="tooltip"]').tooltip();
  $('[data-toggle="popover"]').popover();



  $('#cookies-notification-close').on('click', function() {
    let date = new Date();
    let time = date.getTime();
    
    time += 1000 * 60 * 60 * 24 * 30;
    date.setTime(time);

    document.cookie = 'cookies_notification=closed;expires=' + date.toUTCString() + ';path=/;';
  });

});