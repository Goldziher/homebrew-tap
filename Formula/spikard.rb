# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.17.0-rc.3"
  url "https://github.com/Goldziher/spikard.git",
      tag:      "v0.17.0-rc.3",
      revision: "022b9932e2a9006983709f8bc9875fd54cab977c"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.17.0-rc.3"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ea9ea29636cbbe778f35a04a3904fb0d55690315a52d3a529c56aac5ed2f5cf5"
    sha256 cellar: :any,                 arm64_linux:   "eb0da4e20538e3a79c21009df206d8b90681b43ce210305232a9c1608d936c52"
    sha256 cellar: :any,                 x86_64_linux:  "d753e2ee2814ef432f3d9505739b9abad2b75b3e41b5b210df5c39701a8c2bf6"
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
