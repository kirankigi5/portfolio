#!/usr/bin/env bash
set -euo pipefail

tmp_dir="$(mktemp -d)"
tmp_override="${tmp_dir}/comments-test-override.yml"
tmp_site="${tmp_dir}/site"

cleanup() {
  rm -rf "${tmp_dir}"
}
trap cleanup EXIT

cat >"${tmp_override}" <<'YAML'
giscus:
  repo: alshedivat/al-folio
  repo_id: R_kgDOExample
  category: Comments
  category_id: DIC_kwDOExample
YAML

# These checks assert against the al-folio demo posts that exercise each
# comments provider. A personalized site may have removed them, in which case
# there is nothing to verify and the check is skipped rather than failed.
shopt -s nullglob
giscus_sources=(_posts/*giscus-comments*.md)
disqus_sources=(_posts/*disqus-comments*.md)
shopt -u nullglob

if [ ${#giscus_sources[@]} -eq 0 ] && [ ${#disqus_sources[@]} -eq 0 ]; then
  echo "comments integration checks skipped: no giscus or disqus fixture posts found in _posts/"
  exit 0
fi

bundle exec jekyll build --config "_config.yml,${tmp_override}" -d "${tmp_site}" >/dev/null

if [ ${#giscus_sources[@]} -gt 0 ]; then
  giscus_page="${tmp_site}/blog/2022/giscus-comments/index.html"
  if [ ! -f "${giscus_page}" ]; then
    echo "giscus fixture post exists in _posts/ but no page was generated at ${giscus_page}" >&2
    exit 1
  fi
  grep -q 'https://giscus.app/client.js' "${giscus_page}"
  if grep -q 'giscus comments misconfigured' "${giscus_page}"; then
    echo "unexpected giscus misconfiguration warning in ${giscus_page}" >&2
    exit 1
  fi
else
  echo "note: skipping giscus assertions, no giscus fixture post in _posts/"
fi

if [ ${#disqus_sources[@]} -gt 0 ]; then
  disqus_page="${tmp_site}/blog/2015/disqus-comments/index.html"
  if [ ! -f "${disqus_page}" ]; then
    echo "disqus fixture post exists in _posts/ but no page was generated at ${disqus_page}" >&2
    exit 1
  fi
  grep -q 'id="disqus_thread"' "${disqus_page}"
  grep -q '.disqus.com/embed.js' "${disqus_page}"
else
  echo "note: skipping disqus assertions, no disqus fixture post in _posts/"
fi

echo "comments integration checks passed"
