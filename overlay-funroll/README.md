# overlay-funroll

Go dependency tarballs for Gentoo, for the
[funroll overlay](https://github.com/swomf/overlay-funroll)

Gentoo prefers _all_ dependencies to be present at the start of the build process.
(citation needed :3)

This leads to patterns such as:
* Rust crates being distfiles
* Go needing EGO_SUM (deprecated) or vendor/dependency tarballs in SRC_URI
* node_modules being tarballed in SRC_URI

The following subdirectories automate this.

## suggested readings

* [Gentoo wiki: Writing Go ebuilds](https://wiki.gentoo.org/wiki/Writing_go_Ebuilds#Packaging_the_dependencies)
* [ferki.it: Packaging Go dependencies for Gentoo](https://blog.ferki.it/2024/07/25/packaging-go-dependencies-for-gentoo/)
* [ferki.it: Host Gentoo dependency tarballs as GitHub releases](https://blog.ferki.it/2023/04/24/host-gentoo-dependency-tarballs-as-github-releases/)
