# Unit review — 沖縄減免税割当省令 art.4(2)（分割証明書の交付 / CONDITION）

Normative unit id: `NORM|3c61e72146aeaf0747d12de360880c43d12d5692358e64bfac73b2ae6c13f621`
Law: `347M50010000033`, revision `347M50010000033_19950401_407M50000200026` (`CurrentEnforced`).
Source: `data/raw/347M50010000033_19950401_407M50000200026.law.json`
SHA-256 (CRLF→LF): `b432f8360f95eafc617d784849e6845166a2bbdd993d313f3f146a661f5bde3a`
Provision: `LawBody[2]/MainProvision/MainProvision[3]/Article:4/Article#4/Paragraph#2/ParagraphSentence/Sentence`

Verbatim (CONDITION): 「沖縄県知事は、前項の申請書を受理したときは、申請に係る証明書に代えて、分割した証明書を交付するものとする。」

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | When the Okinawa prefectural governor accepts the application, a divided certificate is issued instead of the original. Case codes 0 (accepted) → 1 (divided certificate); others preserved. Numerals are tags, not amounts. |
| T | Pin + `transcription_audit.py` needle scoped to `第四条`. Independent audit: needle whole law = 1, scoped (231 chars) = 1; SHA/revision match INVENTORY. |
| D | PASS — verbatim-unique needle, correct revision, no blocking transcription defect. |
| C | 附則 has no duplicate. Only the case condition is modelled, not application requirements or certificate contents. |
| U | 前項's requirements and certificate substance need their own units. Human legal review `LEGAL_REVIEW_PENDING`. |

## Model and proof

- Impl: `OkinawaDividedCertificateIssuance.lean` — `asDividedCert : Nat → Nat | 0 => 1 | n+1 => n+1`, with three boundary theorems and universal `idempotent`.
- Independent spec: `OkinawaDividedCertificateIssuanceSpec.lean` — `specAsDividedCert c := if c = 0 then 1 else c`, no implementation definitions reused.
- Universal kernel proof: `agree_as_divided_cert (c : Nat)` — `cases c <;> rfl`; axiom-free (no `omega`, no `simp`, no `Classical.choice`).
- Tests: 9 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

Not modelled: 前項's requirements, certificate contents, other articles. Human legal review remains `LEGAL_REVIEW_PENDING`.
