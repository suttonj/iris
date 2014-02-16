@LinkControl = ($scope, $routeParams, linkData) ->

  $scope.data =
    linkData: linkData.data

  linkData.loadLinks()

  $scope.data.linkId = $routeParams.linkId

@LinkControl.$inject = ['$scope', '$routeParams', 'linkData']