FROM node:22-bookworm as base
#環境変数
ENV GOPATH=/home/node/.local/go
ENV ANDROID_HOME=/home/node/.local/android-sdk
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH=$PATH:$JAVA_HOME/bin:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools/bin:$GOPATH/bin:$PATH

#基本的なパッケージのインストール
RUN apt-get update && \
    apt-get install -y \
    sudo \
    locales \
    wget \
    unzip \
    libpulse0 \
    qemu-kvm \
    libvirt-daemon-system \
    libvirt-clients \
    bridge-utils \
    virt-manager \
    cpu-checker \
    openjdk-17-jdk \
    android-sdk \
    && apt-get clean

RUN usermod -aG sudo node \
    && echo "node ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/node \
    && gpasswd -a node kvm

RUN mkdir -p /workspace
RUN chown -R node:node /workspace
USER node
WORKDIR /home/node
RUN mkdir .local && \
    wget https://go.dev/dl/go1.24.1.linux-amd64.tar.gz && \
    rm -rf .local/go && tar -C .local/ -xzf go1.24.1.linux-amd64.tar.gz && \
    rm go1.24.1.linux-amd64.tar.gz


#開発用
FROM base as dev
RUN sudo apt-get install -y tree
WORKDIR /workspace/app
RUN go install github.com/air-verse/air@latest
WORKDIR /home/node
RUN wget https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip && \
    unzip commandlinetools-linux-10406996_latest.zip -d ./ && \
    mkdir -p .local/android-sdk/cmdline-tools/latest && \
    mv cmdline-tools/* .local/android-sdk/cmdline-tools/latest && \
    rm commandlinetools-linux-10406996_latest.zip
RUN yes | sdkmanager --licenses && \
    sdkmanager --update && \
    sdkmanager "platform-tools" "emulator" "platforms;android-35" "build-tools;35.0.0" && \
    sdkmanager --install "system-images;android-35;default;x86_64" && \
    avdmanager create avd --name android35 --device "pixel_7" --package "system-images;android-35;default;x86_64"
WORKDIR /workspace

CMD ["bash"]
