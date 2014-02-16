# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#= require_self
#= require_tree ./services
#= require_tree ./filters
#= require_tree ./controllers
#= require_tree ./directives

News = angular.module('News', ['ui.bootstrap'])
