{ system ? builtins.currentSystem # TODO: Get rid of this system cruft
, iosSdkVersion ? "10.2"
}:
with import ./.obelisk/impl { inherit system iosSdkVersion; };
project ./. ({ pkgs, ... }: {
  android.applicationId = "ca.srid.lesarts";
  android.displayName = "Les Arts";
  ios.bundleIdentifier = "ca.srid.lesarts";
  ios.bundleName = "Les Arts";

  packages = {
    reflex-dom-svg = pkgs.fetchFromGitHub {
      owner = "qfpl";
      repo = "reflex-dom-svg";
      rev = "8c985fa9c210a061fc70893823b58c765bfdb7c3";
      sha256 = "0cqdc3nz9lk8q0vh651wsc8siaz7aam03vvqwxgfpj6dnl9biq6r";
    };
  };
})
