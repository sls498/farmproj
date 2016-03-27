'use strict';

/* App Module */

var app = angular.module('app', [ 'ngRoute', 'ngCookies', 'slick', 'appControllers',
		'guestsServices' ]);

app.config([ '$routeProvider', '$httpProvider', function($routeProvider, $httpProvider) {
	$httpProvider.defaults.xsrfCookieName = 'csrftoken';
    $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
    
	$routeProvider.when('/guestbook', {
		templateUrl : 'static/templates/guestbook.html',
		controller : 'GuestbookCtrl'
	}).when('/about', {
		templateUrl : 'static/templates/about.html',
		controller : 'AboutCtrl'
	}).otherwise({
		templateUrl : 'static/templates/home.html',
		controller : 'HomeCtrl'
	});
} ]);