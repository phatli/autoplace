FROM phatli/base:2004

COPY requirements.txt /tmp/requirements.txt

RUN wget --quiet https://repo.continuum.io/miniconda/Miniconda3-py38_4.8.3-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p ~/conda && \
    rm ~/miniconda.sh
RUN ~/conda/bin/conda install -y -c conda-forge faiss-gpu

SHELL ["/bin/zsh", "-c"]

RUN ~/conda/bin/conda init zsh && . ~/.zshrc && \
    pip install --no-cache-dir torch==1.12.1+cu113 torchvision==0.13.1+cu113 torchaudio==0.12.1 --extra-index-url https://download.pytorch.org/whl/cu113 && \
    pip install --no-cache-dir -r /tmp/requirements.txt && pip uninstall numpy -y && pip install --no-cache-dir numpy==1.23 && \

ENTRYPOINT ["/bin/zsh"]
CMD ["-l"]
