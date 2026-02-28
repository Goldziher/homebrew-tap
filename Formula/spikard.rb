# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Polyglot API toolkit with Rust core and bindings for Python, Node.js, Ruby, and WASM"
  homepage "https://github.com/Goldziher/spikard"
  url "https://github.com/Goldziher/spikard/archive/v0.12.0.tar.gz"
  sha256 "f7124e9a86ab78f62d6494e20b321159b5f9c742ba7cf638b0fb2cec11542022"
  license "MIT"
  head "https://github.com/Goldziher/spikard.git", branch: "main"




















  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.12.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "78a27e7cfa4fee96db7d0b3074877532f068820953eea25ef4b63ab8dd93377a"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "712626b0ca618a13247aaa76f70de59c29aca4b52fbbb2ac9f93e29a587b8475"
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
