# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Polyglot API toolkit with Rust core and bindings for Python, Node.js, Ruby, and WASM"
  homepage "https://github.com/Goldziher/spikard"
  url "https://github.com/Goldziher/spikard/archive/v0.8.3.tar.gz"
  sha256 "38ac4aaf9fb530e40836b35a58cd3a9d6da1f333da695ea92576d5e4e99e6ef9"
  license "MIT"
  head "https://github.com/Goldziher/spikard.git", branch: "main"



  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.8.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4650b17bf99e5774908d9b92937ebe2de17ac5eff11d77b5482ae85e13c65644"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "3b352cb516b038fd23131ef0a0e1406fb53355b7f74056cff93179cf0bcde819"
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
