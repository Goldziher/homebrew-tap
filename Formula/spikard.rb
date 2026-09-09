# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.17.1"
  url "https://github.com/Goldziher/spikard.git",
      tag:      "v0.17.1",
      revision: "b839d5a55d7a5b3071324bbd496e025a54f2f973"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.17.1"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "98a59c29548ebc073747ee4307259e80b4b7c84ded2df83188eca1d9b6f382d2"
    sha256 cellar: :any,                 arm64_linux:   "32e71ac45ecae9f6873f8039aef734e7fd23fe6ea3521ad1e78985f75b571456"
    sha256 cellar: :any,                 x86_64_linux:  "2c5e238d795f557f0e38e73ff92289c360b71b85ed93182eb9b12fc1082b5a4a"
  end

  depends_on "pkg-config" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/spikard-cli")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/spikard --version")
  end
end
