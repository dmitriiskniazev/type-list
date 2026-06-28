"""Sphinx — type-list (MyST)."""

from __future__ import annotations

import re

project = "type-list"
author = "dmitriiskniazev"
copyright = "2026, dmitriiskniazev"
release = "0.1.0"

extensions = ["myst_parser"]

exclude_patterns = ["_build", ".venv", "**/__pycache__"]

root_doc = "index"
source_suffix = {".md": "markdown"}

myst_enable_extensions = [
    "colon_fence",
    "deflist",
    "html_admonition",
    "replacements",
    "smartquotes",
    "strikethrough",
    "tasklist",
]
myst_heading_anchors = 3
myst_url_schemes = ("http", "https", "mailto")

html_theme = "furo"
html_title = "type-list"
html_static_path = []
html_baseurl = "https://dmitriiskniazev.github.io/type-list/"

html_theme_options = {
    "navigation_with_keys": True,
    "top_of_page_button": "edit",
    "source_repository": "https://github.com/dmitriiskniazev/type-list",
    "source_branch": "main",
    "source_directory": "docs/",
}

GITHUB = "https://github.com/dmitriiskniazev/type-list/blob/main"
_SRC = re.compile(r"\]\((\.\./)+src/([^)]*)\)")
_EXAMPLES = re.compile(r"\]\((\.\./)+examples/([^)]*)\)")
_TESTS = re.compile(r"\]\((\.\./)+tests/([^)]*)\)")
_CMAKE = re.compile(r"\]\((\.\./)+CMakeLists\.txt\)")


def _rewrite_repo_links(_app, _docname, source: list[str]) -> None:
    text = source[0]
    text = _SRC.sub(rf"]({GITHUB}/src/\2)", text)
    text = _EXAMPLES.sub(rf"]({GITHUB}/examples/\2)", text)
    text = _TESTS.sub(rf"]({GITHUB}/tests/\2)", text)
    text = _CMAKE.sub(rf"]({GITHUB}/CMakeLists.txt)", text)
    source[0] = text


def setup(app):
    app.connect("source-read", _rewrite_repo_links)
