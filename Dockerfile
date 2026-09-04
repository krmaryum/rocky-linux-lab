FROM rockylinux:9

LABEL org.opencontainers.image.title="Rocky Linux Student Practice Lab"
LABEL org.opencontainers.image.description="Rocky Linux 9 hands-on Linux administration lab for students"
LABEL org.opencontainers.image.version="4.2.1"

# ------------------------------------------------------------
# Install Linux administration and troubleshooting tools
# ------------------------------------------------------------
RUN dnf -y install \
    vim-enhanced \
    nano \
    wget \
    iproute \
    iputils \
    net-tools \
    procps-ng \
    sudo \
    openssh-clients \
    findutils \
    tar \
    gzip \
    zip \
    unzip \
    which \
    less \
    hostname \
    tree \
    lsof \
    bind-utils \
    traceroute \
    rsync \
    bash-completion \
    tmux \
    ncurses \
    diffutils \
    cronie \
    file \
    && dnf clean all \
    && rm -rf /var/cache/dnf

# ------------------------------------------------------------
# Create student practice user
# ------------------------------------------------------------
RUN useradd -m -s /bin/bash labuser \
    && usermod -aG wheel labuser

# ------------------------------------------------------------
# Install lab engine and student commands
# ------------------------------------------------------------
RUN mkdir -p /usr/local/lib/rocky-linux-lab

RUN mkdir -p /usr/local/share/rocky-linux-lab

COPY --chmod=644 lab/README.md \
    /usr/local/share/rocky-linux-lab/README.md

COPY --chmod=755 lab/linux-practice.sh \
    /usr/local/lib/rocky-linux-lab/linux-practice.sh

COPY --chmod=755 lab/lab-help \
    /usr/local/bin/lab-help

COPY --chmod=755 lab/lab-reset \
    /usr/local/bin/lab-reset

COPY --chmod=755 lab/lab-start \
    /usr/local/bin/lab-start

COPY --chmod=755 lab/welcome.sh \
    /usr/local/bin/rocky-lab-welcome

# ------------------------------------------------------------
# Allow labuser to reset only the practice lab without password
# ------------------------------------------------------------
RUN echo 'labuser ALL=(root) NOPASSWD: /usr/local/bin/lab-reset' \
        > /etc/sudoers.d/lab-reset \
    && chmod 440 /etc/sudoers.d/lab-reset \
    && visudo -cf /etc/sudoers.d/lab-reset

 

# ------------------------------------------------------------
# Create the initial Linux practice environment
# ------------------------------------------------------------
RUN /usr/local/lib/rocky-linux-lab/linux-practice.sh \
    && chown -R labuser:labuser /home/labuser/linux-practice

# ------------------------------------------------------------
# Show welcome screen whenever an interactive Bash shell opens
# ------------------------------------------------------------
RUN printf '\nif [[ $- == *i* ]] && command -v rocky-lab-welcome >/dev/null 2>&1; then\n    rocky-lab-welcome\nfi\n' \
        >> /root/.bashrc \
    && printf '\nif [[ $- == *i* ]] && command -v rocky-lab-welcome >/dev/null 2>&1; then\n    rocky-lab-welcome\nfi\n' \
        >> /home/labuser/.bashrc \
    && chown labuser:labuser /home/labuser/.bashrc

WORKDIR /home/labuser/linux-practice

CMD ["/bin/bash"]
