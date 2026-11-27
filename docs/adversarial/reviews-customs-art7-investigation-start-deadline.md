# Adversarial review — 関税定率法 第七条(7) investigation-start one-year deadline

### CustomsTariffArt7InvestigationStartDeadline.lean

独立再抽出による一次資料との照合記録。H/T/D/C/U は下記の五節に個別記録する。
判定: transcription/kernel/boundary は PASS、法的妥当性は human review pending。

Target: `NORM|30ed71fa6118f5875097cd20a81a022db6c3de058f41c43787932def13cc9ec6`
Modules: `CustomsTariffArt7InvestigationStartDeadline{,Spec,Tests}.lean`

## H — falsifiable hypotheses checked

1. The norm is an EFFECT/deadline: the 前項 investigation must finish 一年以内
   from 当該調査を開始した日.
2. 以内 is inclusive: completion exactly at the deadline qualifies.
3. 一年 is left abstract (`oneYearDays`), because the statute gives no calendar
   conversion; no 365-day assumption is smuggled in.

## T — reproducible checks actually run

- Pinned raw bytes: `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`,
  SHA-256 `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`,
  9,407,678 bytes. Needle found at
  `LawBody[1]/MainProvision/MainProvision[16]/Article:7/Article#7/Paragraph#7/ParagraphSentence/Sentence#1`.
- `python scripts/ci/transcription_audit.py` → `782/782 checks passed`, including
  the new article-kind check.
- `lake build JapanTaxLaw.CustomsTariffArt7InvestigationStartDeadlineTests` →
  `Build completed successfully (5 jobs)`.
- `#print axioms` on all six key theorems → each `does not depend on any axioms`.
- `python scripts/ci/check_no_sorry.py` → no forbidden placeholder proofs.
- `python scripts/ci/verify_queue_invariants.py` → `17/17 invariants passed`.
- `python scripts/ci/generate_umbrella.py --check` → `2641/2641, 0 duplicates`.
- Evidence mapper: module resolves to the exact normative id above.

## D — verdict

PASS on transcription fidelity, kernel construction, axiom freedom, boundary
decisions and id resolution. NOT a legal-correctness determination and NOT a
whole-article or whole-law completion claim.

## C — competing interpretations examined

- **Inclusive vs exclusive 以内.** Japanese 以内 ordinarily includes the endpoint.
  The model implements inclusive (`≤`) and proves both `at_deadline` and
  `one_day_past_fails`; this is the mainstream reading. An exclusive reading
  would flip the boundary theorem. It is NOT silently adopted; the choice is
  recorded in the unit doc and remains open to human review.
- **Trigger date.** Art.7(7) runs from 調査開始日; art.7(31) runs from a 第二十九項
  request. These are modelled as two distinct units with distinct ids and source
  paragraphs. A reviewer who reads them as the same deadline is contradicted by
  the verbatim needles and source paths.
- **一年 conversion.** No 365-day constant is introduced. `oneYearDays` is an
  explicit caller-established parameter; `yearCount=1` comes only from the kanji
  一年. Any calendar-specific reading is out of scope and not claimed.
- **Before-start completion.** The impl does not assert `completion ≥ start`;
  a completion before the start satisfies the arithmetic inequality. This is a
  deliberate scope limit (abstract day counts), not an accidental strengthening.
  The independent spec uses the same form and does not add that constraint.

## U — residual uncertainty

- Human legal review: pending (0/3,438 recorded on main); no reviewer or
  approval field was fabricated.
- The statutory meaning of 調査, its commencement mechanism, the preceding
  paragraph, and 附則/経過措置 interactions are unmodelled.
- Kernel checks are finite examples plus two universally quantified theorems;
  finite checks are NOT presented as universal proof. The universal theorems
  are kernel-checked with no axioms.
- Not merged and not attested at time of writing; no §5 completion claim.
