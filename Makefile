INSTALL_PATH?=/usr/local/bin
INSTALL_NAME?=swift-sourcekite

.PHONY: release install

release:
	swift build -Xswiftc -framework -Xswiftc sourcekitd -Xswiftc -F -Xswiftc $(shell xcode-select -p)/Toolchains/XcodeDefault.xctoolchain/usr/lib -Xlinker -rpath -Xlinker /Library/Developer/Toolchains/swift-latest.xctoolchain/usr/lib -c release

install: release
	cp .build/release/sourcekite $(INSTALL_PATH)/$(INSTALL_NAME)

uninstall:
	@[ -f $(INSTALL_PATH)/$(INSTALL_NAME) ] && rm $(INSTALL_PATH)/$(INSTALL_NAME) || true
	@echo "Done"
