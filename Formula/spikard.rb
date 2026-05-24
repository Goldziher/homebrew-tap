# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.15.6-rc.2"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "33e9d6d3e370bdbf79f72afaa912f7a9838c17d65af8c3767cd457dfe64f4420"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.15.6-rc.2"
    sha256 cellar: :any_skip_relocation, arm64_linux: "21e2e2ff7b01a6104d4f29c46022fdc17cb59b46a681a13fa430fdf97674ef60"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "02346d84f2838c3f03754aa42042354deaf1b782558cf4ad84e49a376b9ed4af"
    sha256 cellar: :any_skip_relocation, sequoia: "32903194c1e09af4e40c1bebdb6b57bb9212eb7c40dbaf554cdb7cf26de3fc66"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bc13fa0103fc38898dcb93ecc077a24cee588036d7c3b727f2741f00f84002d2"
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
