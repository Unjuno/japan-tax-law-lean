# Unit review — 電子情報処理組織特例省令 art.11(4)（日本銀行統轄店の読替え / READING）

Normative unit id: `NORM|9fd94438ec86e54b93185af79c792e4d717118ed05e061a185155d2d8ac463f0`
Law: `403M50000040054`, revision `403M50000040054_20260924_508M60000040059` (`CurrentEnforced`).
Source: `data/raw/403M50000040054_20260924_508M60000040059.law.json`
SHA-256 (CRLF→LF): `d975b5d18cdd9dd0f21fbb598e8704186e1cff3779ed1b9cacfd04df5c42fe41`
Provision: `LawBody[2]/MainProvision/MainProvision[11]/Article:11/Article#11/Paragraph#4/ParagraphSentence/Sentence#2`

Verbatim (READING): 「この場合において、同条第六項中「日本銀行統轄店」とあるのは、「所轄歳入取りまとめ店」と読み替えるものとする。」

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | The term 日本銀行統轄店 is to be read as 所轄歳入取りまとめ店 in 同条第六項. Term codes 0→1; others preserved. Numerals are term tags, not amounts. |
| T | Pin + `transcription_audit.py` needle scoped to `第十一条`. Independent audit: needle whole law = 1, scoped (800 chars) = 1; SHA/revision match INVENTORY. |
| D | PASS — verbatim-unique needle, correct revision, no blocking transcription defect. |
| C | 附則 has no duplicate. Only the term substitution is modelled, not 第六項's substance. |
| U | Trigger condition and 第六項 content need their own units. Human legal review `LEGAL_REVIEW_PENDING`. |

## Model and proof

- Impl: `BankHeadOfficeTermReading.lean` — `readAs : Nat → Nat | 0 => 1 | n+1 => n+1`, with three boundary theorems and universal `idempotent`.
- Independent spec: `BankHeadOfficeTermReadingSpec.lean` — `specReadAs c := if c = 0 then 1 else c`, no implementation definitions reused.
- Universal kernel proof: `agree_read_as (c : Nat)` — `cases c <;> rfl`; axiom-free (no `omega`, no `simp`, no `Classical.choice`).
- Tests: 9 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

Not modelled: trigger condition, 第六項's content, other articles. Human legal review remains `LEGAL_REVIEW_PENDING`.
