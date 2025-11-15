#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 -y install @cosmic-desktop-environment \
    steam

# Use a COPR Example:
#
wget https://copr.fedorainfracloud.org/coprs/sentry/kernel-blu/repo/fedora-42/sentry-kernel-blu-fedora-42.repo -O /etc/yum.repos.d/kernel-blu.repo

rpm-ostree override replace --experimental --freeze --from repo='copr:copr.fedorainfracloud.org:sentry:kernel-blu' kernel kernel-core kernel-modules kernel-modules-core kernel-modules-extra
#dnf5 -y copr enable sentry/kernel-blu
#dnf update --refresh -y
# dnf5 -y install sentry/kernel-blu
# Disable COPRs so they don't end up enabled on the final image:
#dnf5 -y copr disable sentry/kernel-blu

#### Example for enabling a System Unit File

systemctl enable podman.socket
