require 'open-uri'
require 'json'

download = open('https://letsrevolutionizetesting.com/challenge').read

p JSON.parse(download)
