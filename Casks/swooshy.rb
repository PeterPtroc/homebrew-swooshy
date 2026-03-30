cask "swooshy" do
  version "2.2.6"
  sha256 "f8dcd5caf02beba441d33059573891d48059732e1b83131d447bc7fbb7bfcd1e"

  url "https://github.com/PeterPtroc/Swooshy/releases/download/2.2.6/Swooshy-macOS-2.2.6.zip",
      verified: "github.com/PeterPtroc/Sweeesh/"
  name "Swooshy"
  desc "Open-source macOS touchpad-first window utility"
  homepage "https://github.com/PeterPtroc/Sweeesh"

  depends_on macos: ">= :sonoma"

  app "Swooshy.app"

  uninstall quit: "com.xiamiyu123.swooshy"

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
