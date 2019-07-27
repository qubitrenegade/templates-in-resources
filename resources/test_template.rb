provides :template_test
resource_name :template_test

action :install do
  r = with_run_context :parent do
    do_the_template
  end
end

def after_created
  run_action(:install)
  action :nothing # don't run twice
end

action_class do
  def do_the_template
    template '/this-is-a-test' do
      source 'this-is-a-test'
      cookbook 'templates-in-resources'
      action :create
    end
  end
end
