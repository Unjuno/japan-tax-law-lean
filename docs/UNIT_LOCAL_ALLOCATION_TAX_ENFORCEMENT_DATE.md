# Unit review — 地方交付税法 附則（昭和三八年法律第二三号）第一条（施行期日）

Normative unit id: `NORM|fb5a0e940fe5c31e14cdc8f7832e98b1b6df531a1fc429e963161c0c838bceaf`

Law: 325AC0000000211 (地方交付税法, Local Allocation Tax Act),
law number 昭和二十五年法律第二百十一号,
revision `325AC0000000211_20261102_508AC0000000062`,
snapshot `data/raw/325AC0000000211_20261102_508AC0000000062.law.json`,
sha256 `151df453a55442acb1cdca91f420bc5f7b04b914b85d86b575311ff6e3a7cd95`.

Verbatim source text: 「この法律は、公布の日から起算して九十日をこえない範囲内において政令で定める日から施行する。」

Source position (corrected after adversarial F3): top-level amendment-history
附則 with `AmendLawNum='昭和三八年三月二二日法律第二三号'`, Article 第一条（施行期日）,
Paragraph Num=1, Sentence#1. This is the enforcement-date clause of the 1963
amendment act; 「この法律」 denotes that amendment act, not a standing norm.

Norm kind: **DELEGATION** (enforcement date set by cabinet order) with temporal-application bound.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The amendment act takes effect on a cabinet-order date within a range not exceeding 90 days from promulgation. 「九十日をこえない」 is inclusive (delay ≤ 90). Unit 日; domain Nat. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` — verbatim-unique needle in the pinned 地方交付税法 snapshot (file-kind locator: the needle is in an amendment-history 附則, and `find_article_text` scopes to main provisions only). Law identity from INVENTORY `official_title=地方交付税法`; structural provision location verified independently. Full audit: 182/182 checks passed. |
| D (decision) | PASS — audit reports `182/182 checks passed`. |
| C (competing interpretation) | 「こえない範囲内」 is inclusive (day 90 qualifies, day 91 fails). The lower bound `promulgationDay ≤ enforcementDay` is implicit in 「公布の日から起算して…範囲内」 and legally necessary. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/LocalAllocationTaxEnforcementDate.lean` — `maxDelayDays=90`, `withinEnforcementRange p e := p ≤ e ∧ e - p ≤ maxDelayDays`.
- Independent spec: `specWithinEnforcementRange p e := p ≤ e ∧ e ≤ p + maxDelayDays` (endpoint form, distinct from subtraction form); `agree_enforcement_range` universal over all day pairs.
- Boundary theorems: `at_promulgation`, `at_max_delay`, `beyond_max_delay`, `before_promulgation`.
- Build: `lake build` → full build success (596 jobs); all 5 theorems axiom-clean (`propext`/`Quot.sound` only); no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The actual cabinet-order enforcement date, the substantive local-allocation-tax rules, other supplementary provisions and 政令 details. This is a computable slice of one DELEGATION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent adversarial findings F1–F3 (false law-name / source-path provenance) were reproduced and fixed; recorded in
`docs/ADVERSARIAL_LOCAL_ALLOCATION_TAX_ENFORCEMENT_DATE.md` (H/T/D/C/U per finding).
