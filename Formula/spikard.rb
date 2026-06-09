# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.15.6-rc.18"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "a91dfaca6b6dd3a9803c85f5a5efbedaa3aec48916563318297fe04edf4c9ca4"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.15.6-rc.18"
    sha256 cellar: :any, arm64_linux: "16119aefd4238862e4cefa5fe10dea8b10dd550e7c8b5e08945894cc448a52ed"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "985f5a0ec8d3cc2b52f64b2e6154f4860ae0c4897c489c8bee5c92f73636cf1e"
    sha256 cellar: :any_skip_relocation, sequoia: "b5f0ee1df499280d44dad0b4c4b116730ac214b1afe24ba45bdb7c5d48576c82"
    sha256 cellar: :any, x86_64_linux: "fbc8d28564e5b3b01d2e5d9037371da72044795a7c9de6e64ff884f3b5fba09d"
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
