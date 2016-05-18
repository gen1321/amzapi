
class Spreadsheet < ActiveRecord::Base
  has_attached_file :file , :path => ":rails_root/public/system/:attachment/:id/:filename"
  validates_attachment :file, presence: true,
                       content_type: { content_type: [
                           "application/vnd.ms-excel",
                           "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
                       ]
                       },
                       message: ' Only EXCEL files are allowed.'
  has_many :items






  def create_items
    xls = RubyXL::Parser.parse(file.path)
    workbook = xls[0]
    workbook.drop(find_second_table(workbook)).each  do |row|
      if !row.nil? & !row.cells[0].nil? & !row.cells[1].nil?
        pallet_id = row.cells[0].value
        deal_code = row.cells[1].value
        asin = row.cells[2].value
        desc = row.cells[3].value
        item =items.new(pallet_id:pallet_id,deal_code:deal_code,asin:asin,description:desc)
        item.save!
      end
    end
    setRetailValue
  end

  def setRetailValue

  client = ASIN::Client.instance
    count = 0
    stack = []
    itemlist =items.where.not(asin: [nil, ''])
    itemlist.each_with_index  do |item,index|
      stack.push(item)
    #  item.retail_price = item.retValue(client,count)
    #  item.save
      #p item.retail_price
      count+= 1
      if count == 10 || (index == itemlist.size - 10 )
        query = Item.makestring(stack)
        resp  = Item.makerequest(client,query)
        resp.each_with_index do |val,index|
          begin
            value = 0
            value = val[:offer_summary][:lowest_collectible_price][:formatted_price]
          rescue
            begin
              value = val[:offer_summary][:lowest_used_price][:formatted_price]
            rescue
              begin
              value = val[:offer_summary].first.last[:formatted_price]
              rescue
                p 'something wrong with ' + "#{val.asin}"
                end
            end
            stack.each do |item|
              if item.asin = val.asin
                item.retail_price = value
                item.save
              end
            end
          end
          end
        stack = []
        count = 0
      end
    end
  end
  def find_second_table(workbook)
    workbook.each_with_index do |row, index |
      if !row.nil?
        if !row.cells[0].nil?
          if row.cells[0].value == 'Pallet ID'
           return index+1
          end
        end
      end
    end
  end
end
