# syntax=docker/dockerfile:1.4-labs

FROM archlinux:base-devel as libriichi_build

# Install dependencies
RUN <<EOF
pacman -Syu --noconfirm --needed python
pacman -Scc --noconfirm
EOF

# Install Rust using the official installation script
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

# Ensure Rust and Cargo are in the PATH
ENV PATH="/root/.cargo/bin:${PATH}"

WORKDIR /
COPY Cargo.toml Cargo.lock .
COPY libriichi libriichi
COPY exe-wrapper exe-wrapper

RUN cargo build -p libriichi --lib --release

# -----
FROM archlinux:base

RUN <<EOF
pacman -Syu --noconfirm --needed python python-pip python-pytorch python-toml python-tqdm tensorboard
pacman -Scc --noconfirm
EOF

# Verify that Python is installed and its location
RUN python -V

WORKDIR /mortal
COPY mortal .
COPY --from=libriichi_build /target/release/libriichi.so .

ENV MORTAL_CFG config.toml
COPY <<'EOF' config.toml
[control]
state_file = '/mnt/mortal.pth'

[resnet]
conv_channels = 192
num_blocks = 40
enable_bn = true
bn_momentum = 0.99
EOF


#模型来源于 https://github.com/shinkuan/Akagi
COPY mortal.pth /mnt/mortal.pth

ENTRYPOINT ["python", "mortal.py"]
