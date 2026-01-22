# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Polyglot API toolkit with Rust core and bindings for Python, Node.js, Ruby, and WASM"
  homepage "https://github.com/Goldziher/spikard"
  url "https://github.com/Goldziher/spikard/archive/v0.9.2.tar.gz"
  sha256 "c87c94ba6280222d7ec3f434dca92471b46efb92554f1e78ae96369c798a4e57"
  license "MIT"
  head "https://github.com/Goldziher/spikard.git", branch: "main"






  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.9.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "21ff96fdb1aaa238502c9100784beb70b8dcf733205470094f10f187cdf964f1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "568182c3c74317a9e21186f6d03e1950977c502223af9e0c742cda2ee503afb4"
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
