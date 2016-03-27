'use strict';

/* Controllers */

var farmControllers = angular.module('farmControllers', []);

farm.controller('HomeController', ['$scope', function($scope) {

} ]);

farm.controller('CardsController', ['$scope','Cards', function($scope, Cards) {
	$scope.cards = Cards.query();
} ]);

farm.controller('SetsController', ['$scope', function($scope) {

} ]);

farm.controller('ArtistsController', ['$scope', function($scope) {

} ]);

farm.controller('AboutController', ['$scope', function($scope) {

} ]);