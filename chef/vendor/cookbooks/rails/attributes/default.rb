default["rails"]["applications_root"] = "/u/apps"
default["rbenv"]["binaries_url"] = "http://binaries.intercityup.com/ruby/ubuntu"
default["rbenv"]["available_binaries"] = %w(2.0.0-p481 2.1.0 2.1.2 2.2.1)

case node["platform_family"]
when "debian"
  if node["platform"] == "ubuntu" && node["platform_version"] == "14.04"
    default["nginx"]["pid"] = "/run/nginx.pid"
  end
end
