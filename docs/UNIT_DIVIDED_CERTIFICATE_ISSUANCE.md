# Unit review — とうもろこし等関税割当省令 art.4(2)（分割証明書の交付 / CONDITION）

Normative unit id: `NORM|834e3b379b625233df4e9132533eabcb0a102072417003492cc995dd3282f8a8`
Law: `340M50010000013`, revision `340M50010000013_20220401_504M60000200005` (`CurrentEnforced`).
Source: `data/raw/340M50010000013_20220401_504M60000200005.law.json`
SHA-256 (CRLF→LF): `bffc3255bd51f8e34dc4ca4463aa05bb6e75d9c174f5f644208df706820a2ba3`
Provision: `LawBody[2]/MainProvision/MainProvision[3]/Article:4/Article#4/Paragraph#2/ParagraphSentence/Sentence#1`

Verbatim (CONDITION): 「農林水産大臣は、前項の申請書を受理したときは、申請に係る証明書に代えて、分割した証明書を交付するものとする。」

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | When the application is accepted, a divided certificate is issued instead of the original. Case codes 0 (accepted) → 1 (divided certificate); others preserved. Numerals are tags, not amounts. |
| T | Pin + `transcription_audit.py` needle scoped to `第四条`. Independent audit: needle whole law = 1, scoped (231 chars) = 1; SHA/revision match INVENTORY. |
| D | PASS — verbatim-unique needle, correct revision, no blocking transcription defect. |
| C | 附則 has no duplicate. Only the case condition is modelled, not application requirements or certificate contents. |
| U | 前項's requirements and certificate substance need their own units. Human legal review `LEGAL_REVIEW_PENDING`. |

## Model and proof

- Impl: `DividedCertificateIssuance.lean` — `asDividedCert : Nat → Nat | 0 => 1 | n+1 => n+1`, with three boundary theorems and universal `idempotent`.
- Independent spec: `DividedCertificateIssuanceSpec.lean` — `specAsDividedCert c := if c = 0 then 1 else c`, no implementation definitions reused.
- Universal kernel proof: `agree_as_divided_cert (c : Nat)` — `cases c <;> rfl`; axiom-free (no `omega`, no `simp`, no `Classical.choice`).
- Tests: 9 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

Not modelled: 前項's requirements, certificate contents, other articles. Human legal review remains `LEGAL_REVIEW_PENDING`.
