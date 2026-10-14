# homebrew-tap

Personal Homebrew tap.

## samsung-ml1210 — Samsung ML-1210 USB printer driver for macOS

```sh
brew install --cask artyom-g-dv/tap/samsung-ml1210
```

Installs the `samsunggdi` CUPS filter + PPD and creates the `ML-1210`
print queue when the printer is on USB. Source:
https://github.com/artyom-g-dv/samsung-ml1210-macos-driver

Remove: `brew uninstall --cask artyom-g-dv/tap/samsung-ml1210`
(the print queue can be removed with `sudo lpadmin -x ML-1210`).
