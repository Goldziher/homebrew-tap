# typed: false
# frozen_string_literal: true

class Scythe < Formula
  desc "SQL compiler and linter - generate type-safe code from SQL"
  homepage "https://github.com/Goldziher/scythe"
  url "https://github.com/Goldziher/scythe/archive/v0.2.0.tar.gz"
  sha256 "80246e84b62c3324060fd6d20ad6c3caf86615c47b0d732b96277adc0ff0a775"
  license "MIT"
  head "https://github.com/Goldziher/scythe.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/scythe-cli")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scythe --version")
  end
end
