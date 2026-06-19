# typed: false
# frozen_string_literal: true

class Spikard < Formula
  desc "Rust-centric multi-language HTTP framework with polyglot bindings"
  homepage "https://github.com/Goldziher/spikard"
  version "0.16.0-rc.1"
  url "https://github.com/Goldziher/spikard/archive/v#{version}.tar.gz"
  sha256 "b0deb3951284c3916e656d8202c64ebe17f7ef8152c41a0661313ee701f28598"
  license "MIT"

  bottle do
    root_url "https://github.com/Goldziher/spikard/releases/download/v0.16.0-rc.1"
    sha256 cellar: :any, arm64_linux: "87df1b1f0ee4ee1f1741ef35775ddb3da9b97cbc6ea5d0e1bc51229d8f5f4098"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1db09e1167d4f784315b89de86c4b8ccb786726472ffa10a8bcdcfc0d0f28457"
    sha256 cellar: :any_skip_relocation, sequoia: "f16bfa97bf4271c5585c00bae34c1eec779292f2ddb7e389ffcc35af29e6740a"
    sha256 cellar: :any, x86_64_linux: "f5b2f7ca329b9973c0e452716b693ca133d720f0c12eec7b0eca8e54b37d892e"
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
