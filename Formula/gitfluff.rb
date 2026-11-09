class Gitfluff < Formula
  desc "Commit message linter with presets and cleanup automation"
  homepage "https://github.com/Goldziher/gitfluff"
  url "https://github.com/Goldziher/gitfluff/archive/refs/tags/v0.11.2.tar.gz"
  sha256 "74ed3db26094d0b5b10d22c63b67d358f02342f18a92cc7cfcaf0d5c361b2858"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/gitfluff/releases/download/v0.11.2"
    rebuild 4
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4b5336e8ecb8caa6af249511e4ece96006f8eea7a1644bedbc1decca4ebbc636"
    sha256 cellar: :any,                 arm64_linux:   "4f82175c4f980b9fd007d288107d85a073db56f1b86045177c9fbadf0d83a1bb"
    sha256 cellar: :any,                 x86_64_linux:  "f12d19bc2ba76fa117e92d30cd93844c1bd59715a8182f74aa632d9cbf575522"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    (testpath/"COMMIT_EDITMSG").write "feat: add tests\n"
    system bin/"gitfluff", "lint", "--from-file", "COMMIT_EDITMSG"
  end
end
