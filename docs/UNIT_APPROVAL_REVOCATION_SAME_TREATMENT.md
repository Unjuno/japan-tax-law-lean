# Unit review — 石油ガス税法施行規則 art.1(5)（承認取消し時も同様 / CONDITION）

Normative unit id: `NORM|09558050800729550f1385a32bc0699eeacdd49be6ba2cfee74c9a19c9c1c617`
Law: `341M50000040004`, revision `341M50000040004_20250401_507M60000040023` (`CurrentEnforced`).
Source: `data/raw/341M50000040004_20250401_507M60000040023.law.json`
SHA-256 (CRLF→LF): `994d9a1c2359c78ad23f37038e7a9a6a319813b86c2b447e3334abc551d3efcb`
Provision: `LawBody[2]/MainProvision/MainProvision[0]/Article:1/Article#1/Paragraph#5/ParagraphSentence/Sentence#2`

Verbatim (CONDITION): 「その承認を取り消す場合も、また同様とする。」

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | If approval is revoked, the same treatment as the preceding sentence applies. Case codes 0 (revocation) → 1 (same treatment); others preserved. Numerals are tags, not amounts. |
| T | Pin + `transcription_audit.py` needle scoped to `第一条`. Independent audit: needle whole law = 1, scoped (748 chars) = 1; SHA/revision match INVENTORY. |
| D | PASS — verbatim-unique needle, correct revision, no blocking transcription defect. |
| C | 附則 has no duplicate. Only the case-extending condition is modelled, not the preceding rule. |
| U | Preceding rule and approval procedure need their own units. Human legal review `LEGAL_REVIEW_PENDING`. |

## Model and proof

- Impl: `ApprovalRevocationSameTreatment.lean` — `asSameTreatment : Nat → Nat | 0 => 1 | n+1 => n+1`, with three boundary theorems and universal `idempotent`.
- Independent spec: `ApprovalRevocationSameTreatmentSpec.lean` — `specAsSameTreatment c := if c = 0 then 1 else c`, no implementation definitions reused.
- Universal kernel proof: `agree_as_same_treatment (c : Nat)` — `cases c <;> rfl`; axiom-free (no `omega`, no `simp`, no `Classical.choice`).
- Tests: 9 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

Not modelled: preceding rule, approval procedure, other articles. Human legal review remains `LEGAL_REVIEW_PENDING`.
