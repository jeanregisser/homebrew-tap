class BitwardenCliBio < Formula
  desc "Bitwarden CLI with biometric unlock (Touch ID, Windows Hello, Linux)"
  homepage "https://github.com/jeanregisser/bitwarden-cli-bio"
  url "https://registry.npmjs.org/bitwarden-cli-bio/-/bitwarden-cli-bio-1.4.1.tgz"
  sha256 "c410e23fddbf728373e9adde67c19222ec98574215433303d0df4afc365d0cae"
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
