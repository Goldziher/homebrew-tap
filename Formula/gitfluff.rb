class Gitfluff < Formula
  desc "Commit message linter with presets and cleanup automation"
  homepage "https://github.com/Goldziher/gitfluff"
  url "https://github.com/Goldziher/gitfluff/archive/refs/tags/v0.11.2.tar.gz"
  sha256 "74ed3db26094d0b5b10d22c63b67d358f02342f18a92cc7cfcaf0d5c361b2858"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/gitfluff/releases/download/v0.11.1"
    rebuild 3
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7b9a69be5d1e2577b42ebe51814d673fb5ce533c531b212f7ed7f286cf435335"
    sha256 cellar: :any,                 arm64_linux:   "ca6491ffbe22f026704dd6636003855162d613a2bfe6e50595678c2309250de2"
    sha256 cellar: :any,                 x86_64_linux:  "c7a66584c0f066d61670290c276fda27547e898af6eb3d876db1b2b4b7981b09"
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
