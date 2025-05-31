FROM fedora:39

RUN dnf install -y python3-pip git nodejs; dnf clean all

RUN pip install --no-cache-dir jupyterlab ipywidgets numpy plotly sympy jupyterlab-git

ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--no-browser", "--notebook-dir=/app"]

