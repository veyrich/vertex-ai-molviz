#!/bin/sh

DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y vim cmake g++ python3 libpython3.7 python3-numpy libfreetype6 git
apt-get install -y libboost-iostreams1.74.0 libboost-system1.74.0 \
    libboost-python1.74.0 libboost-serialization1.74.0 libboost-program-options1.74.0
apt-get install -y libeigen3-dev libboost-iostreams1.74-dev \
    libboost-system1.74-dev libfreetype6-dev libboost-python1.74-dev \
    libboost-serialization1.74-dev libboost-program-options1.74-dev

python=/opt/conda/bin/python
echo "python: $python"

RDKIT_BRANCH=Release_2022_09
cd /
git clone --branch $RDKIT_BRANCH --single-branch https://github.com/rdkit/rdkit.git
cd rdkit/
export RDBASE=/rdkit
export LD_LIBRARY_PATH=$RDBASE/lib
export PYTHONPATH=$RDBASE
mkdir build
cd build
sed -i 's/option(RDK_BUILD_CPP_TESTS "build the c++ tests (disabing can speed up builds" ON)/option(RDK_BUILD_CPP_TESTS "build the c++ tests (disabing can speed up builds" OFF)/' ../CMakeLists.txt
sed -i 's/option(RDK_BUILD_MAEPARSER_SUPPORT "build the rdkit MAE parser wrapper" ON )/option(RDK_BUILD_MAEPARSER_SUPPORT "build the rdkit MAE parser wrapper" OFF )/' ../CMakeLists.txt
cmake .. -DPYTHON_EXECUTABLE=$python
make -j 4
make install
python3 -c "from rdkit import Chem; m = Chem.MolFromSmiles('Cc1ccccc1');print(m);print(m.GetNumAtoms())"

#set required env vars for RDKit
cat > /etc/profile.d/rdkit.sh <<'EOF'
export RDBASE=/rdkit
export LD_LIBRARY_PATH=$RDBASE/lib
export PYTHONPATH=$RDBASE
EOF


#molecule viewer
jupyter labextension install jupyterlab_3dmol
/opt/conda/bin/pip3 install py3Dmol

