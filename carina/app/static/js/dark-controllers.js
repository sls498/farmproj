'use strict';

/* Controllers */

var darkControllers = angular.module('darkControllers', []);

dark.controller('HomeController', ['$scope', function($scope) {

} ]);

dark.controller('CardsController', ['$scope','Cards', function($scope, Cards) {
	$scope.cards = Cards.query();
} ]);

dark.controller('SetsController', ['$scope', function($scope) {

} ]);

dark.controller('ArtistsController', ['$scope', function($scope) {

} ]);

dark.controller('AboutController', ['$scope', function($scope) {

} ]);