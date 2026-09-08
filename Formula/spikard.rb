# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.17.0"
  url "https://github.com/Goldziher/spikard.git",
      tag:      "v0.17.0",
      revision: "77ca5e7bc746b608c2c7e0678c69a3a9b80b5075"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.17.0"
    sha256 cellar: :any, arm64_linux: "7e520c8e0cb29b73732b4256c325b73ddd7fc4fc6ebe986b230c9de91cd57415"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "142c30f8d80d20a3ea23a3d23bce5efd0373fbf2a0dc65d3b310dbed47096e0e"
    sha256 cellar: :any, x86_64_linux: "c7defa0e761b07b72f3557c191e329f861da4be1ad4440dc86e346adb849903b"
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
