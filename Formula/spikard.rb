# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Polyglot API toolkit with Rust core and bindings for Python, Node.js, Ruby, and WASM"
  homepage "https://github.com/Goldziher/spikard"
  url "https://github.com/Goldziher/spikard/archive/v0.9.1.tar.gz"
  sha256 "2e4dddef1dfdf91f785a6c96c68b5d6b00a1458410afa2fb58ee6a6e12f8a9c4"
  license "MIT"
  head "https://github.com/Goldziher/spikard.git", branch: "main"





  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.9.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9a94c89f2ebdcc58463fa965eb569d5b1c5181a7431327170689c87cdf6475d6"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "179c89b75abaf0017c636fdcc7e413b5d024e03bf6b8618d54552d13406db808"
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
