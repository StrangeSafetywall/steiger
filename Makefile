DESTDIR=
BINDIR=/usr/bin
SYSCONFDIR=/etc

all: steiger senderscore

# Verifica a existência dos arquivos
steiger: src/steiger functions
senderscore: src/steiger-senderscore functions
functions: src/steiger-functions conf/steiger.conf

# Copia os arquivos para os respectivos diretórios
install: steiger senderscore
	mkdir -p ${DESTDIR}${SYSCONFDIR}/
	mkdir -p ${DESTDIR}${BINDIR}/
	cp -f conf/steiger.conf ${DESTDIR}${SYSCONFDIR}/
	cp -f src/steiger{,-senderscore,-functions} ${DESTDIR}${BINDIR}/
	chmod +x ${DESTDIR}${BINDIR}/steiger{,-senderscore}

# Remove os arquivos instalados
uninstall:
	rm -f ${DESTDIR}${SYSCONFDIR}/steiger.conf
	rm -f ${DESTDIR}${BINDIR}/steiger{,-senderscore,-functions}
