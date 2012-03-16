# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


FeatureTerm.create(:feature => 'hardwood floors', :variations => ["hard wood","wood floor","wood floors","hardwood"])
FeatureTerm.create(:feature => 'carpet', :variations => ["carpet","carpets","carpeting"])
FeatureTerm.create(:feature => 'den', :variations => ["den"])
FeatureTerm.create(:feature => 'top floor', :variations => ["top floor"])
FeatureTerm.create(:feature => 'townhome', :variations => ["townhome"])
FeatureTerm.create(:feature => 'zipcar', :variations => ["zipcar","zip car"])
FeatureTerm.create(:feature => 'fios', :variations => ["fios"])
FeatureTerm.create(:feature => 'gym', :variations => ["fitness center","gym"])
FeatureTerm.create(:feature => 'pool', :variations => ["pool"])
FeatureTerm.create(:feature => 'fireplace', :variations => ["fireplace"])
FeatureTerm.create(:feature => 'available now', :variations => ["avail now","available now","available immediately"])
FeatureTerm.create(:feature => 'parking', :variations => ["parking","garage"])
FeatureTerm.create(:feature => 'dishwasher', :variations => ["dishwasher"])
FeatureTerm.create(:feature => 'disposal', :variations => ["disposal"])
FeatureTerm.create(:feature => 'furnished', :variations => ["furnished"])

Region.create(:active => true, :name => 'Washington DC', :url => 'http://washingtondc.craigslist.org/apa/')
Region.create(:active => true, :name => 'Chicago', :url => 'http://chicago.craigslist.org/apa/')

Apartment.create(:region_id => 1, :url => 'http://foobar.com', :title => 'apt 1', :features => ['hardwood floors', 'pool', 'gym'])
Apartment.create(:region_id => 1, :url => 'http://foobar.com', :title => 'apt 2', :features => ['carpet', 'pool', 'gym'])
Apartment.create(:region_id => 2, :url => 'http://foobar.com', :title => 'apt 3', :features => ['hardwood floors', 'pool', 'gym', 'den', 'fios'])
Apartment.create(:region_id => 2, :url => 'http://foobar.com', :title => 'apt 5', :features => ['den', 'fios', 'parking'])
