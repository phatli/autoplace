FROM phatli/base:2004

COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

ENTRYPOINT ["/bin/zsh"]
CMD ["-l"]
