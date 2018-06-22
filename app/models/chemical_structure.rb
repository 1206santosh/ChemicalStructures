class ChemicalStructure < ApplicationRecord


  validates :name, presence: true,uniqueness: true
  before_create :assign_ref_id
  after_save :sync_all_apps


  def assign_ref_id
    self.ref_id = SecureRandom.hex(16)
  end


  def sync_all_apps
    apps = ConnectedApp.all
    apps.each do |app|
      puts app.name
      require "uri"
      require "net/http"
      params = {ref_id: self.ref_id, structure: self.structure_bs64, name: self.name}
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
end
