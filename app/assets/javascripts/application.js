// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require ../../../vendor/assets/javascripts/jquery.ba-throttle-debounce.min.js
//= require_tree .

$(document).on('turbolinks:load', function(e) {
  $('.splash-page').one('click touchend', function(e) {
    e.preventDefault();
    $('.splash-page').removeClass('splash-page').off('click touchend');
  });
  
  $('select.navigation').on('change', function(e) {
    window.location = $(e.target).val();
  });
});

$(function(e) {
  console.log("I'm happy to volunteer my time for worthy causes like this one! Reach out to me at katblag@gmail.com with your organization's website needs. -Katarina ");
});
