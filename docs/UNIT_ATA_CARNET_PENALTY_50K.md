# Unit review — ＡＴＡ条約実施関税法特例法 art.9（五万円以下の罰金）

Normative unit id: `NORM|2a6d4f53c8db4d374ec47bd6eb2f3097ac890e459a92493f22f6ea01ab0f59c6`

Law: 348AC0000000070 (物品の一時輸入のための通関手帳に関する通関条約（ＡＴＡ条約）の実施に伴う関税法等の特例に関する法律), Act, revision
`348AC0000000070_20060301_417AC0000000022`, snapshot
`data/raw/348AC0000000070_20060301_417AC0000000022.law.json`, sha256
`c4404e5fcc5420a1f79ab8e8975fbabfe2d4a781cf754990381a2f5c1da887cb`.

Verbatim source text: 「第七条第一項の規定による報告をせず、若しくは虚偽の報告をし、又は同項の規定による検査を拒み、妨げ、若しくは忌避した者は、五万円以下の罰金に処する。」 (verbatim-unique).
Kind: **REFERENCE** — the fine ceiling for the stated offence is 50,000 yen.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | Non-reporting, false reporting, or obstruction of inspection under art.7(1) is punishable by a fine of at most 50,000 yen. |
| T (reproduction) | Durable pin `data/TRANSCRIPTION_PINS/AtaCarnetReportPenaltyCeiling50k.json`: law 348AC0000000070, article 第九条, verbatim needle unique. `spec_literals = {50000}` verified against 原文 (五万 = 50000). |
| D (decision) | PASS — needle located uniquely in scoped Article 第九条; the 以下 ceiling is inclusive. |
| C (competing interpretation) | Reading 以下 as strict `<` would reject exactly 50,000 yen; `fifty_thousand_inclusive` rejects that. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. 第七条第一項's duty, offence elements, alternative sanctions and other paragraphs require human legal review (`LEGAL_REVIEW_PENDING`). |

## Model and proof scope

- Impl: `fineYenCap=50000`, `withinFineCeiling y := decide (y <= 50000)`.
- Independent spec: own constant and `specWithinFine` predicate using only spec-local names; universal `agree_fine_ceiling` by definitional rfl, axiom-free.
- Boundary examples: 50000 inclusive, 50001 rejected, 1 and 0 included.
- Tests: 10 kernel-decided examples; 5 boundary categories.

## Not modelled

第七条第一項's duty, offence elements, alternative sanctions, other paragraphs
and enforcement rules. This is a computable slice of one numeric ceiling.

## Adversarial review

See `docs/adversarial/reviews-ata-carnet-penalty-50k.md` (H/T/D/C/U per check).
No legal correctness claimed; human legal review pending.
