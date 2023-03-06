require "language/node"

class ApifyCli < Formula
  desc "Apify command-line interface"
  homepage "https://docs.apify.com/cli"
  url "https://registry.npmjs.org/apify-cli/-/apify-cli-0.13.0.tgz"
  sha256 "f4f0d95d77559a07ebb2e7d1b36f7ce7b837fd808a1f8a086e7bce2c2b590f40"
  license "Apache-2.0"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "apify-cli/#{version}", shell_output("#{bin}/apify --version")
  end
end
