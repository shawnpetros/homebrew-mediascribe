class Mediascribe < Formula
  desc "TUI-first tool for transcribing, translating, and analyzing audio/video media"
  homepage "https://github.com/shawnpetros/mediascribe"
  url "https://files.pythonhosted.org/packages/13/5f/0026c112349338738df0e9a0d90cedfe40abd80249a2267d46eb926f292a/mediascribe-0.10.1.tar.gz"
  sha256 "e7b93ca7a1df7d56131ec8e64df5cab4d6f020500e5264a64cf7a61c4cc8a8de"
  license "MIT"
  head "https://github.com/shawnpetros/mediascribe.git", branch: "main"

  depends_on "ffmpeg"
  depends_on "python@3.13"

  def install
    python3 = "python3.13"
    venv = libexec/"venv"
    system python3, "-m", "venv", venv
    system venv/"bin/pip", "install", "--upgrade", "pip"
    system venv/"bin/pip", "install", cached_download
    bin.install_symlink venv/"bin/mediascribe"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mediascribe --version")
  end
end
