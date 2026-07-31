# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.17.0-rc.10"
  url "https://github.com/Goldziher/spikard.git",
      tag:      "v0.17.0-rc.10",
      revision: "8d48e5d569d76922b505c7616743b90f09cd6bc9"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.17.0-rc.10"
    sha256 cellar: :any, arm64_linux: "253f528b089f66e890130ca3b309e7feb7a25c45f19a6be0c95281831bb066c6"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "75be3f07640c16b6fb1db855b67d5e18666600c0faf260bf6448dd04b2de5ec1"
    sha256 cellar: :any, x86_64_linux: "e842532d3f186c7c19ab96efd9c7fa781816e2a7a0c023709dda209bee595806"
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
