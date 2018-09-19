ix.dex: bin/w/ix/Ix.class untracked/software/usr/share/java/dx.jar untracked/software/usr/share/java/dex.jar
	cd bin && java -cp ../untracked/software/usr/share/java/dx.jar:../untracked/software/usr/share/java/dex.jar com.android.dx.command.Main --dex --output=../ix.dex w/ix/Ix.class

bin/w/ix/Ix.class: src/w/ix/Ix.java src/com/android/commands/input/Input.java | bin
	javac -d bin -source 1.7 -target 1.7 $^

bin:
	mkdir $@

DALVIK_EXCHANGE_VERSION := 6.0.1+r16-4
LIBDEX_JAVA_VERSION := 6.0.1+r10-2

untracked:
	mkdir $@

untracked/software: | untracked
	mkdir $@

untracked/software/usr/share/java/dx.jar: untracked/dalvik-exchange_${DALVIK_EXCHANGE_VERSION}_all.deb | untracked/software
	dpkg-deb --fsys-tarfile $< | tar -xvC untracked/software
	touch $@

untracked/dalvik-exchange_${DALVIK_EXCHANGE_VERSION}_all.deb: | untracked
	wget http://mirrors.kernel.org/ubuntu/pool/universe/a/android-platform-dalvik/dalvik-exchange_${DALVIK_EXCHANGE_VERSION}_all.deb

untracked/software/usr/share/java/dex.jar: untracked/libdex-java_${LIBDEX_JAVA_VERSION}_all.deb | untracked/software
	dpkg-deb --fsys-tarfile $< | tar -xvC untracked/software
	touch $@

untracked/libdex-java_${LIBDEX_JAVA_VERSION}_all.deb: | untracked
	wget http://mirrors.kernel.org/ubuntu/pool/universe/a/android-platform-libcore/libdex-java_${LIBDEX_JAVA_VERSION}_all.deb
