# Unit review — 災害被害者租税減免法 附則 第1条(1) DELEGATION

Normative unit id: `NORM|ad36635987ca63b79c1be8d9f004dd6314ab9fd2925d6c43aa6de45e2c3169fb`

Law: 322AC0000000175 (災害被害者租税減免法), Act. SHA-256 c3bb5b0b…f5f4e7ef.

Verbatim source text (injected from the queue, not hand-typed): 「この法律は、公布の日から起算して一年を超えない範囲内において政令で定める日から施行する。」

Exact source position: `LawBody[45]/SupplProvision/SupplProvision[1]/Article:1/Article#1/Paragraph#1/ParagraphSentence/Sentence#1`.

Norm kind: **DELEGATION** (with REFERENCE and CONDITION aspects) — the Act takes effect on a date fixed by Cabinet Order, within a period not exceeding one year from promulgation. Computable slice: delegation-target selection and the inclusive one-year delay cap. CJK in the quote is byte-verbatim from the pinned source; English prose is descriptive.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | Cabinet Order fixes the enforcement date; delay of 0 or 1 year is within the cap, 2 years is not. |
| T | `scripts/ci/transcription_audit.py` whole-law check for DisasterReliefSupplArt1DelegatedEnforcementDate.lean. |
| D | PASS — transcription audit 700/700. |
| C | Only the target and cap are modeled. Actual promulgation/fixed dates, Cabinet Order content, and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/DisasterReliefSupplArt1DelegatedEnforcementDate.lean` — `DelegationTarget`, `delegationTarget=cabinetOrder`, `maxDelayYears=1`, `withinCap`, six boundary theorems.
- Independent spec: `SpecTarget` Prop equality and `SpecWithinCap` absence of reverse strict inequality, representationally distinct; agreements proved by cases and Nat-specific lemmas. All nine unit theorems axiom-free; no `decide`/`simp`/`propext`.
- Build: full lake build success (2326 jobs); no `sorryAx`/`Classical.choice`.

## Not modelled
Actual dates, Cabinet Order content, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_DISASTER_RELIEF_SUPPL_ART1_DELEGATED_ENFORCEMENT_DATE.md`.
