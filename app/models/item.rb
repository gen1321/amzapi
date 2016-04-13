class Item < ActiveRecord::Base
  belongs_to :spreadsheet

 def  self.setitemsall(listitems , client)
    listitems = listitems.asins.delete_if(&:blank?)
    listitems = listitems.map{|k| k.asin }
    asins = listitems.map(&:inspect).join(', ')
    asins = asins.delete_if(&:blank?)
    asins = asins.each_slice(40)

    resp = client.lookup(asins)
 end


  def self.makestring(stack)
    listitems = stack
    listitems = listitems.map{|k| k.asin }
    asins = listitems.to_s
    asins = asins.delete('" ')
    asins = asins.delete('[')
    asins = asins.delete(']')
    return asins
  end

 def self.makerequest(client,query)

          resp = client.lookup(query)
          return resp
        end
 end

