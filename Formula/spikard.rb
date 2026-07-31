# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.17.0-rc.9"
  url "https://github.com/Goldziher/spikard.git",
      tag:      "v0.17.0-rc.9",
      revision: "745d0a8b20c7baacc1e5e8e55ddc50245952d587"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.17.0-rc.9"
    sha256 cellar: :any, arm64_linux: "7f4bba8f11ed299b5ce28d28221085c4f7949483994630934567957320d006af"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "9c84339934810c252e790fe6b242d7ecf379bef4d6cbc5ee972a2c143acf7d4e"
    sha256 cellar: :any, x86_64_linux: "a17138b4f967e127deeca0445dd575db1778608e9ae9029ae551bc9f47482965"
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
