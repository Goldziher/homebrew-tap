# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.17.0-rc.7"
  url "https://github.com/Goldziher/spikard.git",
      tag:      "v0.17.0-rc.7",
      revision: "364d7489ff49f4af0c6f6afea0e647ec5dc97e63"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.17.0-rc.7"
    sha256 cellar: :any, arm64_linux: "92d11ff292a1f37c36d11f7dae96e7803e829c0a5addb01eed770cf656c0c62f"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "2dbd31db444a5fb0b94f8661dbd4da7ae9714d58691d09438509e2ba6fbba91b"
    sha256 cellar: :any, x86_64_linux: "7219271b5cd2dfd82773e408e7dd7f2807628b8d80d8e675bf7b54a69aaaaf24"
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
