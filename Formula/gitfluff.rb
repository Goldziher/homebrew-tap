class Gitfluff < Formula
  desc "Commit message linter with presets and cleanup automation"
  homepage "https://github.com/Goldziher/gitfluff"
  url "https://github.com/Goldziher/gitfluff/archive/refs/tags/v0.10.0.tar.gz"
  sha256 "9150e4ccdcc9e7e3d9e532f00276ab1584544fc02b8937c67a4a1a5190f0d6dd"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/gitfluff/releases/download/v0.10.0"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6f7f68817257f88965809344d80f964f0da2a43e2fd51d7b95087f60fbd75fdb"
    sha256 cellar: :any,                 arm64_linux:   "e463f08b5c94e009f63b7cac34427932fb2c2adae7c1e494a5e5145d6dadc6c1"
    sha256 cellar: :any,                 x86_64_linux:  "4f4f8724ecac1581bbb62cbbb46e49a6ff1ddbf6601ecdedc5800d76d9ce90ef"
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
