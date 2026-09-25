class Gitfluff < Formula
  desc "Commit message linter with presets and cleanup automation"
  homepage "https://github.com/Goldziher/gitfluff"
  url "https://github.com/Goldziher/gitfluff/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "e149626be3a4cf7b8d4715519810dfc74fdf48281b39ec2b7d8f6c776f1857a6"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/gitfluff/releases/download/v0.9.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "146f54b0dd61cb9697688fe99682b59dc147a6ae40fbbb0e4d6cba78733dd002"
    sha256 cellar: :any,                 arm64_linux:   "4584ee32e6301c10d3eb4912d1a6565cbf4596e3a9d2538bab6003ea543a5416"
    sha256 cellar: :any,                 x86_64_linux:  "0074f8087c0e65ed4ae29ef7fae0a609999577fcb7dbdc7096007c767da55888"
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
