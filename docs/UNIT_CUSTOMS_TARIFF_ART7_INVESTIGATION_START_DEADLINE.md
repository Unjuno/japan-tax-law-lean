# Unit review — 関税定率法 第七条(7)（期間）EFFECT

Normative unit id: `NORM|30ed71fa6118f5875097cd20a81a022db6c3de058f41c43787932def13cc9ec6`

Law: 143AC0000000054 (関税定率法), revision `143AC0000000054_20260601_508AC0000000005`,
enforcement date 2026-06-01, snapshot `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`,
sha256 `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c` (9,407,678 bytes, pinned).

Verbatim source text: 「前項の調査は、当該調査を開始した日から一年以内に終了するものとする。」

Exact source position:
`LawBody[1]/MainProvision/MainProvision[16]/Article:7/Article#7/Paragraph#7/ParagraphSentence/Sentence#1`
— MainProvision Article 第七条, caption （相殺関税）. The needle was confirmed byte-for-byte
inside the pinned raw JSON at the recorded source path, independently of the Lean proof.

Distinctness from the neighbouring unit: `CustomsTariffArt7InvestigationDeadline.lean`
models art.7(31), where the one-year period runs from a request under 第二十九項.
This unit models art.7(7), where the same one-year length runs from 当該調査を開始した日
(the investigation start). Different paragraph, different trigger, different normative id.
No module-name, file-name, theorem-name or normative-id collision exists on main or in
PRs 764/832 (checked against their git trees).

Norm kind: **EFFECT** — a temporal-application deadline. Computable slice:
`withinDeadline oneYearDays start completion := completion ≤ start + yearCount * oneYearDays`,
with `yearCount = 1` derived solely from the verbatim 一年. The calendar conversion of 一年
into days is NOT MODELLED; `oneYearDays` is an explicit caller-established parameter.
以内 is modelled as INCLUSIVE (completion exactly at the deadline qualifies).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | The 前項 investigation ends within one year (inclusive 以内), measured from the day that investigation started. |
| T | `python scripts/ci/transcription_audit.py` article-kind check 「customs tariff art.7 investigation start deadline …↔ CustomsTariffArt7InvestigationStartDeadline.lean」, law `143AC0000000054`, article 第七条. The precise needle is pinned above. |
| D | PASS — `transcription audit: 782/782 checks passed`, including `PASS customs tariff art.7 investigation start deadline …↔ CustomsTariffArt7InvestigationStartDeadline.lean`. |
| C | Only the one-year deadline comparison is modeled. Investigation substance, how the investigation is started, the preceding paragraph's content, the calendar conversion of 一年 into days, and legal correctness are out of scope. |
| U | Transcription fidelity only — not a semantics audit. Human legal review remains pending and is never fabricated by automation. |

## Model and proof scope

- Implementation: `JapanTaxLaw/CustomsTariffArt7InvestigationStartDeadline.lean` — `yearCount=1`, `withinDeadline`, `at_deadline` (inclusive boundary), `before_deadline`, `one_day_past_fails` (via `Nat.not_succ_le_self`, no `omega`/unexplained axiom), `yearCount_value`.
- Independent spec: `JapanTaxLaw/CustomsTariffArt7InvestigationStartDeadlineSpec.lean` — own constants `specYearCount`, `specWithin`; no implementation identifiers inside the spec definitions; `agreeYearCount`/`agreeWithin` bridges plus an independent `spec_at_deadline`.
- Kernel-decided boundary tests: `JapanTaxLaw/CustomsTariffArt7InvestigationStartDeadlineTests.lean` — 0/1/12/365 day budgets, deadline day inclusive, one-day-past failing, start-day completion, theorem-as-proof examples.
- Kernel check (local `C:\Users\user\.elan\bin\lake.exe build JapanTaxLaw.CustomsTariffArt7InvestigationStartDeadlineTests`): `Build completed successfully (5 jobs)`.
- Axiom probe (`lake env lean` with `#print axioms`): `at_deadline`, `before_deadline`, `one_day_past_fails`, `agreeYearCount`, `agreeWithin`, `spec_at_deadline` report `does not depend on any axioms`. The two `if decide`/`simp` bridge theorems `daysRemaining_at_deadline` (`propext, Quot.sound`) and `agreeDaysRemaining` (`propext`) use only standard Lean kernel axioms — neither `sorryAx` nor `Classical.choice`, which CI forbids.
- Evidence predicates verified locally: `needles_ok=True`, `independent_spec=True`, `review_ok=True`, `examples=20`, `boundary_categories={zero, small_input, saturation}` (the required ≥3), `normative_id=NORM|30ed71fa…`. Attestation remains a prerequisite; before it exists the unit is correctly excluded from evidence.
- A first build attempt failed on `before_deadline`: the goal's left side is `start + offset`, not `start + yearCount * offset`. Fixed with `unfold withinDeadline yearCount; rw [Nat.one_mul]; exact Nat.add_le_add_left h start`. An intervening `simpa` proof depended on `propext` and was replaced by the explicit rewrite so the theorem is axiom-free.
- `python scripts/ci/check_no_sorry.py`: `no forbidden placeholder proofs found in tracked Lean sources`.

## Not modelled (explicitly retained as unhandled scope)

Investigation substance, commencement mechanism, preceding paragraph content, calendar
conversion of 一年 into days, and legal correctness. This is a computable slice of one
EFFECT unit — not an article-level or law-level completion claim, and not a §5 completion
claim. Human legal review remains pending (0/3,438 on main).
