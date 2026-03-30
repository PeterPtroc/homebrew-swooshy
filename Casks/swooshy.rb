cask "swooshy" do
  version "2.2.5"
  sha256 "9034d4dfa7d80d48612395b56fdd5664d55dc5a32a9a7b7a947df581a0fec44b"

  url "https://github.com/PeterPtroc/Swooshy/releases/download/2.2.5/Swooshy-macOS-2.2.5.zip",
      verified: "github.com/PeterPtroc/Sweeesh/"
  name "Swooshy"
  desc "Open-source macOS touchpad-first window utility"
  homepage "https://github.com/PeterPtroc/Sweeesh"

  depends_on macos: ">= :sonoma"

  app "Swooshy.app"

  # reset accessibility records after install/upgrade.
  postflight do
    # tccutil exits non-zero when there is no existing record yet.
    system_command "/bin/sh",
                   args: ["-c", "tccutil reset Accessibility \"$1\" >/dev/null 2>&1 || true", "_", "com.xiamiyu123.swooshy"],
                   sudo: false
  end

  uninstall_postflight do
    system_command "/bin/sh",
                   args: ["-c", "tccutil reset Accessibility \"$1\" >/dev/null 2>&1 || true", "_", "com.xiamiyu123.swooshy"],
                   sudo: false
  end
end
