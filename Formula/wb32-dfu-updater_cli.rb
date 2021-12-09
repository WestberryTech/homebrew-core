class DfuUtil < Formula
  desc "USB programmer"
  homepage "https://github.com/WestberryTech/wb32-dfu-updater"
  url "https://github.com/WestberryTech/wb32-dfu-updater/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "33e7aeb616bdd8e4f4b92de9c7a15d35e0188683e18f2d394728e2c74798d900"
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
