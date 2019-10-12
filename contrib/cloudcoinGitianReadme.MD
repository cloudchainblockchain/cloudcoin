#setup
## Set env var

```

export SIGNER=Bago213
export VERSION=0.15.1

```

## Install

```

sudo cloudcoin/contrib/gitian-build-linux.py ${SIGNER} ${VERSION} --setup --docker -j3

```

#build

## Set env var

```

export SIGNER=Bago213
export VERSION=0.15.1

```

## linux

```

sudo cloudcoin/contrib/gitian-build-linux.py ${SIGNER} ${VERSION} --build --docker -j3

cd gitian-builder

sudo ./bin/gsign --signer ${SIGNER} --release ${VERSION}-linux-unsigned --destination ../gitian.sigs/ ../cloudcoin/contrib/gitian-descriptors/gitian-linux.yml

./bin/gverify -v -d ../gitian.sigs/ -r ${VERSION}-linux-unsigned ../cloudcoin/contrib/gitian-descriptors/gitian-linux.yml

cd


```

## windows

```

sudo cloudcoin/contrib/gitian-build-windows.py ${SIGNER} ${VERSION} --build --docker -j3

cd gitian-builder

sudo ./bin/gsign --signer ${SIGNER} --release ${VERSION}-windows-unsigned --destination ../gitian.sigs/ ../cloudcoin/contrib/gitian-descriptors/gitian-windows.yml

./bin/gverify -v -d ../gitian.sigs/ -r ${VERSION}-windows-unsigned ../cloudcoin/contrib/gitian-descriptors/gitian-windows.yml

cd

```

## mac

```

sudo cloudcoin/contrib/gitian-build-osx.py ${SIGNER} ${VERSION} --build --docker -j3

cd gitian-builder

sudo ./bin/gsign --signer ${SIGNER} --release ${VERSION}-osx-unsigned --destination ../gitian.sigs/ ../cloudcoin/contrib/gitian-descriptors/gitian-osx.yml

./bin/gverify -v -d ../gitian.sigs/ -r ${VERSION}-osx-unsigned ../cloudcoin/contrib/gitian-descriptors/gitian-osx.yml

cd


```


