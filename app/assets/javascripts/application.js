// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
	// dropdown menus
	$.each($('.category a.menu_link'), function(i,category) {
		$(category).mouseover(function() {
			$('ul.dropdown').hide();
			$(this).parent().find('ul').fadeIn('fast')
		});
		$(category).parent().find('ul').mouseleave(function() {
			$(this).fadeOut('fast');
		});
	})

	// menu links
	$.each($('ul.menu_bar li a'), function(i,link) {
		$(link).click(function() {
			$('#content').load($(link).attr('route'), function() { init() });
		})
	})
});

function init() {
	// horse map links
	$.each($('.map_link a'), function(i,link) {
		$(link).click(function() {
			$('#content').load($(this).attr('route'))
		})
	})
}