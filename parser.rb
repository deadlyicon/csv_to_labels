#!/usr/bin/env ruby

require 'csv'
require 'pp'
require 'pry'

require 'sinatra'
require 'haml'
require 'active_support/all'
require 'active_support/core_ext/array/grouping'

get '/' do

  csv = CSV.parse File.read File.expand_path('../Ardent Mobile Cloud Kickstarter Rewards - T-Shirt Orders.csv', __FILE__)

  keys = csv.shift

  @data = csv.map do |backer|
    Hash[keys.zip(backer)]
  end

  haml :index
end
