Mortimer
========

Mortimer is a simple program to generate markup documentation for a docs directory in a project.
The idea is you keep a directory of docs in git, and you add a build target to occasionally HTML-ize them.
Keeping docs with source is a good way to version docs, and nobody can remember where to find things on
Wiki's anyway.  You can generate docs when you want to see pretty HTML, though it's just as reasonable
to read the ASCII markdown.

Mortimer is partially inspired by puppet-docs, which itself was inspired by Rails Guides.   
Mortimer is a LOT simpler than that, intended for extra busy developers who don't need
to publish something that's super-shiny.

To read about Markdown:

http://daringfireball.net/projects/markdown/

Why is it called Mortimer?  This is a markup-inator project, which sounds like "marker".
Mortimer was a famous Marker used by Bill Cosby.  Bill Cosby is a pop culture icon.

Requirements
============

    # need ruby
    gem install maruku

    # create a lot of markdown files (.md) in a directory, call it 'foo'
    # create a header.snippet file in the 'foo' directory
    # create a footer.snippet file in the 'foo' directory

Demo
====

    # see examples directory files to see what little is in there

    ruby ./lib/mortimer.rb --indir examples --outdir output

    # now look in the output directory

    firefox output/foo.html
    firefox output/bar.html

Notes
=====

This project is intended to be ultra-lightweight.

If a feature is not there, you may add it, but if you make this complicated, expect your
patch to be rejected.

See TODO for things I'd like to include.

License
=======

Mortimer is MIT licensed software.  You can do what you want with it.

Contributors
============

Michael DeHaan, <michael.dehaan AT gmail>

