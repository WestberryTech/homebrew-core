class DfuUtil < Formula
  desc "USB programmer"
  homepage "https://github.com/WestberryTech/wb32-dfu-updater"
  url "https://github.com/WestberryTech/wb32-dfu-updater/releases/download/v0.0.1/wb32-dfu-updater_cli-v0.0.1-macos.tar.gz"
  sha256 "09f890b7091788a62da607f391fdc44b8609e5657a901a3d9b06f8e677672835"
  license "GPL-2.0-or-later"
  revision 1
  head "https://github.com/WestberryTech/wb32-dfu-updater.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "libusb"

  def install
    mkdir "build" do
      system "cmake", "../source/wb32-dfu-updater_cli",
                      "-CMAKE_INSTALL_PREFIX=#{rpath}"
      system "make"
      system "make", "install"
    end
  end

  test do
    system bin/"wb32-dfu-updater_cli", "-V"
  end
end
