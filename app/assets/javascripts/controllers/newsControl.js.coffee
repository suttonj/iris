@NewsControl = ($scope, $location, $http, linkData) ->
	$scope.data = linkData.data
		#links: [{title: 'Loading news...', contents: ''}]

	
	linkData.loadLinks()

	$scope.viewItem = ->
		$location.url('/')

@NewsControl.$inject = ['$scope','$location', '$http', 'linkData']
	