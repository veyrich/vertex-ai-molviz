# Molecular visualization in Vertex AI Notebooks

*Introduction*

Molecular visualization facilitates more intuitive understanding of chemical structures, their dynamics and interactions. By integrating molecular visualization capabilities into Vertex AI Notebooks, one can take advantage of the simple and straightforward provisioning of notebooks through GCP while getting access to advanced features provided by frameworks such as [RDKit](https://rdkit.org/) and [py3Dmol](https://pypi.org/project/py3Dmol/).

The scripts provided here are intended to simplify the installation of RDKit and py3Dmol in Vertex AI Notebooks. As of April 2023, user-managed notebooks in Vertex AI are based on Debian 10. RDKit can usually be installed rather easily via [Debichem](https://wiki.debian.org/Debichem) but the fact that the default Python version on Debian 10 is the now obsolete (and no longer supported) Python 2.7 can cause issues. Vertex AI, for example, relies on the more recent Python 3.7 for running Jupyter notebooks. To work around this issue, the scripts provided here compile RDKit from scratch.

*Installation instructions*

1. Create a user-managed notebook using Python 3: Vertex AI -> Workbench -> USER-MANAGED NOTEBOOKS -> NEW NOTEBOOK)

2. Open Jupyterlab

3. Open a terminal: File -> New Launcher -> Terminal)

4. Clone the git repo: git clone https://github.com/veyrich/vertex-ai-molviz.git

5. Change to the repo dir: cd vertex-ai-molviz

6. Run the installation script: sudo sh -x ./install-rdkit.sh

7. Shutdown the current session for the changes to take effect: File -> Shut Down

8. Reopen Jupyterlab

To understand how to use molecular visualization, open the included Jupyter notebook called 'molecular-visualization.ipynb' and rerun it (Run -> Run All Cells).

[Sample visualization](sample-visualization.png)
