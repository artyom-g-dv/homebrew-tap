cask "samsung-ml1210" do
  version "1.0.0"
  sha256 "c459a98665c104da48a66e193f862d6d95e836381457e4b35c4b594b4d589253"

  url "https://github.com/artyom-g-dv/samsung-ml1210-macos-driver/releases/download/v#{version}/SamsungML1210Driver-#{version}.pkg"
  name "Samsung ML-1210 SmartGDI driver"
  desc "CUPS driver (filter + PPD) for Samsung ML-1210 / ML-1200-series USB printers"
  homepage "https://github.com/artyom-g-dv/samsung-ml1210-macos-driver"

  pkg "SamsungML1210Driver-#{version}.pkg"

  uninstall_preflight do
    system_command "/usr/sbin/lpadmin",
                   args: ["-x", "ML-1210"],
                   sudo: true,
                   must_succeed: false
  end

  uninstall pkgutil: "com.samsunggdi.ml1210",
            delete:  "/usr/libexec/cups/filter/samsunggdi"

  caveats "Plug in the printer over USB; the 'ML-1210' print queue is created " \
          "automatically at install. If you install while it is unplugged, run: " \
          "sudo lpadmin -p ML-1210 -E -v \"$(lpinfo -v | awk 'tolower($0) ~ /usb.*samsung/ {print $2; exit}')\" " \
          "-P /Library/Printers/PPDs/Contents/Resources/Samsung-ML-1210-gdi.ppd"
end
