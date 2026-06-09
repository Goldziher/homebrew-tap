# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.15.6-rc.19"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "9a9a037bd05cc6235b9cd019707b34d1e817daa7612cacd965c712da185ca4bb"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.15.6-rc.19"
    sha256 cellar: :any, arm64_linux: "6a49c20fce8b03563edc980ac9a83120e5a021322967247dfa2844f8e2b64c14"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d6ac73ddca9064c2a49fa87f53bc0b4b746b3cfb87901caee0e46de52bfac112"
    sha256 cellar: :any_skip_relocation, sequoia: "fe3e7670a313a6052f31568bc8598a0760b2339a88ab05bdf2a36e78a35e94c6"
    sha256 cellar: :any, x86_64_linux: "83cdd7fbc6b7c7d95902babeb952ea05cb4b296ec5af4186a7c346ab262274de"
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
