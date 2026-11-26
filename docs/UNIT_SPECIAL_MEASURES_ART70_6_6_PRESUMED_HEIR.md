# Unit review — 租税特別措置法 第70条の6の6(2) PRESUMPTION

Normative unit id: `NORM|293a349f6f7d21dda09ef6ffecee55039fbaab8d4060af0cf337703a58b76a3a`

Law: 332AC0000000026 (租税特別措置法), Act. SHA-256 e6e6013b…5cf8d5ee.

Verbatim source text (injected from the queue, not hand-typed): 「当該個人が、当該相続の開始の直前において、当該被相続人の推定相続人であること。」

Exact source position: `LawBody[3]/MainProvision/MainProvision[3]/Article:70_6_6/Article#70_6_6/Paragraph#2/Item#4/Subitem1#1/Subitem1Sentence/Sentence#1`.

Norm kind: **PRESUMPTION** — the person was the presumed heir of the decedent immediately before the inheritance opened. Computable slice: the case-selection flag. CJK in the quote is byte-verbatim from the pinned source; English prose is descriptive.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | A presumed heir satisfies the condition; a non-heir does not. |
| T | `scripts/ci/transcription_audit.py` whole-law check for SpecialMeasuresArt70_6_6PresumedHeirCondition.lean. |
| D | PASS — transcription audit 777/777. |
| C | Only the flag selection is modeled. Heir-status determination and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/SpecialMeasuresArt70_6_6PresumedHeirCondition.lean` — `qualifies` on a Bool flag, two boundary theorems.
- Independent spec: `SpecQualifies` Prop negation of the complementary case, representationally distinct; all three theorems axiom-free.
- Build: full lake build success (2614 jobs); no `sorryAx`/`Classical.choice`.

## Not modelled
Heir-status determination, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_SPECIAL_MEASURES_ART70_6_6_PRESUMED_HEIR.md`.
