# Setting Up a Quantum-Safe Ubuntu
```bash
#Update package lists and install updates
cd
sudo apt update
sudo apt -y full-upgrade

#Get OpenSSL version 3.1.3

#Download the source code file for OpenSSL 3.1.3
wget https://www.openssl.org/source/openssl-3.1.3.tar.gz
#Extract the content of the file
tar -xvf openssl-3.1.3.tar.gz
#Remove the compressed file
rm openssl-3.1.3.tar.gz

#Install tools and libraries to build software and create standard packages
sudo apt -y install build-essential checkinstall
#Configure and compile OpenSSL 3.1.3 and install to /usr/local
cd openssl-3.1.3/
./Configure
make
make test
sudo make install
#Output should be similar to below.

#All tests successful.
#Files=252, Tests=3369, 357 wallclock secs ( 5.25 usr  1.75 sys + 246.21 cusr 84.06 csys = 337.27 CPU)
#Result: PASS
#make[1]: Leaving directory '/home/vboxuser/openssl-3.1.3'

#Clean up
cd ..
sudo rm -rf openssl-3.1.3/

#Update system's library configuration to recognize the new OpenSSL

#Navigate to where the dynamic linker looks for shared libraries
cd /etc/ld.so.conf.d/
#Create a configuration file
sudo touch openssl-3.1.3.conf
#Append the path to the .conf file, for the dynamic linker to look for shared libraries
echo "/usr/local/lib" | sudo tee -a openssl-3.1.3.conf
cd
#Refresh the dynamic linker
sudo ldconfig -v
#Rename the c_rehash utility
sudo mv /usr/bin/c_rehash /usr/bin/c_rehash.bak
#Rename the openssl binary
sudo mv /usr/bin/openssl /usr/bin/openssl.bak

#Ensure that the newly built OpenSSL recognizes the system's default certificate trust store 
echo 'SSL_CERT_DIR="/etc/ssl/certs"' | sudo tee -a /etc/environment 
export SSL_CERT_DIR=/etc/ssl/certs

#Get liboqs version 0.9.0
wget https://github.com/open-quantum-safe/liboqs/archive/refs/tags/0.9.0.tar.gz -O liboqs-0.9.0.tar.gz
#Extract the content of the file
tar -xvf liboqs-0.9.0.tar.gz
#Remove the compressed file
rm liboqs-0.9.0.tar.gz

#Get dependencies for liboqs
sudo apt -y install astyle cmake gcc ninja-build libssl-dev python3-pytest python3-pytest-xdist unzip xsltproc doxygen graphviz python3-yaml valgrind 

#Build liboqs 0.9.0 against the new OpenSSL
cd liboqs-0.9.0/
mkdir build && cd build
#Configure the build process for liboqs
cmake -GNinja .. -DBUILD_SHARED_LIBS=ON -DOPENSSL_ROOT_DIR=/usr/local -DOQS_ALGS_ENABLED=ALL
#Compile liboqs
ninja
#Run tests to ensure proper functionality and build of liboqs
ninja run_tests
#Generate documentation for liboqs
ninja gen_docs
#Install built liboqs library to system
sudo ninja install
#Clean up
cd ../.. && rm -rf liboqs-0.9.0/

#Add a configuration file pointing to new liboqs library
cd /etc/ld.so.conf.d/
sudo touch liboqs-0.9.0.conf
echo "/usr/local/lib" | sudo tee -a liboqs-0.9.0.conf
cd
#Update dynamic linker cache
sudo ldconfig -v

#Get oqs-provider 0.5.2
wget https://github.com/open-quantum-safe/oqs-provider/archive/refs/tags/0.5.2.tar.gz -O oqs-provider-0.5.2.tar.gz 
tar -xvf oqs-provider-0.5.2.tar.gz
rm oqs-provider-0.5.2.tar.gz

#Build and install
cd oqs-provider-0.5.2/
#Configure the build process for oqs-provider
cmake -S . -B _build -DOPENSSL_ROOT_DIR=/usr/local -Dliboqs_DIR=/usr/local -DBUILD_SHARED_LIBS=ON
#Compile the oqs-provider
cmake --build _build
#Run tests to ensure proper functionality of build
ctest --test-dir _build
#Install the compiled oqs-provider to the system
sudo cmake --install _build
#Clean up
cd .. && sudo rm -rf oqs-provider-0.5.2/

#Ensure  post-quantum cryptographic capabilities by oqs-provider are integrated and available alongside classical algorithms in OpenSSL 3.1.3

#Change openssl.cnf to activate configuration
sudo sed -i '/default = default_sect/a oqsprovider = oqsprovider_sect\n[oqsprovider_sect]\nactivate = 1\n' /etc/ssl/openssl.cnf
sudo sed -i '/# activate = 1/c activate = 1\n' /etc/ssl/openssl.cnf

#Perform final checks
openssl list -providers -verbose
openssl list -signature-algorithms
openssl list -kem-algorithms

#Reload environment for the SSL_CERT_DIR variable to persist
source /etc/environment
```
