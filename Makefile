# More Modest (c) 2014 Andrew Gwozdziewycz, <web@apgwoz.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# These configure the atom feed
BLOG_TITLE = hifi by apg
BLOG_URL = http://hifibyapg.net
BLOG_AUTHOR = Andrew Gwozdziewycz
BLOG_ATOM_ID = $(shell echo $(BLOG_URL) | md5sum | cut -f 1 -d ' ')

RECENT_ENTRIES = 5

# For the make sync target
RSYNC_TARGET = apgwoz@apgwoz.com:hifibyapg.com

# location of the theme executable
THEME = theme
THEMEOPTS = -c footnotes

SRCDIR = src
BUILDDIR = build
THEMEDIR = theme
PAGEDIR = $(SRCDIR)/page
INTERVIEWDIR = $(SRCDIR)/interviews
ENTRYDIR = $(SRCDIR)/entry
STATICDIR = $(SRCDIR)/static

entry_deps = $(THEMEDIR)/entry.html $(THEMEDIR)/footer.html $(THEMEDIR)/header.html $(THEMEDIR)/head.html
page_deps = $(THEMEDIR)/page.html $(THEMEDIR)/footer.html $(THEMEDIR)/header.html $(THEMEDIR)/head.html
interview_deps = $(THEMEDIR)/page.html $(THEMEDIR)/footer.html $(THEMEDIR)/header.html $(THEMEDIR)/head.html
index_deps = $(THEMEDIR)/index.html $(THEMEDIR)/footer.html $(THEMEDIR)/header.html $(THEMEDIR)/head.html

entry_srcs = $(wildcard $(ENTRYDIR)/*.md)
page_srcs = $(wildcard $(PAGEDIR)/*.md)
interview_srcs = $(wildcard $(INTERVIEWDIR)/*.md)

entry_targets = $(addprefix $(BUILDDIR)/, $(addsuffix .html, $(basename $(notdir $(entry_srcs)))))
page_targets = $(addprefix $(BUILDDIR)/page/, $(addsuffix .html, $(basename $(notdir $(page_srcs)))))
interview_targets = $(addprefix $(BUILDDIR)/interviews/, $(addsuffix .html, $(basename $(notdir $(interview_srcs)))))

$(shell mkdir -p $(BUILDDIR))

all: static entries pages interviews $(BUILDDIR)/index.html $(BUILDDIR)/interviews.html $(BUILDDIR)/feed.xml $(BUILDDIR)/archive.html

.ONESHELL:
$(BUILDDIR)/index.html: $(entry_srcs) $(index_deps)
	@echo "Building index"
	@for n in $(entry_srcs); do
		DD=$$(head -n 3 $$n | tail -n 1 | sed -e 's/-//g')
		echo $$n $$DD $$(head -n 3 $$n | tail -n 1) $$(head -n 1 $$n);
	done | sort -r -n -k 2 -t '%' | head -n $(RECENT_ENTRIES) \
	| awk -F ' % ' 'function filename(c) {
	   match(c, /((.*\/)+)(.*)$$/, arr)
	   sub(/\.md$$/, ".html", arr[3])
	   return arr[3]
	}{print "* [" $$4 "](/" filename($$1) ")\n"}' \
	| $(THEME) $(THEMEOPTS) -t $(THEMEDIR)/index.html -o $@


$(BUILDDIR)/archive.html: $(entry_srcs) $(index_deps)
	@echo "Building archive"
	@for n in $(entry_srcs); do
		DD=$$(head -n 3 $$n | tail -n 1 | sed -e 's/-//g')
		echo $$n $$DD $$(head -n 3 $$n | tail -n 1) $$(head -n 1 $$n);
	done | sort -r -n -k 2 -t '%' \
	| awk -F ' % ' 'function filename(c) {
	   match(c, /((.*\/)+)(.*)$$/, arr)
	   sub(/\.md$$/, ".html", arr[3])
	   return arr[3]
	}{print "* [" $$4 "](/" filename($$1) ")\n"}' \
	| $(THEME) $(THEMEOPTS) -t $(THEMEDIR)/archive.html -o $@

$(BUILDDIR)/interviews.html: $(interview_srcs) $(index_deps)
	@echo "Building interviews index"
	@for n in $(interview_srcs); do
		DD=$$(head -n 3 $$n | tail -n 1 | sed -e 's/-//g')
		echo $$n $$DD $$(head -n 3 $$n | tail -n 1) $$(head -n 1 $$n);
	done | sort -r -n -k 2 -t '%' \
	| awk -F ' % ' 'function filename(c) {
	   match(c, /((.*\/)+)(.*)$$/, arr)
	   sub(/\.md$$/, ".html", arr[3])
	   return arr[3]
	}{print "* [" $$4 "](/interviews/" filename($$1) ")\n"}' \
	| $(THEME) $(THEMEOPTS) -t $(THEMEDIR)/interviews.html -o $@


# '%Y-%m-%dT%H:%M:%SZ'
# <entry><title>%(title)s</title><link href="%(href)s"/><id>%(id)s</id><updated>%(updated)s</updated><content type="html"><![CDATA[%(summary)s]]></content></entry>

.ONESHELL:
$(BUILDDIR)/feed.xml: $(entry_srcs)
	@echo "Building feed.xml"
	@echo "<?xml version=\"1.0\" encoding=\"utf-8\"?><feed xmlns=\"http://www.w3.org/2005/Atom\"><title>$(BLOG_TITLE)</title><link href=\"$(BLOG_URL)/atom.xml\" rel=\"self\" /><link href=\"$(BLOG_URL)\"/><updated>$(shell date +%Y-%m-%dT%H:%M:%SZ)</updated><author><name>$(BLOG_AUTHOR)</name></author><id>$(BLOG_ATOM_ID)</id>" > $@

	@for n in $(entry_srcs); do
		DD=$$(head -n 3 $$n | tail -n 1 | sed -e 's/-//g')
		echo $$n $$DD $$(head -n 3 $$n | tail -n 1) $$(head -n 1 $$n);
	done | sort -r -n -k 2 -t '%' \
	| head -n 10 \
	| awk -F ' % ' 'function htmlescape(c) {
	   gsub(/&/, "&amp;", c)
	   gsub(/</, "&lt;", c)
	   gsub(/>/, "&gt;", c)
	   return c
	}
	function filename(c) {
	   match(c, /((.*\/)+)(.*)$$/, arr)
	   sub(/\.md$$/, ".html", arr[3])
	   return arr[3]
	}
	{print "<entry><title>" htmlescape($$4) "</title><link href=\42$(BLOG_URL)/" filename($$1) "\42/><id>" filename($$1) "</id><updated>" $$3 "T00:00:00Z</updated><content type=\42html\42><![CDATA[]]></content></entry>"}' >> $@

	@echo "</feed>" >> $@
	@cp $@ $(BUILDDIR)/atom.xml

entries: $(entry_targets)
	@cp -a $(ENTRYDIR)/*.md $(BUILDDIR)/

interviews: $(interview_targets)
	@cp -a $(INTERVIEWDIR)/*.md $(BUILDDIR)/interviews

pages: $(page_targets)
static:
	@mkdir -p $(BUILDDIR)/static
	@cp -a $(STATICDIR)/* $(BUILDDIR)/static

$(BUILDDIR)/%.html: $(ENTRYDIR)/%.md $(entry_deps)
	@echo "Building $*.html"
	@$(THEME) $(THEMEOPTS) -t $(THEMEDIR)/entry.html -o $@ $<

$(BUILDDIR)/page/%.html: $(PAGEDIR)/%.md $(page_deps)
	@echo "Building $*.html"
	@mkdir -p $(BUILDDIR)/page
	@$(THEME) $(THEMEOPTS) -t $(THEMEDIR)/page.html -o $@ $<

$(BUILDDIR)/interviews/%.html: $(INTERVIEWDIR)/%.md $(interview_deps)
	@echo "Building $*.html"
	@mkdir -p $(BUILDDIR)/interviews
	@$(THEME) $(THEMEOPTS) -t $(THEMEDIR)/page.html -o $@ $<


.ONESHELL:
sync:
	@pushd .
	cd build/
	@rsync -vrRz --rsh=/usr/bin/ssh . $(RSYNC_TARGET)
	@popd

run: all
	@pushd .
	cd build/
	python2.7 -m SimpleHTTPServer
	@popd

clean:
	@rm -rf $(BUILDDIR)

commit:
	git commit -a
	git push origin master

.PHONY: dirs clean sync
