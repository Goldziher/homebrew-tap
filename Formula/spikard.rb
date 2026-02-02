# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Polyglot API toolkit with Rust core and bindings for Python, Node.js, Ruby, and WASM"
  homepage "https://github.com/Goldziher/spikard"
  url "https://github.com/Goldziher/spikard/archive/v0.10.1.tar.gz"
  sha256 "53ca0d6bbfea5dba17556d28694c5d676c0bf3335e92c91a8e2bdeaa59472434"
  license "MIT"
  head "https://github.com/Goldziher/spikard.git", branch: "main"














  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.10.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "68d0011feba8d3ee3e9d9ee5c6ad784b636308def11d0ec752978b61a5cf80f2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "01b93fae814bdf29d2631020318f5f13ef3655dead94b5be4f35f5d5597b9fbb"
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
