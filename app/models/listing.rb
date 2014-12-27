class Listing < ActiveRecord::Base
    if Rails.env.development?
        has_attached_file :image, :styles => { :medium => "200x", :thumb => "80x>" }, :default_url => "NoImage.png"
        validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    else
        has_attached_file :image, :styles => { :medium => "200x", :thumb => "80x>" }, :default_url => "NoImage.png",
         :storage => :dropbox,
          :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
          :path=>":style/:id_:filename"
        validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    end
    validates :inventory, :price, :shape_id, :material, presence:true  
    validates :price, numericality: {greater_than:0}
    before_update :formatName
    before_create :formatName
    
    belongs_to :user
    belongs_to :shape
    has_many :orders
    
    validates_presence_of :length, :if => :shape_length?
    validates_presence_of :width, :if => :shape_width?
    validates_presence_of :diameter, :if => :shape_diameter?
    validates_presence_of :thickness, :if => :shape_thickness?
    validates_presence_of :A, :if => :shape_A?
    validates_presence_of :B, :if => :shape_B?
    validates_presence_of :C, :if => :shape_C?
    def shape_length?
        shape.length
    end
    def shape_width?
        shape.width
    end
    def shape_diameter?
        shape.diameter
    end
    def shape_thickness?
        shape.thickness
    end
    def shape_A?
        shape.A
    end
    def shape_B?
        shape.B
    end
    def shape_C?
        shape.C
    end
    
    
    def formatName
        myName=''
        if thickness?
            myName=myName + ' X '+formatMeasure(thickness)
        end
        if A?
            myName=myName + ' X '+formatMeasure(self.A)
        end
        if B?
            myName=myName + ' X '+formatMeasure(self.B)
        end
        if C?
            myName=myName + ' X '+formatMeasure(self.C)
        end
        if diameter?
            myName=myName + ' X '+formatMeasure(diameter)
        end
        if width?
            myName=myName + ' X '+formatMeasure(width)
        end
        if length?
            myName=myName + ' X '+formatMeasure(length)
        end
        myName=myName[2..99]
        
        
        if grade?
            myName = material + ' ' + grade + ' ' + shape.name + ' ' + myName
        else
            myName = material + ' ' + shape.name + ' ' + myName
        end
        
        self.name=myName
    end
    
    def formatMeasure(measure)
        myMeasure=''
        if (measure != measure.to_i)
            measure32=32*measure
            if (measure32 == measure32.to_i)
                if (measure.to_i==0)
                    myMeasure = Rational((measure-measure.to_i)).to_s
                else
                    myMeasure = measure.to_i.to_s+'-'+Rational((measure-measure.to_i)).to_s
                end
            else
                myMeasure=measure.to_s
            end
        else
            myMeasure=measure.to_s
        end
        #myMeasure=myMeasure+'"'
        return myMeasure
    end
    
end
