angular.module('News').factory('linkData', ['$http', ($http) ->

	linkData =
		data:
			links: [{title: 'Loading', contents: ''}]
		isLoaded: false

	linkData.loadLinks = ->
		if !linkData.isLoaded
			$http.get('./links.json').success( (data) ->
				linkData.data.links = data
				linkData.isLoaded = true
				console.log('Successfully loaded links.')
			).error( ->
				console.error('Failed to load links.')
			)

	return linkData

])

