# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.16.0-rc.4"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "45cff7d53271b4d745eedc8274841d88fe0777598e9f8fd704e61275ac65795a"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.16.0-rc.4"
    sha256 cellar: :any, arm64_linux: "9f4d6db5b2f82c184f483fe3a1fff0b887f0aa26ef95a31e9912aba4eae5aac8"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "6b543a85bc2bdcf1fe5e8abe7548dc9438fe438bec1eea1f7ede381b6d950cf1"
    sha256 cellar: :any, x86_64_linux: "f48e81e0f992c9f68df6eae08879e8479878c38d5811762d15f0d57e3a06c0d9"
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
