Redmine::Plugin.register :working_time do
  name 'Working Time plugin'
  author 'CMD'
  description 'Tracking working time of members'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
  permission :view_working_time, working_time: :index
  menu :project_menu, :working_time, {controller: 'working_time', action: 'index'}, caption: 'Wokring Time', after: :activity, param: :project_id
end
