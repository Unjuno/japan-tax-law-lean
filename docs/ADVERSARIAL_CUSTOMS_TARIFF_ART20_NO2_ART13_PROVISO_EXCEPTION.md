# Independent adversarial review — 関税定率法 第二十条の二(3)（準用）EXCEPTION

Unit: NORM|04057a73ecf3e5e7f56460b7b280eee517956be5c9b69d8d845cfed58189c76f
Verbatim (injected from the authoritative queue task, not hand-typed):
  「この場合においては、第十三条第七項ただし書の規定を準用する。」

## Reviewer verdict: 2 FINDINGS (both documentation-only) — FIXED & CONFIRMED

All 16 mandated structural, kernel, source-correspondence and dependency checks
reproduced PASS. The reviewer also resolved the distinctness question and found two
documentation defects:

### Distinctness investigation — NOT a duplicate unit
The art.17(5) sibling (`NORM|13bac8bc…`) has a DIFFERENT needle:
「第十三条第七項ただし書の規定は、前項の規定により関税を徴収する場合について準用する。」
while this unit's needle is
「この場合においては、第十三条第七項ただし書の規定を準用する。」
Both reference the same proviso but are different statutory sentences in different
articles (第十七条(5) vs 第二十条の二(3)), with different queue ids, source paths and
namespaces. Exactly 1 queue task carries this unit's needle and it occurs 1× in the
raw law text. No duplicate-unit defect.

### F-1 (reproduced, fixed) — false comment in the audit
- Location: `scripts/ci/transcription_audit.py`, the audit block's comment.
- Defect: comment claimed `same needle text as art.17(5) unit`, which is false per the
  queue (different sentences, above).
- Fix: replaced with an accurate comment stating the two units are distinct and that
  the sibling's needle is a different sentence referencing the same proviso.
- Confirmed: the false phrase is absent; the check itself was always correct.

### F-2 (reproduced, fixed) — caption transposition in the UNIT doc
- Location: `docs/UNIT_CUSTOMS_TARIFF_ART20_NO2_ART13_PROVISO_EXCEPTION.md`, line 9.
- Defect: caption hand-typed as `減軽税率` (U+6E1B U+8EFD) whereas the authoritative
  raw JSON `ArticleCaption` and the implementation say `軽減税率` (U+8EFD U+6E1B).
- Fix: the caption was replaced using the `ArticleCaption` extracted directly from the
  pinned raw JSON — no hand-typing.
- Confirmed: `減軽税率` absent from the doc; authoritative caption present and identical
  to the implementation's injected caption.

### Confirmation
Three regression guards were added to the independent cross-check (F-1 comment absent;
authoritative caption in UNIT doc; transposed form absent) and the full cross-check
now passes **31/31, 0 fails**. No audit was weakened; no gate changed.

### Checks reproduced (all PASS)
Raw sha256 `924a01d3…986ae9c`; needle whole-law count 1; `find_article_text("第二十条の二")`
len 570 with needle; source_path resolved byte-for-byte in raw JSON; law identity
関税定率法 / 明治四十三年法律第五十四号 / Act / real revision; kind EXCEPTION,
unhandled_conditions=[]; source sub-terms and 13/7/proviso fidelity; needle verbatim in
impl/spec/tests/docs; ASCII-only `\u` audit literal with unique name, 433/433 checks;
imports wired once each; no forbidden placeholders or `simp` in proof bodies; all six
theorems axiom-free; Prop-vs-Bool spec distinctness with cases/rfl-only agreement;
full build succeeded (1333 jobs); unresolved この場合 dependency recorded honestly;
`LEGAL_REVIEW_PENDING` and no legal-correctness claim.

### Remaining findings
None. Human legal review remains `LEGAL_REVIEW_PENDING`.
