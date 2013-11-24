module Digitalocean
  class SshKey
    # 
    # Api calls
    # 
    def self.all
      response = Digitalocean.request.get "ssh_keys"
      RecursiveOpenStruct.new(response.body, :recurse_over_arrays => true)
    end

    def self.retrieve(ssh_key_id=nil)
      response = Digitalocean.request.get "ssh_keys/#{ssh_key_id}"
      RecursiveOpenStruct.new(response.body, :recurse_over_arrays => true)
    end

    def self.create(attrs)
      response = Digitalocean.request.get "ssh_keys/new"
      RecursiveOpenStruct.new(response.body, :recurse_over_arrays => true)
    end

    def self.add(ssh_key_name, ssh_public_key)
      response = Digitalocean.request.get "ssh_keys/new/?name=#{ssh_key_name}&ssh_pub_key=#{ssh_public_key}"
      RecursiveOpenStruct.new(response.body, :recurse_over_arrays => true)
    end

    def self.edit(ssh_key_id=nil)
      response = Digitalocean.request.post "ssh_keys/#{ssh_key_id}/edit"
      RecursiveOpenStruct.new(response.body, :recurse_over_arrays => true)
    end
  end
end
