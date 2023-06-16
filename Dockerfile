FROM jupyter/base-notebook:latest

RUN pip install pyvista jupyter-server-proxy ipywidgets trame
RUN pip install opencv-python-headless

# Handle VTK
RUN pip uninstall vtk -y && \
    pip install --no-cache-dir --upgrade --extra-index-url https://wheels.pyvista.org vtk-osmesa

WORKDIR $HOME

COPY example.ipynb $HOME/

# allow jupyterlab for ipyvtk
ENV JUPYTER_ENABLE_LAB=yes
ENV PYVISTA_TRAME_SERVER_PROXY_PREFIX='/proxy/'
