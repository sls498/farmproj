'use strict';

/* Controllers */

var appControllers = angular.module('appControllers', []);

app.controller('ActiveNavBarController', [ '$scope', '$location',
		function($scope, $location) {
			$scope.isActive = function(viewLocation) {
				return viewLocation === $location.path();
			};
		} ]);

app.controller('GuestbookCtrl', [ '$scope', '$cookies', 'Guest',
		function($scope, $cookies, Guest) {

			$scope.refresh = function() {
				$scope.newGuest = new Guest();
				$scope.guests = Guest.query();
			}

			$scope.create = function() {
				$("#guestSubmit").prop("disabled",true)
				$scope.newGuest.$save(function(item, funct) {
					$scope.refresh();
					$("#guestSubmit").prop("disabled",false)
				});
			}

			$scope.refresh();
		} ]);

app.controller('AboutCtrl', [ '$scope', function($scope) {

} ]);

app.controller('HomeCtrl', [ '$scope', function($scope) {
	$('.center').slick({
		centerMode : true,
		centerPadding : '60px',
		slidesToShow : 3,
		autoplay : true,
		autoplaySpeed : 2000,
		responsive : [ {
			breakpoint : 768,
			settings : {
				arrows : false,
				centerMode : true,
				centerPadding : '40px',
				slidesToShow : 3
			}
		}, {
			breakpoint : 480,
			settings : {
				arrows : false,
				centerMode : true,
				centerPadding : '40px',
				slidesToShow : 1
			}
		} ]
	});

	$scope.carouselOptions = [ {
		name : "Home",
		imageUrl : "https://placeimg.com/320/240/any?a=1"
	}, {
		name : "About",
		imageUrl : "https://placeimg.com/320/240/any?a=2"
	}, {
		name : "Guest Book",
		imageUrl : "https://placeimg.com/320/240/any?a=3"
	}, {
		name : "4",
		imageUrl : "https://placeimg.com/320/240/any?a=4"
	}, {
		name : "5",
		imageUrl : "https://placeimg.com/320/240/any?a=5"
	}, {
		name : "6",
		imageUrl : "https://placeimg.com/320/240/any?a=6"
	}, {
		name : "7",
		imageUrl : "https://placeimg.com/320/240/any?a=7"
	}, {
		name : "8",
		imageUrl : "https://placeimg.com/320/240/any?a=8"
	}, ]
} ]);