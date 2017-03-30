#
# Cookbook Name:: tier_2
# Recipe:: mount_instance_packages
#
# Copyright (c) 2017 TORO Limited, All Rights Reserved.

# Create packages mount point
directory "#{node[:application][:packages]}"

mount "#{node[:application][:packages]}" do
  device "#{node[:infra][:efs_id]}.efs.#{node[:infra][:region]}.amazonaws.com:/#{node[:application][:assets_dir]}/packages/#{node[:opsworks][:instance][:hostname]}"
  fstype 'nfs'
  options 'rw,nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2'
  action [:mount]
end