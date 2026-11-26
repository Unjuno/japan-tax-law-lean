# Unit review — 沖縄地方税課税免除省令 art.1(2)（自由貿易地域等の準用 / READING）

Normative unit id: `NORM|1ee9f2af617374e26dd0513f322c71bdc1a5653d81fff74fdeadb269b5bb8666`
Law: `404M50000008008`, revision `404M50000008008_20020301_414M60000008019` (`CurrentEnforced`).
Source: `data/raw/404M50000008008_20020301_414M60000008019.law.json`
SHA-256 (CRLF→LF): `e58f465000e279a93381009c49a142caf7c7663ff3e6ce538ca86f709d5b57f5`
Provision: `LawBody[2]/MainProvision/MainProvision[0]/Article:1/Article#1/Paragraph#2/ParagraphSentence/Sentence#1`

Verbatim (READING): 「前項の規定は、自由貿易地域及び特別自由貿易地域について準用する。」

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | 前項 applies mutatis mutandis to 自由貿易地域 and 特別自由貿易地域. Region codes 0 and 1 → listed code 1; others → 0. Numerals are region tags, not amounts. |
| T | Pin + `transcription_audit.py` needle scoped to `第一条`. Independent audit: needle whole law = 1, scoped (910 chars) = 1; SHA/revision match INVENTORY. |
| D | PASS — verbatim-unique needle, correct revision, no blocking transcription defect. |
| C | 附則 has no duplicate. Only the region selection is modelled, not 前項's substance. |
| U | 前項's content and tax exemption need their own units. Human legal review `LEGAL_REVIEW_PENDING`. |

## Model and proof

- Impl: `FreeTradeZoneReading.lean` — `asListedZone : Nat → Nat | 0 => 1 | 1 => 1 | succ(succ _) => 0`, with three boundary theorems.
- Independent spec: `FreeTradeZoneReadingSpec.lean` — `specAsListedZone k := if k = 0 || k = 1 then 1 else 0`, no implementation definitions reused.
- Universal kernel proof: `agree_as_listed_zone (k : Nat)` — nested `cases` + `decide`/`rfl`; axiom-free (no `omega`, no `simp`, no `Classical.choice`).
- Tests: 9 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

Not modelled: 前項's content, tax exemption, other articles. Human legal review remains `LEGAL_REVIEW_PENDING`.
