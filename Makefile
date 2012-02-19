ARCH ?= x86_64
CONFIGURATION ?= DEBUG

ifeq ($(ARCH),i386)
BITS = 32
else
BITS = 64
endif

VPATH = app app/en.lproj json oniguruma oniguruma/enc universalchardet lemon util par xorkey help plblockimp/Source plblockimp/Source/x86_$(BITS) $(shell mkdir -p $(DERIVEDDIR) && echo $(DERIVEDDIR))

.SUFFIXES:

JSON_OBJC_SRCS = \
	NSObject+JSON.m \
	SBJsonParser.m \
	SBJsonStreamParser.m \
	SBJsonStreamParserAdapter.m \
	SBJsonStreamParserState.m \
	SBJsonStreamWriter.m \
	SBJsonStreamWriterState.m \
	SBJsonTokeniser.m \
	SBJsonWriter.m

OBJC_SRCS = \
	ExAddress.m \
	ExCommand.m \
	ExCommandCompletion.m \
	ExMap.m \
	ExParser.m \
	ExTextField.m \
	MHTextIconCell.m \
	NSArray-patterns.m \
	NSEvent-keyAdditions.m \
	NSMenu-additions.m \
	NSObject+SPInvocationGrabbing.m \
	NSOutlineView-vimotions.m \
	NSScanner-additions.m \
	NSString-additions.m \
	NSString-scopeSelector.m \
	NSTableView-vimotions.m \
	NSTask-streaming.m \
	NSURL-additions.m \
	NSView-additions.m \
	NSWindow-additions.m \
	Nu.m \
	PSMMetalTabStyle.m \
	PSMOverflowPopUpButton.m \
	PSMProgressIndicator.m \
	PSMRolloverButton.m \
	PSMTabBarCell.m \
	PSMTabBarControl.m \
	PSMTabDragAssistant.m \
	SFTPConnection.m \
	SFTPConnectionPool.m \
	TMFileURLProtocol.m \
	TxmtURLProtocol.m \
	ViAppController.m \
	ViBgView.m \
	ViBufferCompletion.m \
	ViBufferedStream.m \
	ViBundle.m \
	ViBundleCommand.m \
	ViBundleItem.m \
	ViBundleSnippet.m \
	ViBundleStore.m \
	ViCommand.m \
	ViCommandMenuItemView.m \
	ViCommandOutputController.m \
	ViCompletion.m \
	ViCompletionController.m \
	ViCompletionView.m \
	ViCompletionWindow.m \
	ViDocument.m \
	ViDocumentController.m \
	ViDocumentView.m \
	ViError.m \
	ViEventManager.m \
	ViFile.m \
	ViFileCompletion.m \
	ViFileExplorer.m \
	ViFileURLHandler.m \
	ViHTTPURLHandler.m \
	ViJumpList.m \
	ViKeyManager.m \
	ViLanguage.m \
	ViLayoutManager.m \
	ViMacro.m \
	ViMap.m \
	ViMark.m \
	ViMarkInspector.m \
	ViMarkManager.m \
	ViOutlineView.m \
	ViParser.m \
	ViPathCell.m \
	ViPathComponentCell.m \
	ViPathControl.m \
	ViPreferencePane.m \
	ViPreferencePaneAdvanced.m \
	ViPreferencePaneBundles.m \
	ViPreferencePaneEdit.m \
	ViPreferencePaneGeneral.m \
	ViPreferencePaneTheme.m \
	ViPreferencesController.m \
	ViProject.m \
	ViRegexp.m \
	ViRegisterManager.m \
	ViRulerView.m \
	ViSFTPURLHandler.m \
	ViScope.m \
	ViSeparatorCell.m \
	ViSnippet.m \
	ViSymbolController.m \
	ViSymbolTransform.m \
	ViSyntaxCompletion.m \
	ViSyntaxContext.m \
	ViSyntaxMatch.m \
	ViSyntaxParser.m \
	ViTabController.m \
	ViTagsDatabase.m \
	ViTaskRunner.m \
	ViTextStorage.m \
	ViTextView-bundle_commands.m \
	ViTextView-cursor.m \
	ViTextView-ex_commands.m \
	ViTextView-snippets.m \
	ViTextView-vi_commands.m \
	ViTextView.m \
	ViTheme.m \
	ViThemeStore.m \
	ViToolbarPopUpButtonCell.m \
	ViTransformer.m \
	ViURLManager.m \
	ViViewController.m \
	ViWebView.m \
	ViWindow.m \
	ViWindowController.m \
	ViWordCompletion.m \
	main.m \
	$(JSON_OBJC_SRCS)

OBJCXX_SRCS = \
	ViCharsetDetector.mm

C_SRCS = \
	ber.c \
	regcomp.c \
	regenc.c \
	regerror.c \
	regexec.c \
	regext.c \
	reggnu.c \
	regparse.c \
	regposerr.c \
	regposix.c \
	regsyntax.c \
	regtrav.c \
	regversion.c \
	st.c \
	ascii.c \
	big5.c \
	cp1251.c \
	euc_jp.c \
	euc_kr.c \
	euc_tw.c \
	gb18030.c \
	iso8859_1.c \
	iso8859_10.c \
	iso8859_11.c \
	iso8859_13.c \
	iso8859_14.c \
	iso8859_15.c \
	iso8859_16.c \
	iso8859_2.c \
	iso8859_3.c \
	iso8859_4.c \
	iso8859_5.c \
	iso8859_6.c \
	iso8859_7.c \
	iso8859_8.c \
	iso8859_9.c \
	koi8.c \
	koi8_r.c \
	sjis.c \
	unicode.c \
	utf16_be.c \
	utf16_le.c \
	utf32_be.c \
	utf32_le.c \
	utf8.c \
	trampoline_table.c \
	blockimp.c \
	blockimp_x86_$(BITS)_config.c \
	blockimp_x86_$(BITS)_stret_config.c

S_SRCS = \
	blockimp_x86_$(BITS).s \
	blockimp_x86_$(BITS)_stret.s

DERIVED_C_SRCS = \
	scope_selector.c

DEBUG_C_SRCS = \
	debug.c \

RELEASE_C_SRCS = \
	receipt.c

ALL_C_SRCS = $($(CONFIGURATION)_C_SRCS) $(C_SRCS) $(DERIVED_C_SRCS)

CXX_SRCS = \
	CharDistribution.cpp \
	JpCntx.cpp \
	LangBulgarianModel.cpp \
	LangCyrillicModel.cpp \
	LangGreekModel.cpp \
	LangHebrewModel.cpp \
	LangHungarianModel.cpp \
	LangThaiModel.cpp \
	nsBig5Prober.cpp \
	nsCharSetProber.cpp \
	nsEUCJPProber.cpp \
	nsEUCKRProber.cpp \
	nsEUCTWProber.cpp \
	nsEscCharsetProber.cpp \
	nsEscSM.cpp \
	nsGB2312Prober.cpp \
	nsHebrewProber.cpp \
	nsLatin1Prober.cpp \
	nsMBCSGroupProber.cpp \
	nsMBCSSM.cpp \
	nsSBCSGroupProber.cpp \
	nsSBCharSetProber.cpp \
	nsSJISProber.cpp \
	nsUTF8Prober.cpp \
	nsUniversalDetector.cpp

XIBS = \
	AdvancedPrefs.xib \
	BundlePrefs.xib \
	CommandOutputWindow.xib \
	CompletionWindow.xib \
	EditPrefs.xib \
	GeneralPrefs.xib \
	MainMenu.xib \
	MarkInspector.xib \
	PreferenceWindow.xib \
	ThemePrefs.xib \
	ViDocument.xib \
	ViDocumentWindow.xib \
	WaitProgress.xib

NU = \
	app/ex.nu \
	app/keys.nu \
	app/vico.nu \
	nu/beautify.nu \
	nu/bridgesupport.nu \
	nu/cblocks.nu \
	nu/cocoa.nu \
	nu/console.nu \
	nu/coredata.nu \
	nu/doc.nu \
	nu/fscript.nu \
	nu/generate.nu \
	nu/help.nu \
	nu/match.nu \
	nu/math.nu \
	nu/menu.nu \
	nu/nibtools.nu \
	nu/nu.nu \
	nu/template.nu \
	nu/test.nu


IMAGES = \
	Images/AliasBadgeIcon.icns \
	Images/TabClose_Front.tif \
	Images/TabClose_Front_Pressed.tif \
	Images/TabClose_Front_Rollover.tif \
	Images/TabCloseModified_Front.png \
	Images/TabCloseModified_Front_Pressed.png \
	Images/TabCloseModified_Front_Rollover.png \
	Images/TabNewMetal.png \
	Images/TabNewMetalPressed.png \
	Images/TabNewMetalRollover.png \
	Images/actionbarbg.png \
	Images/actionmenu.png \
	Images/add.png \
	Images/bookmark.png \
	Images/class.png \
	Images/define.png \
	Images/function.png \
	Images/header.png \
	Images/module.png \
	Images/overflowImage.tiff \
	Images/overflowImagePressed.tif \
	Images/pi.png \
	Images/resizehandle.png \
	Images/tag.png \
	vico.icns

VICO_BUNDLES = \
	ack

TM_BUNDLES = \
	c \
	css \
	diff \
	html \
	java \
	javascript \
	json \
	objective-c \
	perl \
	php \
	python \
	ruby-on-rails \
	ruby \
	shellscript \
	source \
	sql \
	text \
	xml \
	yaml

BUNDLES = \
	$(addsuffix, .vico-bundle,$(VICO_BUNDLES)) \
	$(addsuffix, .tmbundle,$(VICO_BUNDLES))

RESOURCES = \
	Support \
	Themes \
	Bundles \
	$(IMAGES) \
	app/symbol-icons.plist \
	$(NU) \
	par/par.doc \
	Credits.txt

ifneq ($(CONFIGURATION),DEBUG)

BUNDLE_USERS = vicoapp textmate kswedberg
BUNDLE_REPOS = $(addprefix $(RESDIR)/,$(addsuffix -bundles.json,$(BUNDLE_USERS)))
.PHONY: $(BUNDLE_REPOS)
endif

TOOL_OBJC_SRCS = \
	vico.m \
	$(JSON_OBJC_SRCS)

LEMON_C_SRCS = \
	lemon.c

PAR_C_SRCS = \
	buffer.c \
	charset.c \
	errmsg.c \
	par.c \
	reformat.c

XORKEY_C_SRCS = \
	xorkey.c

HELP_SRCS = \
	basics.md \
	change.md \
	change_indent.md \
	delete.md \
	dot.md \
	ex.md \
	ex_cmds.md \
	ex_ranges.md \
	explorer.md \
	indent_settings.md \
	insert.md \
	jumplist.md \
	line_search.md \
	move_chars.md \
	move_lines.md \
	move_symbols.md \
	move_words.md \
	movement.md \
	open_line.md \
	operators.md \
	remote.md \
	scrolling.md \
	searching.md \
	splits.md \
	ssh_keygen.md \
	symbols.md \
	terminal.md \
	visual.md

CC = clang
CXX = clang++
IBTOOL = /Developer/usr/bin/ibtool

REPO_VERSION := $(shell git log --oneline | wc -l | sed 's/ //g')

ifeq ($(CONFIGURATION),DEBUG)
SHORT_VERSION = r$(REPO_VERSION)
CFLAGS = -O0
OBJCFLAGS =
ARCHS = $(ARCH)
else
CFLAGS = -Os -DNDEBUG
SHORT_VERSION := $(shell cat version.h)

# I'm not sure what this does, but xcode uses them
OBJCPPFLAGS	+= "-DIBOutlet=__attribute__((iboutlet))" \
		   "-DIBOutletCollection(ClassName)=__attribute__((iboutletcollection(ClassName)))" \
		   "-DIBAction=void)__attribute__((ibaction)"

ARCHS = i386 x86_64

ifeq ($(CONFIGURATION),SNAPSHOT)
CFLAGS += -DTRIAL_VERSION
endif

endif

CFLAGS += -D$(CONFIGURATION)_BUILD=1

CFLAGS += -fvisibility=hidden -gdwarf-2

# warning flags
CFLAGS	+= -Wreturn-type \
	   -Wparentheses \
	   -Wswitch \
	   -Wno-unused-parameter \
	   -Wunused-variable \
	   -Wunused-value \
           -Wno-sign-conversion
CFLAGS	+= -Wall -Werror

# oniguruma, par, and lemon has too many of these issues
OBJCFLAGS += -Wshorten-64-to-32

CFLAGS += -DPL_BLOCKIMP_PRIVATE

SDK = /Developer/SDKs/MacOSX10.7.sdk

ARCH_CFLAGS = -arch $(ARCH) -isysroot $(SDK) -mmacosx-version-min=10.6 -fasm-blocks
CFLAGS	+= $(ARCH_CFLAGS)
LDFLAGS	+= $(ARCH_CFLAGS)

OBJCPPFLAGS = -include-pch $(OBJDIR)/Vico-prefix.objc.pth
OBJCXXPPFLAGS = -include-pch $(OBJDIR)/Vico-prefix.objcxx.pth
CPPFLAGS = -Iapp -Ijson -Ioniguruma -Iuniversalchardet -I$(DERIVEDDIR) -F. -Iplblockimp/Source
LDFLAGS	+= -F.

TOOL_LDLIBS = -framework ApplicationServices -framework Foundation
APP_LDLIBS = -lcrypto -lresolv -lffi -framework Carbon -framework WebKit -framework Cocoa
PAR_LDLIBS =
XORKEY_LDLIBS =

# paths
BUILDDIR=./build/$(CONFIGURATION)
OBJDIR=$(BUILDDIR)/obj/$(ARCH)
OBJDIR_32=$(BUILDDIR)/obj/i386
OBJDIR_64=$(BUILDDIR)/obj/x86_64
DEPDIR=$(BUILDDIR)/dep/$(ARCH)
DERIVEDDIR=$(BUILDDIR)/derived/$(ARCH)
APPDIR=$(BUILDDIR)/Vico.app
BINDIR=$(APPDIR)/Contents/MacOS
RESDIR=$(APPDIR)/Contents/Resources
FWDIR=$(APPDIR)/Contents/Frameworks
INFOPLIST=$(APPDIR)/Contents/Info.plist
NIBDIR=$(RESDIR)/en.lproj
 
# object files
OBJC_OBJS = $(addprefix $(OBJDIR)/,$(OBJC_SRCS:.m=.o))
OBJCXX_OBJS = $(addprefix $(OBJDIR)/,$(OBJCXX_SRCS:.mm=.o))
C_OBJS = $(addprefix $(OBJDIR)/,$(ALL_C_SRCS:.c=.o))
S_OBJS = $(addprefix $(OBJDIR)/,$(S_SRCS:.s=.o))
CXX_OBJS = $(addprefix $(OBJDIR)/,$(CXX_SRCS:.cpp=.o))
OBJS = $(OBJC_OBJS) $(OBJCXX_OBJS) $(C_OBJS) $(CXX_OBJS) $(S_OBJS)
TOOL_OBJC_OBJS = $(addprefix $(OBJDIR)/,$(TOOL_OBJC_SRCS:.m=.o))
TOOL_OBJS = $(TOOL_OBJC_OBJS)
PAR_C_OBJS = $(addprefix $(OBJDIR)/,$(PAR_C_SRCS:.c=.o))
PAR_OBJS = $(PAR_C_OBJS)
LEMON_C_OBJS = $(addprefix $(OBJDIR)/,$(LEMON_C_SRCS:.c=.o))
LEMON_OBJS = $(LEMON_C_OBJS)
XORKEY_C_OBJS = $(addprefix $(OBJDIR)/,$(XORKEY_C_SRCS:.c=.o))
XORKEY_OBJS = $(XORKEY_C_OBJS)
NIBS = $(addprefix $(NIBDIR)/,$(XIBS:.xib=.nib))
HELP_HTMLS = $(addprefix $(HELP_EN)/,$(HELP_SRCS:.md=.html))

DEPS = -MMD -MT $@ -MF $(addsuffix .d,$(basename $@))

$(OBJDIR)/%.o: %.m
	$(CC) $(CFLAGS) $(OBJCFLAGS) $(OBJCPPFLAGS) $(CPPFLAGS) $(DEPS) $< -c -o $@
$(OBJDIR)/%.o: %.mm
	$(CXX) $(CFLAGS) $(OBJCFLAGS) $(OBJCXXPPFLAGS) $(CPPFLAGS) $(DEPS) $< -c -o $@
$(OBJDIR)/%.o: %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) $(DEPS) $< -c -o $@
$(OBJDIR)/%.o: %.s
	$(CC) -x assembler-with-cpp $(CFLAGS) $(CPPFLAGS) $(DEPS) $< -c -o $@
$(OBJDIR)/%.o: %.cpp
	$(CXX) $(CFLAGS) $(CPPFLAGS) $(DEPS) $< -c -o $@
$(NIBDIR)/%.nib: %.xib
	mkdir -p $(NIBDIR)
	$(IBTOOL) --errors --warnings --notices --output-format human-readable-text --compile $@ $< --sdk $(SDK)
$(HELP_EN)/%.html: %.md
	mkdir -p $(@D)
	help/md2html $< > $@
%.html: %.md
	mkdir -p $(@D)
	help/md2html $< > $@


.PHONY: app
app: $(NIBS) $(RESOURCES) $(BUNDLE_REPOS) $(INFOPLIST) help $(APPDIR)/Contents/PkgInfo
	for arch in $(ARCHS); do \
		$(MAKE) binaries ARCH=$$arch; \
	done
	mkdir -p $(BINDIR)
	if test "$(ARCH)" = "$(ARCHS)"; then \
		cp $(OBJDIR)/Vico $(BINDIR); \
		cp $(OBJDIR)/vicotool $(BINDIR); \
		cp $(OBJDIR)/par $(BINDIR); \
	else \
		lipo -create $(OBJDIR_32)/Vico $(OBJDIR_64)/Vico -output $(BINDIR)/Vico; \
		lipo -create $(OBJDIR_32)/vicotool $(OBJDIR_64)/vicotool -output $(BINDIR)/vicotool; \
		lipo -create $(OBJDIR_32)/par $(OBJDIR_64)/par -output $(BINDIR)/par; \
		dsymutil $(BINDIR)/Vico -o $(BUILDDIR)/Vico.app.dSYM; \
	fi
	rsync -a --delete --exclude ".git" --exclude ".DS_Store" $(RESOURCES) $(RESDIR)
	cp -f app/en.lproj/Credits.rtf $(RESDIR)/en.lproj/Credits.rtf
	cp -f app/en.lproj/InfoPlist.strings $(RESDIR)/en.lproj/InfoPlist.strings
	# find $(RESDIR)/Bundles \( -iname "*.plist" -or -iname "*.tmCommand" -or -iname "*.tmSnippet" -or -iname "*.tmPreferences" \) -exec /usr/bin/plutil -convert binary1 "{}" \;
	/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $(REPO_VERSION)" $(INFOPLIST)
	/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString $(SHORT_VERSION)" $(INFOPLIST)

binaries: $(OBJDIR)/Vico $(OBJDIR)/vicotool $(OBJDIR)/par

$(OBJC_OBJS): $(OBJDIR)/Vico-prefix.objc.pth
$(OBJCXX_OBJS): $(OBJDIR)/Vico-prefix.objcxx.pth

$(OBJDIR)/Vico-prefix.objc.pth: app/Vico-prefix.pch
	mkdir -p $(OBJDIR)
	$(CC) -x objective-c-header $(CFLAGS) $(OBJCFLAGS) $< -o $@

$(OBJDIR)/Vico-prefix.objcxx.pth: app/Vico-prefix.pch
	mkdir -p $(OBJDIR)
	$(CC) -x objective-c++-header $(CFLAGS) $(OBJCFLAGS) $< -o $@

$(OBJDIR)/lemon: $(LEMON_OBJS)
	$(CC) $(LDFLAGS) $^ -o $@

APP_CERT_NAME = "3rd Party Mac Developer Application: Martin Hedenfalk" 
INST_CERT_NAME = "3rd Party Mac Developer Installer: Martin Hedenfalk" 

pkg: app
	strip -s app/saved_symbols $(BINDIR)/Vico
	strip $(BINDIR)/vicotool
	strip $(BINDIR)/par
	chown -RH "martinh:staff" $(APPDIR)
	chmod -RH u+w,go-w,a+rX $(APPDIR)
	env CODESIGN_ALLOCATE=/Developer/usr/bin/codesign_allocate \
	    codesign -v --force --sign $(APP_CERT_NAME) $(BINDIR)/vicotool
	env CODESIGN_ALLOCATE=/Developer/usr/bin/codesign_allocate \
	    codesign -v --force --sign $(APP_CERT_NAME) $(BINDIR)/par
	env CODESIGN_ALLOCATE=/Developer/usr/bin/codesign_allocate \
	    codesign -v --force --sign $(APP_CERT_NAME) $(RESDIR)/Support/bin/CommitWindow.app
	env CODESIGN_ALLOCATE=/Developer/usr/bin/codesign_allocate \
	    codesign -v --force --sign $(APP_CERT_NAME) $(RESDIR)/Support/lib/osx/plist.bundle
	env CODESIGN_ALLOCATE=/Developer/usr/bin/codesign_allocate \
	    codesign -v --force --sign $(APP_CERT_NAME) $(RESDIR)/Bundles/vicoapp-objective-c.tmbundle/Support/bin/inspectClass
	env CODESIGN_ALLOCATE=/Developer/usr/bin/codesign_allocate \
	    codesign -v --force --sign $(APP_CERT_NAME) $(APPDIR)
	productbuild --component $(APPDIR) /Applications \
		     --sign $(INST_CERT_NAME) \
		     --product $(INFOPLIST) \
		     $(BUILDDIR)/Vico.pkg

install: pkg
	sudo installer -store -pkg $(BUILDDIR)/Vico.pkg -target /

app/scope_selector.c app/scope_selector.h: scope_selector.lemon $(OBJDIR)/lemon
	mkdir -p $(@D)
	LEMPAR=lemon/lempar.c $(OBJDIR)/lemon -s $<

$(OBJDIR)/NSString-scopeSelector.o: app/scope_selector.h

$(OBJDIR)/Vico: $(OBJS)
	mkdir -p $(OBJDIR)
	$(CXX) $(LDFLAGS) $(LDLIBS) $(APP_LDLIBS) $^ -o $@

$(OBJDIR)/vicotool: $(TOOL_OBJS)
	mkdir -p $(OBJDIR)
	$(CC) $(LDFLAGS) $(TOOL_LDLIBS) $^ -o $@

$(OBJDIR)/par: $(PAR_OBJS)
	mkdir -p $(OBJDIR)
	$(CC) $(LDFLAGS) $(PAR_LDLIBS) $^ -o $@

$(OBJDIR)/xorkey: $(XORKEY_OBJS)
	mkdir -p $(OBJDIR)
	$(CC) $(LDFLAGS) $(XORKEY_LDLIBS) $^ -o $@

%-bundles.json:
	mkdir -p $(@D)
	@echo "downloading bundle repository for $(*F)"
	if curl -s "http://github.com/api/v2/json/user/show/$(*F)" | grep -q '"type":"Organization"'; then \
		repourl="http://github.com/api/v2/json/organizations/$(*F)/public_repositories"; \
	else \
		repourl="http://github.com/api/v2/json/repos/show/$(*F)"; \
	fi; \
	curl --fail -s $$repourl > $@

app/receipt.c: $(DERIVEDDIR)/AppleIncRootCertificate.h $(DERIVEDDIR)/bundle_fingerprint.h 

$(DERIVEDDIR)/bundle_fingerprint.h:
	mkdir -p $(DERIVEDDIR)
	@echo "Using version $(SHORT_VERSION) for receipt validation"
	/bin/echo -n "se.bzero.Vico$(SHORT_VERSION)" | openssl sha1 -binary | app/b2h > $(DERIVEDDIR)/bundle_fingerprint.h

$(DERIVEDDIR)/AppleIncRootCertificate.h: app/AppleIncRootCertificate.cer $(OBJDIR)/xorkey
	mkdir -p $(DERIVEDDIR)
	$(OBJDIR)/xorkey app/AppleIncRootCertificate.cer > $(DERIVEDDIR)/AppleIncRootCertificate.h

blockimp.c: $(DERIVEDDIR)/blockimp_x86_$(BITS).h
$(DERIVEDDIR)/blockimp_x86_$(BITS).h \
$(DERIVEDDIR)/blockimp_x86_$(BITS).s \
$(DERIVEDDIR)/blockimp_x86_$(BITS)_config.c: blockimp_x86_$(BITS).tramp blockimp_x86_$(BITS)_stret.tramp
	mkdir -p $(DERIVEDDIR)
	@echo "Generating trampolines for arch $(ARCH)"
	pushd plblockimp/Source/x86_$(BITS) && \
	for inp in $^; do \
		echo "Generating trampolines: $$inp"; \
		CURRENT_ARCH=$(ARCH) \
		INPUT_FILE_PATH=$$(basename $$inp) \
		INPUT_FILE_BASE=$${INPUT_FILE_PATH%.tramp} \
		"$(CURDIR)/plblockimp/Other Sources/gentramp.sh" $(CURDIR)/$(DERIVEDDIR); \
	done && popd

$(INFOPLIST): app/Vico-Info.plist
	cp -f $< $@

CF_PKGTYPE = $(shell /usr/libexec/PlistBuddy -c "Print :CFBundlePackageType" app/Vico-Info.plist)
CF_SIGNATURE = $(shell /usr/libexec/PlistBuddy -c "Print :CFBundleSignature" app/Vico-Info.plist)
$(APPDIR)/Contents/PkgInfo: app/Vico-Info.plist
	/bin/echo -n "$(CF_PKGTYPE)$(CF_SIGNATURE)" > $@
	eval `stat -s $@` && test $$st_size -eq 8


TMPDMG		= $(BUILDDIR)/vico-tmp.dmg
VOLNAME		= vico-$(SHORT_VERSION)
DMG		= $(BUILDDIR)/$(VOLNAME).dmg
DMGDIR		= "$(BUILDDIR)/Vico $(SHORT_VERSION)"
APPCAST_BASE	= "http://www.vicoapp.com/relnotes"
DOWNLOAD_BASE	= "http://www.vicoapp.com/download"
KSIZE		= $(shell du -ks $(APPDIR) | cut -f1)
SIZE		= $(shell $$(($(KSIZE) * 1024)) )

dmg: $(DMG)

$(DMG): app
	@echo "Creating disk image $(VOLNAME)"
	/bin/rm -rf $(TMPDMG) $(DMGDIR) $(DMG)
	mkdir -p $(DMGDIR)
	/bin/cp -a $(APPDIR) $(DMGDIR)
	ln -s /Applications $(DMGDIR)/Applications
	hdiutil makehybrid -o $(TMPDMG) $(DMGDIR) -hfs
	hdiutil convert -format UDBZ $(TMPDMG) -o $(DMG)
	/bin/rm -rf $(TMPDMG) $(DMGDIR)
	ls -lh $(DMG)
	@echo "scp $(DMG) vicoapp.com:/var/www/vicoapp.com/download"


# include automatic dependencies...
-include $(OBJS:.o=.d)

run: app
	$(BINDIR)/Vico $(HOME)/src/vico

leaks: app
	# MallocStackLoggingNoCompact=YES
	MallocStackLogging=YES \
	  $(BINDIR)/Vico $(HOME)/src/vico

zombie: app
	# MallocStackLoggingNoCompact=YES
	NSZombieEnabled=YES NSDebugEnabled=YES \
	  $(BINDIR)/Vico $(HOME)/src/vico

build: test
	rm -rf build/Snapshot/Vico.app
	xcodebuild -scheme archive -configuration Snapshot

test:
	xcodebuild -configuration Debug -target Tests

test_snippets:
	export OTHER_TEST_FLAGS="-SenTest TestViSnippet" && \
	xcodebuild -configuration Debug -target Tests

test_scopes:
	export OTHER_TEST_FLAGS="-SenTest TestScopeSelectors" && \
	xcodebuild -configuration Debug -target Tests

api:
	rm -rf doc/html
	appledoc --project-name "Vico API" \
		--project-company "Martin Hedenfalk" \
		--company-id se.bzero \
		--no-repeat-first-par \
		--output doc \
		--create-html \
		--no-create-docset \
		--merge-categories \
		app/ExCommand.h \
		app/ExMap.h \
		app/ExParser.h \
		app/NSEvent-keyAdditions.h \
		app/NSString-additions.h \
		app/NSView-additions.h \
		app/ViCommand.h \
		app/ViDocument.h \
		app/ViDocumentView.h \
		app/ViEventManager.h \
		app/ViKeyManager.h \
		app/ViLanguage.h \
		app/ViMap.h \
		app/ViMark.h \
		app/ViParser.h \
		app/ViPreferencePane.h \
		app/ViPreferencesController.h \
		app/ViRegisterManager.h \
		app/ViScope.h \
		app/ViTabController.h \
		app/ViTextStorage.h \
		app/ViTextView.h \
		app/ViViewController.h \
		app/ViWindowController.h

syncapi: api
	rsync -av --delete  doc/html/ www:/var/www/feedback.vicoapp.com/public/api

TAG		?= tip
RELEASE_DIR	 = build/$(CONFIGURATION)-$(TAG)

.PHONY: checkout
checkout:
	@echo release directory is $(RELEASE_DIR)
	@if test -d $(RELEASE_DIR); then echo "release directory already exists"; exit 1; fi
	@echo checking out sources for '$(TAG)'
	git clone $(TAG) . $(RELEASE_DIR)
	rsync -a $(CURDIR)/Bundles/ $(RELEASE_DIR)/Bundles

release: checkout
	$(MAKE) -C $(RELEASE_DIR) pkg

snapshot: checkout
	$(MAKE) -C $(RELEASE_DIR) dmg

TARDATE := $(shell date +%Y%m%d%H)
TARBALL  = vico-git-$(TARDATE).tar.gz
tarball:
	tar zcvf $(TARBALL) .git
	gpg -r martin -e $(TARBALL)
	rm $(TARBALL)

upload_tarball: tarball
	scp $(TARBALL).gpg mx.bzero.se:

HELP_FILES = \
	index.html \
	$(HELP_SRCS) \
	shared/help.css \
	shared/icon_hand.png \
	shared/icon_hand_32.png \
	shared/icon_hand_64.png \
	help-Info.plist \
	help-InfoPlist.strings

help: $(DERIVEDDIR)/help.stamp
HELP_RESDIR = $(RESDIR)/Vico.help/Contents/Resources
HELP_EN = $(HELP_RESDIR)/English.lproj
$(DERIVEDDIR)/help.stamp: $(HELP_FILES)
	mkdir -p $(HELP_EN)
	cp -f help/index.html $(HELP_EN)/VicoHelp.html
	rsync -a --delete --exclude ".DS_Store" help/shared $(HELP_RESDIR)
	cp -f help/help-Info.plist $(HELP_RESDIR)/../Info.plist
	cp -f help/help-InfoPlist.strings $(HELP_EN)/InfoPlist.strings
	for md in $(HELP_SRCS); do \
		./help/md2html help/$$md > $(HELP_EN)/$${md%.md}.html; \
	done
	hiutil -vg -s en -Caf $(HELP_EN)/Vico.helpindex $(HELP_EN)
	touch $(DERIVEDDIR)/help.stamp

HELP_SRC = help
WWW_HELP_DST = $(CURDIR)/help/www
WWW_HELP_EN  = $(WWW_HELP_DST)/en
wwwhelp:
	rm -rf $(CURDIR)/help/www
	mkdir -p $(WWW_HELP_EN)
	cp -rf $(HELP_SRC)/shared $(WWW_HELP_DST)
	cd $(WWW_HELP_EN) && $(HELP_SRC)/md2html.www $(HELP_SRC)/*.md

synchelp: help
	rsync -avr $(HELP_RESDIR)/ www.vicoapp.com:/var/www/vicoapp.com/help

clean:
	rm -rf $(OBJDIR) $(APPDIR)

distclean:
	rm -rf $(BUILDDIR)

.PHONY: build clean
