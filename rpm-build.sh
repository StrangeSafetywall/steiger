#!/bin/sh
PACKAGE=steiger
VERSION=0.1.0
RPM_BUILD=~/rpmbuild

# Cria os diretórios bases para a construção do pacote
mkdir -p ${RPM_BUILD}/{BUILDS,RPMS,SOURCES,SPECS,SRPMS}

# Cria o diretório com a versão a ser gerada
mkdir ${PACKAGE}-${VERSION}

# Copia o fonte para o diretório
cp -R * ${PACKAGE}-${VERSION}/

# Targerian
tar cf v${VERSION}.tar.gz ${PACKAGE}-${VERSION}/

# Copia a spec para o diretório base
cp -f steiger.spec ${RPM_BUILD}/SPECS/

# Copia o fonte para o diretório base
cp -f v${VERSION}.tar.gz ${RPM_BUILD}/SOURCES

# Remove os arquivos criados do diretório atual
rm -rf v${VERSION}.tar.gz ${PACKAGE}-${VERSION}/

# Cria o pacote
rpmbuild -ba ${RPM_BUILD}/SPECS/steiger.spec
