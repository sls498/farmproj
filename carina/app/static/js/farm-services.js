'use strict';

/* Cards Services */

var cardsServices = angular.module('cardsServices', ['ngResource']);

cardsServices.factory('Cards', [ '$resource', function($resource) {
	return $resource('../api/cards', {}, {
		query: {
			method: 'GET',
			isArray: true
		}
	});
}]);