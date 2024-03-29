# -*- coding: utf-8 -*-


extensions = []
templates_path = ['_templates']
source_suffix = ['.rst']		
master_doc = 'index'

project = u'HiCUP+'
copyright = u'2010, 2019'
version = 'latest'
release = 'latest'

# Add any Sphinx extension module names here, as strings.
extensions = [
    'sphinx.ext.intersphinx',
]

exclude_patterns = ['_build','sandbox']

pygments_style = 'sphinx'


# -- Options for HTML output -------------------------------------------------

#html_theme = 'sphinx_rtd_theme'
file_insertion_enabled = False


# -- Options for HTMLHelp output ---------------------------------------------

htmlhelp_basename = 'hicup-plus'


# -- Options for LaTeX output ------------------------------------------------
# LaTeX is intermediate to the PDF output

latex_documents = [
    # (startdocname, targetname, title, author, documentclass, toctree_only)
    (   'index', 'index.tex',
        u'HiCUP+',
        u'S. Thomas Kelly, Satoshi Yuhara',
        'manual',
        False),
]

# -- Options for intersphinx extension ---------------------------------------

intersphinx_mapping = {
    'python' : ('https://docs.python.org/2', None),
}
