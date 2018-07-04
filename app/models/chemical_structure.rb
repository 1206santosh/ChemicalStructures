class ChemicalStructure < ApplicationRecord
    belongs_to :chemical_structure ,optional: true
    has_many :chemical_structures
    has_paper_trail


  validates :name, presence: true
  before_create :assign_ref_id
  after_create :sync_created
  after_update :sync_updated

  def assign_ref_id
    if self.ref_id.blank?
       self.ref_id = SecureRandom.hex(16)
    end

  end

   def sync_created
       if self.base
         self.update(chemical_structure_id:self.id)
         sync_all_apps
       end
   end

    def sync_updated
      sync_all_apps
    end

  def sync_all_apps
    apps = ConnectedApp.all
    apps.each do |app|
      # puts app.name
      require "uri"
      require "net/http"
      params = {ref_id: self.ref_id, structure: self.structure_bs64, name: self.name,base:self.base,structure_type:self.structure_type,base_id: self.chemical_structure.ref_id}
      uri = URI(app.app_url)
      x = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
      x.body = params.to_json
      begin
        Net::HTTP.start(uri.hostname, uri.port) do |http|
          http.request(x)
        end
      rescue
        puts "#{app } not available"

      end
    end

  end

  def duplicate
    chemical_structure=self.dup
    chemical_structure.chemical_structure_id=self.id
    chemical_structure.base=false
    return chemical_structure
  end
end
