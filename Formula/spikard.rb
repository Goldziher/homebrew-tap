# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.15.6-rc.14"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "e2629c480c8c19ef2b71fa24c35a39d724c686f32e15d35fd2aec73bc253ec3e"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.15.6-rc.14"
    sha256 cellar: :any, arm64_linux: "09577a8730b623249a431051a354bb71400ac15f7aedfd16c7ef2aabe52bfa72"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "57713fc38895621b6a10fac191430d1d550b80d08b53d22710351aac2c4be56e"
    sha256 cellar: :any_skip_relocation, sequoia: "e107aeb8dc366fb2468bb173828de5105b546f1533b5085494c6860ec071f0b3"
    sha256 cellar: :any, x86_64_linux: "7dd7889cb5f1d74e71411c15b80239d4ca11e8cd9c03697851d4e56be07ac7bf"
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
