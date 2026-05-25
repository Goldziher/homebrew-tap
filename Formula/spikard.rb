# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.15.6-rc.4"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "75778acdf945fad5421df5cd15e88d04918adefaf709d49ae728a22bba7790e9"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.15.6-rc.4"
    sha256 cellar: :any_skip_relocation, arm64_linux: "ce6e2249cace30ab2d3d9b3d4d0a4a6f02227df5de45c861f49bbc3706dc774b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "63afdcb13cd3c2ab4e87bcfbe3accc6daebd0e87fca64b1fb3a32bcf556bfb55"
    sha256 cellar: :any_skip_relocation, sequoia: "06054a20b82e016bfe1fb3f72f83f9e4d253c1885c7205f765d3ea1ed88feb7b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "09f4fee0bb763650f1ed4294a53a0e5292ac370a1f9673a9f4fe08af060c8b6c"
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
