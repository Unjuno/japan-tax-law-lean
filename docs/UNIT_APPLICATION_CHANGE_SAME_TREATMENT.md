# Unit review — 相互防衛援助協定臨時特例法施行令 art.4(1)（申請変更時も同様 / CONDITION）

Normative unit id: `NORM|df91b6eeec113081b40d8e33fb133b7e3742721e266f430dbcdc8292415ea617`
Law: `329CO0000000103`, revision `329CO0000000103_20250401_507CO0000000006` (`CurrentEnforced`).
Source: `data/raw/329CO0000000103_20250401_507CO0000000006.law.json`
SHA-256 (CRLF→LF): `97ec731308d1674e6d6014594f7c3befbaf5ccb438081c2ba8c018deaeea1563`
Provision: `LawBody[2]/MainProvision/MainProvision[3]/Article:4/Article#4/Paragraph#1/ParagraphSentence/Sentence#2`

Verbatim (CONDITION): 「当該申請書に係る申請の内容を変更しようとする場合も、また同様とする。」

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | If the application content is changed, the same treatment as 前項 applies. Case codes 0 (change) → 1 (same treatment); others preserved. Numerals are tags, not amounts. |
| T | Pin + `transcription_audit.py` needle scoped to `第四条`. Independent audit: needle whole law = 1, scoped (384 chars) = 1; SHA/revision match INVENTORY. |
| D | PASS — verbatim-unique needle, correct revision, no blocking transcription defect. |
| C | 附則 has no duplicate. Only the case-extending condition is modelled, not 前項's substance. |
| U | 前項's content and application procedure need their own units. Human legal review `LEGAL_REVIEW_PENDING`. |

## Model and proof

- Impl: `ApplicationChangeSameTreatment.lean` — `asSameTreatment : Nat → Nat | 0 => 1 | n+1 => n+1`, with three boundary theorems and universal `idempotent`.
- Independent spec: `ApplicationChangeSameTreatmentSpec.lean` — `specAsSameTreatment c := if c = 0 then 1 else c`, no implementation definitions reused.
- Universal kernel proof: `agree_as_same_treatment (c : Nat)` — `cases c <;> rfl`; axiom-free (no `omega`, no `simp`, no `Classical.choice`).
- Tests: 9 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

Not modelled: 前項's content, application procedure, other articles. Human legal review remains `LEGAL_REVIEW_PENDING`.
