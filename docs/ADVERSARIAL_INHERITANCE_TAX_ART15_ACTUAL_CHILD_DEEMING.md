# Independent adversarial review — 相続税法 第15条(3) DEEMING

Unit: NORM|3a29e9541c61aee3230a076944570965f9b95a0617d2d8dd3a8975ee05f475df
Law: 325AC0000000073 (相続税法), Act, revision `325AC0000000073_20260401_506AC0000000008`.
Verbatim source text (copied programmatically from `build/task_queue.json` task `text`, not hand-typed): 「前項の規定の適用については、次に掲げる者は実子とみなす。」
Exact source position: `LawBody[3]/MainProvision/MainProvision[1]/Article:15/Article#15/Paragraph#3/ParagraphSentence/Sentence#1`.

## Verdict: NO FINDINGS

All 15 mandated checks were independently reproduced from authoritative sources
(queue, INVENTORY, pinned raw law JSON, audit helper, and the Lean kernel) — not
from the author's prose. No concrete defect was found. The unit files remain in place.

1. **Raw SHA256** — `data/raw/325AC0000000073_20260401_506AC0000000008.law.json` hashes to
   `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`, equal to
   the queue's `source_sha256` and to the impl/doc pin.
2. **Needle uniqueness and location** — exactly one occurrence in the whole law,
   at `law_full_text.children[1]` (LawBody) → `[3]` (MainProvision) → `[1]` → `[1]`
   → `[6]` (`Article` `Num=15`) → `[4]` (`Paragraph` `Num=3`) → `[1]`
   (`ParagraphSentence`) → `[0]` (`Sentence` `Num=1`): byte-identical to the queue
   text. Article 15(2) limits the count of adopted heirs; (3) deems the enumerated
   persons 実子 for the application of that preceding paragraph — the deeming
   semantics asserted by the unit. The enumeration itself is not claimed as modelled.
3. **`source_path`** — exact string `LawBody[3]/MainProvision/MainProvision[1]/Article:15/Article#15/Paragraph#3/ParagraphSentence/Sentence#1` present verbatim in
   `JapanTaxLaw/InheritanceTaxArt15ActualChildDeeming.lean` (line 14) and
   `docs/UNIT_INHERITANCE_TAX_ART15_ACTUAL_CHILD_DEEMING.md` (line 9), and in this review.
4. **Law identity** — `data/INVENTORY.json` record `325AC0000000073`: official title
   相続税法, law_num 昭和二十五年法律第七十三号, law_type `Act`, current revision
   `325AC0000000073_20260401_506AC0000000008` (CurrentEnforced) — all match the unit. `SPEC_SCOPE_MAP.json`
   also records this id as `kind: DEEMING`.
5. **Queue metadata** — `kind`/`norm_type` = `DEEMING`, `unhandled_conditions=[]`,
   `dependencies=[]` (verified by parsing `build/task_queue.json`).
6. **Source fidelity** — `deemAsActualChild` maps `listedPerson → actualChild`,
   `actualChild → actualChild`, `other → other` with three fully explicit branches;
   no catch-all `| a => a` branch exists anywhere in the module. No enumerated-person
   identities are invented (the statute's 特別養子縁組・配偶者の実子・直系卑属 items
   are not encoded). "The identity of the enumerated persons and legal correctness
   are NOT MODELLED" is stated in impl (lines 29–31), spec (line 15), and unit doc
   (lines 19, 27–28).
7. **Codepoints** — the needle occurs exactly once in impl, spec, tests, unit doc,
   and this review doc; all 28 characters match the queue by code point
   (前 524D, 項 9805, 規 898F, 定 5B9A, 適 9069, 用 7528, 次 6B21, 掲 63B2,
   者 8005, 実 5B9F, 子 5B50, 、 3001, 。 3002, etc.). No 實/挙/見 or other
   wrong-codepoint variants occur in the unit's files; 相続税法 = 76F8 7D9A 7A0E 6CD5.
8. **Audit** — the check name `inheritance tax art.15 actual child deeming -
   InheritanceTaxArt15ActualChildDeeming.lean` (`scripts/ci/transcription_audit.py`
   lines 5168–5171) is unique; its `\u`-literal decodes exactly to the needle; kind
   `file` with law id `325AC0000000073` is a whole-law locator (no embedded
   `source_path`, by design). Running the audit produced 772 PASS lines and
   `transcription audit: 772/772 checks passed`, including this unit's PASS line.
9. **Imports** — `JapanTaxLaw.lean` lines 1120, 1121, 1122 import impl, spec and
   tests exactly once each.
10. **No forbidden tokens** — proof bodies of all five theorems and five `example`
    declarations contain no `sorry`, `admit`, `axiom`, `Classical.choice`, `simp`,
    `decide` or placeholders; only `rfl`, `unfold`, `intro`, `cases` are used. The
    words in the naive token scan came solely from doc comments.
11. **Axiom probes** — `set PATH=C:\Users\user\.elan\bin;%PATH% && lake env lean
    _adv_axioms.lean` printed "does not depend on any axioms" for all five theorems:
    `listed_deemed_actual_child`, `actual_child_unchanged`, `other_not_deemed`,
    `deeming_spec_agreement`, `listed_spec_agreement`. No `propext`.
12. **Independent spec** — `SpecDeeming p q := p = listedPerson → q = actualChild`
    is an implication Prop, representationally distinct from the impl's equality
    on a transformed enum. `deeming_spec_agreement` proves, by cases over all three
    constructors, that the transformation satisfies it; `listed_spec_agreement`
    instantiates it. (A one-sided implication spec warrants only this forward
    agreement direction; no reverse equivalence is claimed by the unit.)
13. **Build** — full `lake build` completed successfully (2599 jobs).
14. **Dependencies / cross-law** — queue records no dependencies; impl imports only
    shared `JapanTaxLaw.TaxFinance`, spec/tests import only this unit's own modules;
    no cross-law constant. Enumerated-person identities, Civil Code references, the
    rest of Article 15 and legal correctness are NOT MODELLED.
15. **Legal review** — impl says "Human legal review pending."; unit doc records
    `LEGAL_REVIEW_PENDING` and no completion claim. Queue `status: NOT_STARTED` with
    empty evidence at review time is expected bookkeeping, not a unit defect.

Human legal review remains `LEGAL_REVIEW_PENDING`. No file outside this review
document was modified or deleted by the reviewer; scratch probes used leading
underscores and were removed.
