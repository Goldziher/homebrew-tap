class Gitfluff < Formula
  desc "Commit message linter with presets and cleanup automation"
  homepage "https://github.com/Goldziher/gitfluff"
  url "https://github.com/Goldziher/gitfluff/archive/refs/tags/v0.9.1.tar.gz"
  sha256 "3da7c4f388c0d0c09f5461eb1b704d1f34677caaae52de2853d4f4e273a1ceb8"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/gitfluff/releases/download/v0.9.1"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fba4ccfd5378bedb873406bd66f94fe3ff778bfa1b0cdb882721cf7d3960c818"
    sha256 cellar: :any,                 arm64_linux:   "a4feaace89e6a0b446a670d3780454f69663b0582e4cd0140400215f498deba4"
    sha256 cellar: :any,                 x86_64_linux:  "00ffff863a7f45bbc38cd9f408d7bef4a551d2472af438502ddaf7ad43e1a621"
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
