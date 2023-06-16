FROM jupyter/base-notebook:latest

RUN pip install pyvista jupyter-server-proxy ipywidgets trame
RUN pip install opencv-python-headless

# Handle VTK
RUN pip uninstall vtk -y && \
    pip install --no-cache-dir --upgrade --extra-index-url https://gitlab.kitware.com/api/v4/projects/13/packages/pypi/simple vtk-osmesa

WORKDIR $HOME

COPY example.ipynb $HOME/

# allow jupyterlab for ipyvtk
ENV JUPYTER_ENABLE_LAB=yes
ENV PYVISTA_TRAME_SERVER_PROXY_PREFIX='/proxy/'
