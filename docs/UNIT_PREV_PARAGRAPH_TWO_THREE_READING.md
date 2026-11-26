# Unit review — 米軍地位協定臨時特例法施行令 art.3_2(2)（前条二・三項準用 / READING）

Normative unit id: `NORM|f5c77990c05347b811f25f06e69bdcd06f55b998c0de9751f675c666e042ab9d`
Law: `327CO0000000124`, revision `327CO0000000124_20220401_502CO0000000207` (`CurrentEnforced`).
Source: `data/raw/327CO0000000124_20220401_502CO0000000207.law.json`
SHA-256 (CRLF→LF): `d223acc4d7e839ca560c81508af1b1b888e0d7e7e1f58303a86a17e6ce17e2ea`
Provision: `LawBody[2]/MainProvision/MainProvision[4]/Article:3_2/Article#3_2/Paragraph#2/ParagraphSentence/Sentence#1`

Verbatim (READING): 「前条第二項及び第三項の規定は、前項の課税石油ガスについて準用する。」

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | 「第二項及び第三項」selects exactly paragraphs 2 and 3 of the preceding article for 準用. `paragraph : Nat`, true iff 2 or 3. Numerals are paragraph labels, not amounts. |
| T | Pin + `transcription_audit.py` needle scoped to `第三条の二`. Independent audit: needle whole law = 1, scoped (212 chars) = 1; 二=2 and 三=3 verified in clause. |
| D | PASS — verbatim-unique needle, SHA/revision match, both spec literals found in clause, no blocking transcription defect. |
| C | 附則 has no duplicate. Only the paragraph selection is modelled, not the applied provisions. |
| U | Content of paragraphs 2/3 and 課税石油ガス identity need their own units. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof

- Impl: `PrevParagraphTwoThreeReading.lean` — `appliesTo p := decide (p = 2 ∨ p = 3)`; boundary theorems by `decide`.
- Independent spec: `PrevParagraphTwoThreeReadingSpec.lean` — `specAppliesTo p := decide ((¬ p < 2 ∧ ¬ 2 < p) ∨ (¬ p < 3 ∧ ¬ 3 < p))`, no impl definitions reused.
- Universal kernel proof: `agree_applies_to (p : Nat)` for every Nat (`by_cases` + `omega` + `simp`).
- Tests: 14 kernel-decided examples; boundary categories `{zero, small_input, threshold_below, threshold_at, threshold_above, saturation}`.

Not modelled: content of the applied paragraphs, 課税石油ガス identity, tax computation, other articles. Human legal review remains `LEGAL_REVIEW_PENDING`.
