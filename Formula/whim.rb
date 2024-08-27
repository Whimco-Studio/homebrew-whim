class Whim < Formula
    desc "CLI tool to bootstrap and manage Roblox projects"
    homepage "https://github.com/Whimco-Studio/whim-tool"
    url "https://github.com/Whimco-Studio/whim-tool/archive/v1.0.1.tar.gz"
    sha256 "867b76607d85f910e321d5a3721c6fb1c688d2cee12e8c10924bd39bee774fd7"
    version "1.0.1"
  
    depends_on "python@3.9"
  
    def install
      # Install the script and supporting files
      libexec.install Dir["*"]
  
      # Create a virtual environment within the libexec directory
      system "python3", "-m", "venv", libexec/"venv"
  
      # Install required Python packages in the virtual environment
      system libexec/"venv/bin/pip", "install", "click"
  
      # Create a wrapper script that activates the virtual environment
      (bin/"whim").write_env_script libexec/"whim.py", {
        PYTHONPATH: "#{libexec}/lib/python3.9/site-packages",
        PATH: "#{libexec}/venv/bin:#{ENV["PATH"]}"
      }
    end
  
    test do
      system "#{bin}/whim", "--help"
    end
  end
  