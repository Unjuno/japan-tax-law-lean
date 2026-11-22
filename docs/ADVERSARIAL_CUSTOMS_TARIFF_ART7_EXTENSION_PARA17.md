# Independent adversarial review — 関税定率法 第七条(27)（条件）CONDITION

Reviewer: an independent agent session (no shared working context with the
author). Temp scripts written outside the repo and deleted; no repository file
modified by the reviewer; no `lake build` run by reviewer.

Unit: NORM|28020c69b3e5d4d0606cd4ef67a43debfc5c5ed5be444e634b6d0acc304ba0c0
Verbatim (injected from the authoritative queue task, not hand-typed):
  「第十七項の規定により延長する場合」

## Verdict: CONCRETE FINDINGS (2) — both documentation/provenance defects, FIXED, confirming review pending

All source, transcription, interpretation and Lean-kernel checks passed (no
H/T/C/U defects). The two findings were:

1. **D — adversarial doc missing (High).** The unit doc referenced
   `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART7_EXTENSION_PARA17.md` but that file did
   not exist (only the draft script `_mkadv85.py` existed). Fixed by creating
   this file with the recorded verdict.
2. **D — evidence flag placeholder (High).** The evidence entry carried
   `"adversarial_review": "__ADVERSARIAL__"`. Fixed by recording this verdict.

## Reviewer's core checks — all PASS

- SHA-256 of raw JSON = `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c` (exact match).
- Needle from queue (16 codepoints), whole-law count 1; Article Num=7, title 第七条,
  caption （相殺関税） fullwidth; Paragraph 27, Item 1 column-1 label = needle;
  Item 2 = 第二十二項の規定により延長する場合.
- Byte fidelity: impl/spec/tests/unit-doc quotes byte-equal to queue needle; audit
  needle via \u escapes = queue needle; caption/title/law_num exact.
- Law identity: 関税定率法 (NOT 関税法), 明治四十三年法律第五十四号, Act, real revision.
- Locator: find_article_text("第七条") len 5989, contains needle — article-kind honest.
- Interpretation: needle is ONLY the column-1 case label; anchor date and 五年以内
  cap are in other columns — NOT MODELLED declaration honest; para 17 extraction from
  第十七項 correct; `other` basis reasonable; spec equivalent for both constructors.
- Proof: agree_is_para17_extension uses cases/rfl/cases, no decide/simp/propext;
  SpecIsPara17Extension representationally distinct from Bool function;
  build/_ax_t85.out: "does not depend on any axioms"; no forbidden axioms/tokens.
- Audit: English-only check name, kind=article, 第七条; no duplicate; audit 338/338.
- Duplicate: none. Evidence hashes match on-disk files (CRLF->LF).
- Stale-label scan: no @@, 報告, 読替え・準用, wrong caption parens, hand-typed statutory strings.

**U (non-blocking):** legal correctness remains `LEGAL_REVIEW_PENDING`.

## Closing

Both documentation findings fixed; confirming review pending before finalization.
No legal correctness claim; human legal review remains `LEGAL_REVIEW_PENDING`.
