# https://gogojimmy.net/2012/07/03/understand-assets-pipline/
# 覆寫 assets:precompile 來判斷是否有更新 assets，如果沒有才執行 precompile
namespace :deploy do
  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      from = source.next_revision(current_revision)
      if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
        run_locally "bundle exec rake assets:precompile"
        find_servers_for_task(current_task).each do |server|
          run_locally "rsync -vr --exclude='.DS_Store' public/assets #{user}@#{server.host}:#{shared_path}/"
        end
      else
        logger.info "Skipping asset pre-compilation because there were no asset changes"
      end
    end
  end
end