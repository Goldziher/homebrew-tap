class Gitfluff < Formula
  desc "Commit message linter with presets and cleanup automation"
  homepage "https://github.com/Goldziher/gitfluff"
  url "https://github.com/Goldziher/gitfluff/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "e149626be3a4cf7b8d4715519810dfc74fdf48281b39ec2b7d8f6c776f1857a6"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    (testpath/"COMMIT_EDITMSG").write "feat: add tests\n"
    system bin/"gitfluff", "lint", "--from-file", "COMMIT_EDITMSG"
  end
end
