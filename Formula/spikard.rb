# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Polyglot API toolkit with Rust core and bindings for Python, Node.js, Ruby, and WASM"
  homepage "https://github.com/Goldziher/spikard"
  url "https://github.com/Goldziher/spikard/archive/v0.10.0.tar.gz"
  sha256 "c1444e8959e058c2f6649dc8c88589d5dbdfb9d5cb7de8971221c33d96c1725a"
  license "MIT"
  head "https://github.com/Goldziher/spikard.git", branch: "main"









  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.10.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d5eb430be14b9306c7c5eadf2d6f03be51a6f13c88c1acaf5bb2d0243501776a"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "46bcf182134b5aa78e50366ee3ce5dad2eeb048089e239b2a8e01af4d9fc504b"
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
