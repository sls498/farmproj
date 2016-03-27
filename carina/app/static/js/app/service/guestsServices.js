'use strict';

/* Guests Services */

var guestsServices = angular.module('guestsServices', [ 'ngResource' ]);

guestsServices.factory('Guest', [ '$resource', function($resource) {
	return $resource('api/guests/:id', { id: '@_id' }, {
		query : {
			method : 'GET',
			isArray : true
		},
		save : {
			method : 'POST',
			isArray: false
		}
	});
} ]);