# §1 infrastructure: full-text reader indexing (ID-preserving)

Date: 2026-11-27.

`scripts/ci/link_existing_proofs.py::make_full_text_reader` previously walked
the entire provision tree of a law once per distinct `(source_file, path,
norm_start, norm_end)`. Large SOURCE cycles create thousands of distinct spans,
so the walk dominated runtime (a 10,000-unit cycle exceeded 30 min at ~100% CPU
and 2.3 GB RSS).

Change: build one `path -> node` index per source file and one full-text cache
per provision. First-match semantics are preserved via `setdefault` (the old
loop broke on the first matching path). No identifiers, spans, text or evidence
semantics change — only lookup cost.

Verification: `verify_reader_opt.py` reconstructed the old reader inline and
compared both readers on 384 queue units spanning many provisions:
`sample 384 mismatch 0 empty 0`. No completion claim.
