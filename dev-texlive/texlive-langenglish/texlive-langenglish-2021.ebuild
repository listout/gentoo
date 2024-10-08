# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TEXLIVE_MODULE_CONTENTS="hyphen-english MemoirChapStyles Type1fonts amiweb2c-guide amscls-doc amslatex-primer around-the-bend ascii-chart biblatex-cheatsheet components-of-TeX comprehensive dickimaw docsurvey dtxtut first-latex-doc forest-quickstart gentle guide-to-latex happy4th impatient intro-scientific l2tabu-english latex-brochure latex-course latex-doc-ptr latex-graphics-companion latex-refsheet latex-veryshortguide latex-web-companion latex2e-help-texinfo latex4wp latexcheat latexcourse-rug latexfileinfo-pkgs lshort-english macros2e math-into-latex-4 maths-symbols memdesign metafont-beginners metapost-examples patgen2-tutorial pictexsum plain-doc short-math-guide simplified-latex startlatex2e svg-inkscape tamethebeast tds tex-font-errors-cheatsheet tex-nutshell tex-overview tex-refs texbytopic texonly titlepages tlc2 tlmgrbasics undergradmath visualfaq webguide xetexref collection-langenglish
"
TEXLIVE_MODULE_DOC_CONTENTS="MemoirChapStyles.doc Type1fonts.doc amiweb2c-guide.doc amscls-doc.doc amslatex-primer.doc around-the-bend.doc ascii-chart.doc biblatex-cheatsheet.doc components-of-TeX.doc comprehensive.doc dickimaw.doc docsurvey.doc dtxtut.doc first-latex-doc.doc forest-quickstart.doc gentle.doc guide-to-latex.doc happy4th.doc impatient.doc intro-scientific.doc l2tabu-english.doc latex-brochure.doc latex-course.doc latex-doc-ptr.doc latex-graphics-companion.doc latex-refsheet.doc latex-veryshortguide.doc latex-web-companion.doc latex2e-help-texinfo.doc latex4wp.doc latexcheat.doc latexcourse-rug.doc latexfileinfo-pkgs.doc lshort-english.doc macros2e.doc math-into-latex-4.doc maths-symbols.doc memdesign.doc metafont-beginners.doc metapost-examples.doc patgen2-tutorial.doc pictexsum.doc plain-doc.doc short-math-guide.doc simplified-latex.doc startlatex2e.doc svg-inkscape.doc tamethebeast.doc tds.doc tex-font-errors-cheatsheet.doc tex-nutshell.doc tex-overview.doc tex-refs.doc texbytopic.doc texonly.doc titlepages.doc tlc2.doc tlmgrbasics.doc undergradmath.doc visualfaq.doc webguide.doc xetexref.doc "
TEXLIVE_MODULE_SRC_CONTENTS="latexfileinfo-pkgs.source "
inherit  texlive-module
DESCRIPTION="TeXLive US and UK English"

LICENSE=" CC-BY-SA-4.0 FDL-1.1 GPL-1 GPL-2 GPL-2+ "
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 ~hppa ~loong ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x64-solaris"
IUSE=""
DEPEND=">=dev-texlive/texlive-basic-2021"

RDEPEND="${DEPEND} "
