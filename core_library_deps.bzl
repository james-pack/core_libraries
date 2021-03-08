load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def core_library_deps():
    if not native.existing_rule("com_google_googletest"):
        http_archive(
            name = "com_google_googletest",
            sha256 = "94c634d499558a76fa649edb13721dce6e98fb1e7018dfaeba3cd7a083945e91",
            strip_prefix = "googletest-release-1.10.0",
            urls = [
                "https://github.com/google/googletest/archive/release-1.10.0.zip",
            ],
        )

    if not native.existing_rule("com_github_gflags_gflags"):
        http_archive(
            name = "com_github_gflags_gflags",
            sha256 = "34af2f15cf7367513b352bdcd2493ab14ce43692d2dcd9dfc499492966c64dcf",
            strip_prefix = "gflags-2.2.2",
            urls = [
                "https://github.com/gflags/gflags/archive/v2.2.2.tar.gz",
            ],
        )

    if not native.existing_rule("com_github_google_glog"):
        http_archive(
            name = "com_github_google_glog",
            sha256 = "62efeb57ff70db9ea2129a16d0f908941e355d09d6d83c9f7b18557c0a7ab59e",
            strip_prefix = "glog-d516278b1cd33cd148e8989aec488b6049a4ca0b",
            urls = ["https://github.com/google/glog/archive/d516278b1cd33cd148e8989aec488b6049a4ca0b.zip"],
        )

    if not native.existing_rule("rules_proto"):
        http_archive(
            name = "rules_proto",
            strip_prefix = "rules_proto-a0761ed101b939e19d83b2da5f59034bffc19c12",
            urls = [
                "https://mirror.bazel.build/github.com/bazelbuild/rules_proto/archive/a0761ed101b939e19d83b2da5f59034bffc19c12.tar.gz",
                "https://github.com/bazelbuild/rules_proto/archive/a0761ed101b939e19d83b2da5f59034bffc19c12.tar.gz",
            ],
        )

    if not native.existing_rule("com_google_absl"):
        http_archive(
            name = "com_google_absl",
            strip_prefix = "abseil-cpp-98eb410c93ad059f9bba1bf43f5bb916fc92a5ea",
            urls = ["https://github.com/abseil/abseil-cpp/archive/98eb410c93ad059f9bba1bf43f5bb916fc92a5ea.zip"],
        )
