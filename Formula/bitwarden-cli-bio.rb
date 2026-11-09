class BitwardenCliBio < Formula
  desc "Bitwarden CLI with biometric unlock (Touch ID, Windows Hello, Linux)"
  homepage "https://github.com/jeanregisser/bitwarden-cli-bio"
  url "https://registry.npmjs.org/bitwarden-cli-bio/-/bitwarden-cli-bio-1.4.4.tgz"
  sha256 "29a6a727c089f265a1e21452a708ece7b8781239217435d11d33df9ec8e348cd"
  license "MIT"

  livecheck do
    url :stable
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bwbio --bwbio-version")
  end
end
