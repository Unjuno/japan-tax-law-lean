# Unit review — 関税定率法 附則第一条（施行期日）REFERENCE

Normative unit id: `NORM|21111ed8a33c42e815231a5c0a00eff4d3929eb2c478b1b8de466f6f41097bcc`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号,
law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`,
sha256 `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`.

Verbatim source text: 「この法律は、昭和四十二年六月一日から施行する。」 — this Act comes into force from 昭和42年6月1日 (era 昭和, era-year 42, month 6, day 1, all extracted structurally from the needle).

Exact source position:
`LawBody[19]/SupplProvision/SupplProvision[1]/Article:1/Article#1/Paragraph#1/ParagraphSentence/Sentence#1` — 附則 Article 第一条, caption （施行期日）. NOTE: this is a 附則 (SupplProvision) article; `find_article_text(...,"第一条")` sees main provisions only (returns len 62 WITHOUT the needle) → **file-kind** transcription locator used, not article-kind. Needle verbatim-unique in the whole law.

Norm kind: **REFERENCE** — a temporal-application (時間的適用) clause fixing the enforcement date. The computable slice models the enforcement date (Date: year/month/day Nat within the fixed era 昭和) and an `inForce` predicate (in force ON and AFTER the date) with a flat propositional independent spec. All statutory date components extracted structurally from the needle — no hand-typed statutory strings.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | In force on and after 昭和42年6月1日; not before. Flat spec (year>42 ∨ year=42∧month>6 ∨ year=42∧month=6∧day≥1) equivalent to nested leDate. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` file-kind check 「customs tariff 附則 art.1 enforcement date…↔ CustomsTariffArt1EnforcementDate.lean」. Full audit: 305/305 checks passed. |
| D (decision) | PASS — audit reports `305/305 checks passed`. |
| C (competing interpretation) | Only enforcement-date comparison within the fixed era 昭和 is modeled. Gregorian identification of era year 1, cross-era transitions, other supplementary provisions and legal correctness are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/CustomsTariffArt1EnforcementDate.lean` — Date (year/month/day Nat), enforcementDate ⟨42,6,1⟩, leDate lexicographic, inForce.
- Independent spec: `SpecInForce` flat disjunction (representationally distinct from nested leDate), `agree_in_force` universal axiom-free (explicit case analysis), boundary theorems.
- Build: `lake build` → full build success (965 jobs); unit build 5 jobs; all 4 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Gregorian identification of 昭和 year 1, cross-era ordering, other supplementary provisions, legal correctness. Computable slice of one REFERENCE norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART1_ENFORCEMENT_DATE.md`.
