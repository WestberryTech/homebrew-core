class Wb32DfuUpdaterCli < Formula
  desc "USB programmer"
  homepage "https://github.com/WestberryTech/wb32-dfu-updater"
  url "https://github.com/WestberryTech/wb32-dfu-updater/archive/refs/tags/1.0.0.tar.gz"
  sha256 "2b1c5b5627723067168af9740cb25c5c179634e133e4ced06028462096de5699"
  license "Apache-2.0"
  head "https://github.com/WestberryTech/wb32-dfu-updater.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "libusb"

  def install
    args = std_cmake_args

    libusb = Formula["libusb"]
    args << "-DLIBUSB_INCLUDE_DIRS=#{libusb.opt_include}/libusb-1.0"
    args << "-DLIBUSB_LIBRARIES=#{libusb.opt_lib/shared_library("libusb-1.0")}"

    system "cmake", "-S", ".", "-B", "build", *args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    printing_message = <<~EOS
      No DFU capable USB device available
    EOS
    assert_match printing_message, shell_output(bin/"wb32-dfu-updater_cli -U 111.bin")
  end
end
