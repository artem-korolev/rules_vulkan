""" extension.bzl """

load("//:repo.bzl", "vulkan_repos")

def _rules_vulkan_extension_impl(ctx):
    """ Implementation of the module extension. We'll call vulkan_repos() with user-provided or default version. """

    # Grab the version passed by the user (or default to something):
    version = ctx.kwargs.get("version", "1.3.243.0")

    # This is the old macro that calls http_archive, http_7z, etc.
    vulkan_repos(version)

    # "vulkan_repos" registers four external repositories:
    #   vulkan_sdk
    #   vulkan_sdk_windows
    #   vulkan_sdk_linux
    #   vulkan_sdk_macos
    #
    # No need to return anything; the extension just needs to define them.

rules_vulkan_extension = module_extension(
    implementation = _rules_vulkan_extension_impl,
    # Optionally declare parameters:
    # e.g.,
    #   params = ["version"],
    # but you can also just do ctx.kwargs.get("version", "...").
)
