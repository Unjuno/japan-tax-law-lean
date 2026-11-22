# Independent adversarial review — 関税定率法 第十九条(4)（準用）READING

Unit: NORM|662ecdbb3874ed176834a6def2924dbe0518892f9339905e6ab3b3e442775462
Verbatim (injected from the authoritative queue task, not hand-typed):
  「この場合においては、第十三条第七項但書の規定を準用する。」

## Reviewer verdict: ONE FINDING (documentation transcription defect) — FIXED & CONFIRMED

The independent adversarial reviewer reproduced all 17 mandated structural, kernel,
source-correspondence and dependency checks, and reported ONE concrete finding:

### Finding (reproduced)
- Location: `docs/UNIT_CUSTOMS_TARIFF_ART19_ART13_PARA7_PROVISO_READING.md`, line 9.
- Defect: the Article 第十九条 caption was hand-typed as `（…免税又は還税等）`
  (`還税`, U+9084 U+7A0E).
- Authoritative source: the pinned raw JSON's `ArticleCaption` is
  `（…免税又は戻し税等）` (`戻し税`, U+623B U+3057 U+7A0E); `還税` does not occur
  anywhere in the raw JSON. The implementation file had the correct caption because
  it was injected programmatically; the defect was isolated to the prose doc.
- Severity: documentation-only — the modeled norm and all proofs were unaffected.

### Fix (programmatic, not hand-typed)
The UNIT doc caption was replaced using the `ArticleCaption` extracted directly from
`data/raw/143AC0000000054_20260601_508AC0000000005.law.json`. No statutory string was
hand-typed into the fix.

### Confirmation
- The doc now carries the authoritative caption, byte-for-byte identical to the
  implementation's injected caption; `還税` is absent from impl, spec, tests and both docs.
- The independent cross-check was extended with three regression guards (raw caption
  in impl; raw caption in UNIT doc; `還税` absent everywhere) and now passes **32/32, 0 fails**.
- All 17 mandated reviewer checks otherwise reproduced with PASS results:
  raw sha256 `924a01d3…986ae9c` ✓; needle whole-law count 1 ✓; `find_article_text("第十九条")`
  len 2200 with needle ✓; source path resolved byte-for-byte in raw JSON ✓; law identity
  関税定率法 / 明治四十三年法律第五十四号 / Act / real revision ✓; kind READING,
  `unhandled_conditions=[]` ✓; source sub-terms `第十三条第七項但書` and `この場合`
  extracted from the needle with the source's own `但書` (U+4F46 U+66F8) preserved —
  `ただし書` never substituted ✓; needle verbatim in impl/spec/tests/docs ✓; ASCII-only
  `\u`-escaped audit literal, unique name, 422/422 checks ✓; imports wired once each ✓;
  no forbidden placeholders or `simp` in proof bodies ✓; all six theorems
  *"does not depend on any axioms"* ✓; spec representationally distinct via cases/rfl
  only ✓; full build succeeded (1300 jobs) ✓; unresolved この場合 dependency recorded
  as insufficient with no cross-law constant ✓; `LEGAL_REVIEW_PENDING` and no legal
  correctness claim ✓.

### Remaining findings
None. The single finding was reproduced, fixed from the authoritative source, and
confirmed; no audit was weakened. Human legal review remains `LEGAL_REVIEW_PENDING`.
