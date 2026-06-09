# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.15.6-rc.17"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "e6554f5d0e327e9d08c2ef2e244a49255a922620ca2f59205b97326f122c80f7"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.15.6-rc.17"
    sha256 cellar: :any, arm64_linux: "22900f8f8d2836c64e95da3c9e987fe5e2c0823216c348725d616b781bdce196"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ce3e56aabc4991fa4ef0851ba68c7f83149e0d528a6982c2d5b50c5dd1d5d2a9"
    sha256 cellar: :any_skip_relocation, sequoia: "3a1826b99019ec4c536b2654d167f67cc732f610242b899b66f72f070522e4a5"
    sha256 cellar: :any, x86_64_linux: "39a04f5865ef4d381d356dd6abc026fa75495e6de6c7ffbf8d597931bee5558c"
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
