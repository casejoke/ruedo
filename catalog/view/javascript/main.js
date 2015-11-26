var is_mobile = false,
	mouse_down = "click";

if ( screen.width > '700' && screen.width < '960' ) {

	// tablet
    document.write( '<meta name = "format-detection" content = "telephone=no" />' );

} 

if ( screen.width <= '1150' ) {
	
	 document.write( '<meta name="viewport" content="width=1300, user-scalable=no">' );
	 
	 is_mobile = true;
	 mouse_down = "touchstart";
}



$(document).ready(function(){

	if (!Modernizr.csstransitions || !Modernizr.cssanimations) {
		transitions_av=false;
		$.fn.transition=$.fn.animate;
		$.fn.transitionStop=$.fn.stop;
	}

	setTimeout(function(){
		
		service_slider = new Swiper('.service__list .swiper-container', {
	        freeMode: false,
	        freeModeFluid: false,
	        loop: false,
	        autoplay: 0,
	        slidesPerView: 3,
	        centeredSlides: true,
	        initialSlide: 2
	    });
	}, 500)
	
	$(document).on(mouse_down, '.service-item', function(){
		
		var slide_index = $(this).parent().index('.swiper-slide');
		
		if (slide_index < service_slider.activeIndex){
			
			service_slider.swipePrev();
		}
		else{
			
			service_slider.swipeNext();
		}
		
		return false;
	})
    
    //service_slider.swipeNext();

	// open popup	
	$(document).on(mouse_down, 'a.popup', function(){
		
		$('body').addClass('lock');
		
		$($(this).attr('href')).fadeIn(500);
		
		$($(this).attr('href')).find('.popup-project__images').addClass('slider');
		
		var slider = null;
		setInterval(function(){
			
			slider = new Swiper('.slider .swiper-container', {
		        pagination: '.slider .slider__pagination',
		        paginationClickable: true,
		        freeMode: false,
		        freeModeFluid: false,
		        loop: false,
		        autoplay: 7000
		    });
		}, 400);
	
		
		
		return false;
	});
	
	$(document).on(mouse_down, '.popup-project__prev', function(){
	    
	    $(this).parent().find('.popup-project__close').trigger('click');
	    
	    var el_index = $(this).parents('.popup-project').index('.popup-project_item') - 1;
	    
	    if (el_index < 0){
		    
		    el_index = $('.project').length - 1;
	    }
	    
	    $('.project')
	    	.eq(el_index)
	    	.find('.project__name-outer').trigger('click');
	    
	    return false;
    })
	
	$(document).on(mouse_down, '.popup-project__next', function(){
	    
	    $(this).parent().find('.popup-project__close').trigger('click');
	    
	    var el_index = $(this).parents('.popup-project').index('.popup-project_item') + 1;
	    
	    if (el_index == $('.project').length){
		    
		    el_index = 0;
	    }
	    
	    $('.project')
	    	.eq(el_index)
	    	.find('.project__name-outer').trigger('click');
	    
	    return false;
    })
	
	// close popup 	
	$(document).on(mouse_down, '.popup-project__close', function(){
		
		$(this)
			.parents('.popup-project').fadeOut(500)
			.find('.popup-project__images').removeClass('slider');
		
		$('body').removeClass('lock');
		
		return false;
	})

	$('.content').show();
		
	// menu scroll	
	$(document).on(mouse_down, '.menu__link', function(){
	
		var menu_index = $('.menu__item').index($(this).parent());
		
		$('html, body').transition({
			scrollTop: $('.block').eq(menu_index).offset().top,
		}, 400);
		
		return false;
	})
	
	map_init();
	
	$('.contacts__map-inner').css({
		
		'width': $(window).width() * 2,
		'height': $(window).height() * 2,
		'left': '-' + $(window).width() / 10 + 'px',
		'top': '-' + $(window).height() / 10 + 'px',
	});
	
	$(document).on(mouse_down, '.contacts__map', function(){
		
		$(this).addClass('contacts__map_active');
	});
})

$(window).load(function(){
	
	$('.loader').addClass('loader_stopped').delay(500).hide();
	
	$(document).on(mouse_down, '.team__member', function(){
		
		$('.team__member').removeClass('team__member_active');
		
		$(this).addClass('team__member_active');
	});
	
	$('.banner__slide')
			.addClass('banner__slide_active');
			
	setInterval(function(){
		
		$('.banner__slide')
			.removeClass('banner__slide_active')
			.addClass('banner__slide_active');
	}, 25000);
})

$(window).scroll(function(){
	
	// fix header
	if ($(window).scrollTop() + $('.header').height() > $(window).height()){
		
		$('.header').addClass('header_fixed');
	}
	else{
		
		$('.header').removeClass('header_fixed');
	}

	$(document).on(mouse_down, '.projects-menu__toggle', function(){
		$(this).closest('.projects-menu').addClass('projects-menu-showed');
	});
	


	// project filter
	$(document).on(mouse_down, '.projects-menu__link', function(){
	
		if (!$(this).hasClass('projects-menu__link_active')){
			
			$('.projects-menu__link').removeClass('projects-menu__link_active');
			$(this).addClass('projects-menu__link_active');

			$('.projects-menu.projects-menu-showed').removeClass('projects-menu-showed');

			
			var type = $(this).attr('data-type');
			console.log(type);
			
			$('.projects-list').fadeOut(300, function(){
				
				if (type == ''){
				
					$('.project').show()
				}
				else{
					
					$('.project').hide();
					$('.project_' + type).show();
				}
				
				$('.projects-list').fadeIn(300);
			});		
		}
		
		return false;
	});
	
	
	// menu active
	
	var active_block = null;
	
	$('.block').each(function(){
		
		if ($(window).scrollTop() >= ($(this).offset().top) - $(this).height() * 0.5){
			
			active_block = $(this);
		}
	})
	
	$('.menu__link').removeClass('menu__link_active');
	$('.menu__item')
		.eq($('.block').index(active_block))
		.children()
		.addClass('menu__link_active');	
	
	// disable parallax on mobile devices
	if (!is_mobile){
		
		// parallax
		$('.parallax').each(function(){
			
			var block = $(this),
				block_offset = block.offset().top - $(window).scrollTop();
			
			block.find('.parallax-element').each(function(){
			
				var direction = $(this).attr('data-direction') || 1,
					speed = $(this).attr('data-speed') || 4,
					element_position = block_offset / speed;
				
				$(this).css('transform', "translate3d(0px, " + element_position * direction + "px, 0px)");
			})
		})
	}
})

function map_init() {

	var lat = 55.7517;
	var lng = 37.6520;
	var map;
	var myLatlng = new google.maps.LatLng(lat, lng);
	var myOptions = {
		zoom: 15,
		center: myLatlng,
		mapTypeId: google.maps.MapTypeId.ROADMAP,
		disableDefaultUI: true,
		scrollwheel: false,
		styles: [{"featureType":"landscape","stylers":[{"saturation":-100},{"lightness":65},{"visibility":"on"}]},{"featureType":"poi","stylers":[{"saturation":-100},{"lightness":51},{"visibility":"simplified"}]},{"featureType":"road.highway","stylers":[{"saturation":-100},{"visibility":"simplified"}]},{"featureType":"road.arterial","stylers":[{"saturation":-100},{"lightness":30},{"visibility":"on"}]},{"featureType":"road.local","stylers":[{"saturation":-100},{"lightness":40},{"visibility":"on"}]},{"featureType":"transit","stylers":[{"saturation":-100},{"visibility":"simplified"}]},{"featureType":"administrative.province","stylers":[{"visibility":"off"}]},{"featureType":"water","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":-25},{"saturation":-100}]},{"featureType":"water","elementType":"geometry","stylers":[{"hue":"#ffff00"},{"lightness":-25},{"saturation":-97}]}]
	};
	
	map = new google.maps.Map(document.getElementById('map'), myOptions);
	
	var marker=new google.maps.Marker({
	  position: {lat: 55.7540, lng: 37.6204},
	  map: map,
	  icon: 'images/marker.png'
	});
	
	marker.setMap(map);
	
	var swBound = myLatlng;
	var neBound = myLatlng;
	var bounds = new google.maps.LatLngBounds(swBound, neBound);
}

$(function() {
	var notesSlider = $('.notes-slider').slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		speed: 500,
		infinite: true
	});

	$('.slick-next').on('mouseenter', function() {
		$(this).parent().slick("slickNext");
	});

	$('.slick-prev').on('mouseenter', function() {
		$(this).parent().slick("slickPrev");
	});


})

/*$(document).ready(function(){
	var timers = {}, itemsList = 'ul.notes';
	$(itemsList).each(function(){
		timers[$(itemsList).index($(this))] = null;
	});
	$(itemsList).find('li').hover(
		function(){
			var listIndex = $(itemsList).index($(this).parent());
			if (!timers[listIndex]){
				var index = $(this).parent().find('li').index($(this));
				if (index == ($(this).parent().find('li').length-1)){
					index = -1;
				}
				timers[listIndex] = setTimeout(function(){
					$(itemsList).eq(listIndex).find('li').removeClass('active').eq(index+1).addClass('active');
				}, 3000);
			}
		}, 
		function(){
			if (timers[$(itemsList).index($(this).parent())]){
				clearTimeout(timers[$(itemsList).index($(this).parent())]);
				timers[$(itemsList).index($(this).parent())] = null;
			}
		}
	);
	$(itemsList).find('li').click(
		function(){
			if (timers[$(itemsList).index($(this).parent())]){
				clearTimeout(timers[$(itemsList).index($(this).parent())]);
				timers[$(itemsList).index($(this).parent())] = null;
			}
			var listIndex = $(itemsList).index($(this).parent());
			if (!timers[listIndex]){
				var index = $(this).parent().find('li').index($(this));
				if (index == ($(this).parent().find('li').length-1)){
					index = -1;
				}
				$(itemsList).eq(listIndex).find('li').removeClass('active').eq(index+1).addClass('active');
			}
		}
	);
});*/