/*

Class: git-subtree

Installs git-subtree and adds a symlink to /usr/local/bin

*/
class git-subtree {

  if (versioncmp("1.6.999", $git_version) > 0) {
    fail "git-subtree requires git 1.7 or later!"
  }

  vcsrepo { "/usr/src/git-subtree":
    ensure   => present,
    source   => "http://github.com/apenwarr/git-subtree.git",
    provider => 'git',
    revision => '2793ee6ba',
  }

  file { "/usr/local/bin/git-subtree":
    ensure  => file,
    source  => "file:///usr/src/git-subtree/git-subtree.sh",
    owner   => "root",
    mode    => 0755,
    require => Vcsrepo["/usr/src/git-subtree"],
  }
}
