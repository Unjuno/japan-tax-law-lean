# Unit review — 緊急関税等政令 art.4(9)（証言への準用範囲 / READING）

Normative unit id: `NORM|4c66461b6da05db32699c67a5c83ace8dccab229a4875abc3563bcd8458ee246`
Law: `406CO0000000417`, revision `406CO0000000417_20090401_421CO0000000110` (`CurrentEnforced`).
Source: `data/raw/406CO0000000417_20090401_421CO0000000110.law.json`
SHA-256 (CRLF→LF): `e58c5ee4bf320859ac79716cdd9eb520a5ca073ee6153a0b2f6d15a92ab2bf67`
Provision: `LawBody[2]/MainProvision/MainProvision[3]/Article:4/Article#4/Paragraph#9/ParagraphSentence/Sentence`

Verbatim (READING): 「第四項から前項までの規定は、第一項前段又は第二項前段の規定によりされた証言について準用する。」

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | The rules in paragraphs 4 through the preceding one apply to testimony given under 第一項前段 or 第二項前段. `paragraph : Nat`, true iff 1 or 2. Numerals are paragraph labels, not amounts. |
| T | Pin + `transcription_audit.py` needle scoped to `第四条`. Independent audit: needle whole law = 1, scoped (1584 chars) = 1; 二=2 verified in clause; SHA/revision match INVENTORY. |
| D | PASS — verbatim-unique needle, both spec literals located, correct revision, no blocking transcription defect. |
| C | 附則 has no duplicate. Only the paragraph selection is modelled, not the applied rules' content. |
| U | Content of paragraphs 4…前項 and the testimony need their own units. Human legal review `LEGAL_REVIEW_PENDING`. |

## Model and proof

- Impl: `TestimonyParagraphReading.lean` — `appliesToTestimony : Nat → Bool` structural match (1/2 → true, others → false), with three boundary theorems.
- Independent spec: `TestimonyParagraphReadingSpec.lean` — `specAppliesToTestimony p := decide (p = 1 ∨ p = 2)`, no implementation definitions reused.
- Universal kernel proof: `agree_applies_to_testimony (p : Nat)` — nested `cases` + `decide`/`rfl`; axiom-free (no `omega`, no `simp`, no `Classical.choice`).
- Tests: 9 kernel-decided examples; boundary categories `{zero, small_input, threshold_below, threshold_at, threshold_above, saturation}`.

Not modelled: applied rules' content, testimony, other articles. Human legal review remains `LEGAL_REVIEW_PENDING`.
