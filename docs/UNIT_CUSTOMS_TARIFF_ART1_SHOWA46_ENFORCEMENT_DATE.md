# Unit review — 関税定率法 附則第一条（施行期日）REFERENCE

Normative unit id: `NORM|3ae41f5f074cf6b4f9da3b4a62e85f726a734f3c0108278bf1e3ae2002245bf4`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号, law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005`.

Verbatim source text: 「この法律は、昭和四十六年一月一日から施行する。」 — a temporal-application REFERENCE fixing an enforcement date (昭和46年1月1日). Date components extracted programmatically from the needle's kanji numerals. Needle is in an 附則, so the audit uses the `file` locator.

Exact source position: `LawBody[23]/SupplProvision/SupplProvision[1]/Article:1/Article#1/Paragraph#1/ParagraphSentence/Sentence#1` — Article caption （施行期日）.

Norm kind: **REFERENCE** — temporal applicability (in force on and after the enforcement date).

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The Act is in force on and after 昭和46年1月1日, not before. |
| T | `scripts/ci/transcription_audit.py` file-kind check for CustomsTariffArt1Showa46EnforcementDate.lean. |
| D | PASS — transcription audit 449/449. |
| C | Only within-昭和 date comparison modeled; Gregorian/cross-era out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt1Showa46EnforcementDate.lean` — `Date` structure, `enforcementDate=⟨46,1,1⟩`, lexicographic `leDate`, `inForce`.
- Independent spec: flat `SpecInForce` (> / >=) disjunction, representationally distinct; `agree_in_force` axiom-free (case analysis/equality symmetry).
- Build: full lake build success (1372 jobs); all five unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Dependencies
The queue records one `enforcement_version` dependency (textual, `sufficient=false`), recorded honestly.

## Not modelled
Gregorian identification of 昭和 year 1, cross-era transitions, other supplementary provisions, legal correctness.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART1_SHOWA46_ENFORCEMENT_DATE.md`.
