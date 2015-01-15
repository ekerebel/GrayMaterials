class Listing < ActiveRecord::Base
    if Rails.env.development?
        has_attached_file :image, :styles => { :medium => "200x", :thumb => "80x>" }, :default_url => "NoImage.png"
        validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    else
        has_attached_file :image, :styles => { :medium => "200x", :thumb => "80x>" }, :default_url => "NoImage.png",
         :storage => :dropbox,
          :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
          :dropbox_visibility => 'public'
        validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    end
    validates :inventory, :price, :shape_id, :material_id, :grade_id, presence:true  
    validates :price, numericality: {greater_than:0}
    before_update :formatName
    before_create :formatName
    
    belongs_to :user
    belongs_to :account
    belongs_to :shape
    belongs_to :material
    belongs_to :grade
    has_many :orders
    
    validates_presence_of :account_id
    
    validates_presence_of :length, :if => :shape_length?
    validates_presence_of :width, :if => :shape_width?
    validates_presence_of :D, :if => :shape_D?
    validates_presence_of :thickness, :if => :shape_thickness?
    validates_presence_of :A, :if => :shape_A?
    validates_presence_of :B, :if => :shape_B?
    validates_presence_of :C, :if => :shape_C?
    validates_presence_of :OD, :if => :shape_OD?
    validates_presence_of :wall, :if => :shape_wall?
    validates_presence_of :dimension_ID, :if => :shape_dimension_ID?
    
    def shape_length?
        shape.length
    end
    def shape_width?
        shape.width
    end
    def shape_D?
        shape.D
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
    def shape_OD?
        shape.OD
    end
    def shape_wall?
        shape.wall
    end
    def shape_dimension_ID?
        shape.dimension_ID
    end
    
    
    def formatName
        myName=''
        if thickness?
            myName=myName + ' x '+formatMeasure(thickness)+'"'
        end
        if A?
            myName=myName + ' x '+formatMeasure(self.A)+'" A'
        end
        if B?
            myName=myName + ' x '+formatMeasure(self.B)+'" B'
        end
        if C?
            myName=myName + ' x '+formatMeasure(self.C)+'" C'
        end
        if D?
            myName=myName + ' x '+formatMeasure(self.D)+'"'
        end
        if OD?
            myName=myName + ' x '+formatMeasure(self.OD)+'" OD'
        end
        if wall?
            myName=myName + ' x '+formatMeasure(wall)+'" WALL'
        end
        if dimension_ID?
            myName=myName + ' x '+formatMeasure(dimension_ID)+'" ID'
        end
        if width?
            myName=myName + ' x '+formatMeasure(width)+'"'
        end
        if length?
            myName=myName + ' x '+formatMeasure(length)+'"'
        end
        myName=myName[2..99]
        
        
        if grade_id?
            myName = grade.name + ' ' + material.name + ' ' + shape.name + ' ' + myName
        else
            myName = material.name + ' ' + shape.name + ' ' + myName
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
            myMeasure=measure.to_i.to_s
        end
        return myMeasure
    end
    
end
