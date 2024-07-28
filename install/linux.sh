# Install dependencies
sudo apt update
sudo apt install -y cmake build-essential git puredata puredata-dev python3 python3-pip

# Download and install nn_tilde
git clone https://github.com/maurice-jo/nn_tilde_pi.git
cd nn_tilde_pi

# Download and install libtorch
mkdir lib
cd lib
curl -LO https://download.pytorch.org/libtorch/nightly/cpu/libtorch-shared-with-deps-latest.zip
unzip libtorch-shared-with-deps-latest.zip
rm -rf libtorch-shared-with-deps-latest.zip
cd ../

# Setup Build
mkdir build
cd build
export Torch_DIR=../lib/libtorch/share/cmake/Torch
cmake ../src/ -DCMAKE_BUILD_TYPE=Release

# Build and copy to root dir
make
cp frontend/puredata/nn_tilde/nn~.pd_linux ../../
