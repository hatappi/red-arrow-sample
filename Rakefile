require 'rubygems'
require 'bundler/gem_helper'

base_dir = File.join(__dir__)

desc "dockerでの環境をセットアップする"
task :setup do
  sh "docker run -d --cpus='2' --memory='4g' --name red-arrow-sample -v #{base_dir}:/arrow-sample hatappi/arrow-sample tail -f /dev/null"
end

desc "コンテナに入る"
task :login do
  sh 'docker exec -it red-arrow-sample bash -l'
end

desc "コンテナを落とす"
task :down do
  sh 'docker rm -f red-arrow-sample'
end

