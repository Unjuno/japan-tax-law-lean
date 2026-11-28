# Independent adversarial review — 関税定率法 第17条第1項第11号 DELEGATION

Unit: `NORM|7683650c1eee7e91e43bab06f869a0234b89d07aab791ea50dc7ebb7f077e00f`

Verbatim source text (injected from `build/task_queue.json`, not hand-typed): 「条約の規定により輸入の後一定の期間内に輸出されることを条件として関税を免除することとされている貨物で政令で定めるもの」

Source path (from queue): `LawBody[1]/MainProvision/MainProvision[30]/Article:17/Article#17/Paragraph#1/Item#11/ItemSentence/Sentence#1`.

## Verdict: NO FINDINGS

Independent adversarial review of the normative unit, its Lean implementation/spec/tests,
unit documentation, transcription-audit registration and umbrella imports found no
concrete defect in any of the mandated checks below. Legal correctness is **not** asserted;
the unit remains `LEGAL_REVIEW_PENDING` with `completion_claim = false`.

## Reproduced checks

1. **Raw SHA-256** — `data/raw/143AC0000000054_20260601_508AC0000000005.law.json` file bytes
   hash to `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`, matching the queue's `source_sha256` exactly.
2. **Needle location** — the needle occurs exactly once in the whole pinned law
   (`load_law_text` count = 1). The occurrence resolves to
   `law_full_text/children[1](LawBody)/children[1](MainProvision)/children[30](Article Num=17)/children[2](Paragraph Num=1)/children[14](Item Num=11)/children[1](ItemSentence)/children[0](Sentence Num=1)`,
   i.e. Article 17(1) Item 11 Sentence#1, with exact string equality. Semantics confirmed:
   treaty-based duty exemption, conditional on export within a fixed period, further
   limited by cabinet order.
3. **Source path** — impl (`.lean` doc header line 14) and unit doc (line 9) both carry the
   queue's `source_path` byte-exactly.
4. **INVENTORY identity** — `data/INVENTORY.json` holds exactly one law with
   `law_id = 143AC0000000054`: official title 関税定率法, law number 明治四十三年法律第五十四号,
   law type `Act`, current revision `143AC0000000054_20260601_508AC0000000005`, consistent
   with the queue's law identity and raw snapshot.
5. **Queue metadata** — `kind = DELEGATION`, `kinds = [DELEGATION]`,
   `unhandled_conditions = []`, `dependencies = []`; impl/spec/unit doc all label the norm DELEGATION.
6. **Fidelity / codepoints** — `inScope treatyExempt exportedInPeriod cabinetDesignated` is
   the conjunction of exactly three caller-established Bool gates; all three are required.
   No treaty name, period length, cabinet-order content, amount, unit or other legal detail
   is invented. `NOT MODELLED` for treaty content, period length, cabinet-order content and
   legal correctness is stated in impl (lines 29-31), spec (line 14) and unit doc (line 28).
   All five files containing the quote use exactly U+300C `「` and U+300D `」`, balanced once
   each; no U+300F/FF63/curly-quote lookalike, and no wrong closing-quote character appears
   in the Lean doc comments.
7. **Needle byte-exactness** — UTF-8 needle (174 bytes, SHA-256
   `63138221465616addc627f6b07cb33479ab8fe88b39e36923a204412e88b0b13`) occurs exactly once
   as a byte sequence in impl, spec, tests, unit doc and this review doc; each is enclosed
   verbatim in the same corner brackets as the quote above. No near-miss variant was found
   in any of the five files.
8. **Transcription audit** — `scripts/ci/transcription_audit.py` line 5454 registers the
   unique name `customs tariff law art.17 reexport goods delegation - CustomsTariffArt17ReexportGoodsDelegation.lean`
   (name count = 1). Its `\u`-escaped literal decodes byte-for-byte to the needle; law id is
   `143AC0000000054`; locator kind is `file` with title `None` (whole-law file), not an
   article-scoped haystack. `checks()` yields 830 checks; a fresh run printed
   `transcription audit: 830/830 checks passed` with no FAIL line.
9. **Imports** — `JapanTaxLaw.lean` imports each of the three modules exactly once
   (lines 467-469); spec imports impl once (line 1); tests import spec once (line 1).
10. **No forbidden placeholders / simp in proofs** — impl proofs are four `rfl` theorems;
    spec proof is exhaustive `cases`/`intro`/`exact ⟨rfl, rfl, rfl⟩`/`rfl`. No `sorry`,
    `admit`, `axiom`, `Classical.choice`, `simp`, `decide` or `propext` occurs in any proof
    body (the only such words are negations in prose doc comments).
11. **Axioms** — `lake env lean` on a scratch probe importing the tests module printed, for
    all five theorems `all_true_in_scope`, `no_treaty_out_of_scope`, `no_export_out_of_scope`,
    `no_designation_out_of_scope` and `spec_agreement`: "does not depend on any axioms".
12. **Independent spec** — representationally distinct: impl uses Bool `&&`, spec uses
    `a = true ∧ b = true ∧ c = true` as a Prop. `spec_agreement` proves equivalence by
    exhaustive cases on all three Bools (kernel cases, 8 branches).
13. **Full build** — a fresh `lake build` printed `Build completed successfully (2785 jobs)`
    with zero error lines.
14. **No cross-law** — queue `dependencies = []`; the Lean modules declare only `inScope`,
    `SpecInScope`, the five theorems and nine `example`s, with no cross-law constant.
    Treaty content, period length, cabinet-order content and legal correctness are NOT MODELLED.
15. **Review posture** — queue task has `legal_review = LEGAL_REVIEW_PENDING`,
    `completion_claim = false`; this review makes no completion claim.

Empty `evidence` / `artifacts` and `status = NOT_STARTED` in the queue at review time are
expected bookkeeping, not a defect; no evidence JSON was modified by this review.
