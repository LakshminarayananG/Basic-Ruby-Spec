def run_tests(platform, browser, version)
  system("platform=\"#{platform}\" browserName=\"#{browser}\" version=\"#{version}\" rspec sample_spec_file.rb")
end

task :default => [:test_testingbot]

task :linux_chrome do
  run_tests('linux', 'chrome', 'latest')
end

task :linux_firefox do
  run_tests('linux', 'firefox','latest')
end

multitask :test_testingbot => [
    :linux_chrome,
    :linux_firefox
  ] do
    puts 'Running automation'
  end