#
# Fact that retrieves the current installed version of git.
#

output = %x{git --version 2>&1}

if $?.exitstatus and output.match(/git version (\d+\.\d+\.\d+\.\d+).*/)
  Facter.add("git_version") do
    setcode do
      $1
    end
  end
end
