# Independent adversarial review — 関税定率法 第3条の2(2) item1 REFERENCE

Unit: NORM|3860b04f653665e60dc8012064fa44884eddeb064ba1d0724372454c2946bb5a
Law: 143AC0000000054 関税定率法 (Act), revision 143AC0000000054_20260601_508AC0000000005.
Verbatim source text (copied programmatically from `build/task_queue.json`, not hand-typed): 「この法律その他関税に関する法律の規定により関税の率が無税とされている貨物及び関税が免除される貨物」

## Verdict: NO FINDINGS

No concrete defect found. All mandated checks were reproduced independently against
the pinned e-Gov raw snapshot, the queue, INVENTORY, the audit script, and the Lean build.
Queue bookkeeping (`NOT_STARTED` / empty `evidence` / empty `artifacts`) is expected at
review time and is not treated as a finding.

## Reproduced checks

1. **Raw SHA256.** `data/raw/143AC0000000054_20260601_508AC0000000005.law.json` hashes to
   `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`; equals the queue
   `source_sha256` and INVENTORY `raw_snapshot.source_sha256`.
2. **Needle uniqueness / location.** The exact 48-codepoint string occurs exactly once in
   the raw law text. Parsed node path: `law_full_text/children[1]/children[1]/children[3]/
   children[3]/children[2]/children[1]/children[0]/children[0]`, with ancestor tags
   `LawBody → MainProvision → Article(Num=3_2) → Paragraph(Num=2) → Item(Num=1) →
   ItemSentence → Sentence(Num=1)`. Matches the queue `source_path` exactly.
3. **Source path copied.** `LawBody[1]/MainProvision/MainProvision[3]/Article:3_2/
   Article#3_2/Paragraph#2/Item#1/ItemSentence/Sentence#1` appears byte-for-byte in the impl
   header (line 14) and the unit doc (line 9).
4. **Law identity.** Queue `law_id`, `law_title` (関税定率法), `source_file`, `revision` and
   `source_sha256` all match `data/INVENTORY.json` for law 143AC0000000054; `law_type` Act.
5. **Kind / flags.** Queue record: `kind` = `REFERENCE`, `unhandled_conditions` = `[]`,
   `dependencies` = `[]`.
6. **Source fidelity.** Reading full Article 3の2 confirms para. (2) excludes the listed
   goods from the simplified rate; item 1 is exactly the zero-rate/duty-exempt class. The
   impl models only class selection (`GoodClass.zeroRate`, `.exempt`, `.other`; `inScope`
   True/True/False). No goods list is invented. `NOT MODELLED` for actual goods lists and
   legal correctness is stated in the impl (lines 28-30), spec (line 15), and unit doc
   (lines 19, 27-28). CJK codepoints of every quote were compared against the queue string.
7. **Verbatim needle in artifacts.** Exact string occurs exactly once in each of the impl,
   spec, tests, unit doc, and this review doc; no wrong-codepoint variant found.
8. **Audit.** `scripts/ci/transcription_audit.py` line 5227 name
   `customs tariff law art.3_2 zero-rate and exempt goods - CustomsTariffArt3_2ZeroRateAndExemptGoods.lean`
   is unique (1 occurrence). Its `\u`-escaped literal at line 5230 decodes codepoint-for-codepoint
   to the queue needle. Locator kind `file`, `law_id` 143AC0000000054, whole-law search
   (`load_law_text`). `checks()` yields 782 entries; a fresh run printed
   `transcription audit: 782/782 checks passed`, including this unit.
9. **Imports.** `JapanTaxLaw.lean` lines 497-499 import impl, spec and tests exactly once each.
10. **No forbidden placeholders.** Proof bodies use only `trivial`, `intro`, `cases`, `constructor`,
    `rfl`/`.elim`; no `sorry`, `admit`, `axiom`, `Classical.choice`, `decide`, `simp`, `propext`
    in any proof (the only occurrences of those words are in documentary comments).
11. **Axioms.** `set PATH=C:\Users\user\.elan\bin;%PATH% && lake env lean _adv32axioms.lean`
    with `#print axioms` for all four theorems returned “does not depend on any axioms” for
    `zero_rate_in_scope`, `exempt_in_scope`, `other_not_in_scope`, `scope_spec_agreement`.
12. **Independent spec.** `SpecInScope g := g ≠ GoodClass.other` is representationally distinct
    from the recursive `inScope` (True/False); `scope_spec_agreement` proves the equivalence by
    an exhaustive `cases g` with no decidability or simplification shortcut.
13. **Build.** `lake build` → `Build completed successfully (2644 jobs).` No warnings reference
    the three unit files.
14. **Honesty.** No dependency, no cross-law constant, no goods lists; legal correctness and
    goods lists explicitly NOT MODELLED.
15. **Status.** Queue `legal_review` = `LEGAL_REVIEW_PENDING`, `status` = `NOT_STARTED`,
    `completion_claim` = `false`; documentation makes no completion claim.

## Scope of this verdict

This is a transcription/structure review only. It does not assert legal correctness and does
not replace human `LEGAL_REVIEW`.
