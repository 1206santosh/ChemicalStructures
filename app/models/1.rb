class Marvinstructure < ApplicationRecord

  before_create :assign_uid

  after_save :sync_all_apps

  def assign_uid
      self.uid=SecureRandom.hex(16)
      self.name=SecureRandom.hex(16)

  end


  def sync_all_apps
      apps=["http://localhost:5000/api/v1/sync_structures","http://localhost:3000/api/sync_structures"]
      apps.each do |app|
         require "uri"
         require "net/http"
         params={ref_id:self.uid,structure:self.marvinbs64,name:self.name}
         uri = URI(app)
         x=Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
         x.body=params.to_json
         Net::HTTP.start(uri.hostname, uri.port) do |http|
          http.request(x)
         end

      end
  end
end


