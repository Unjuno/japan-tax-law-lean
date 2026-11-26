# Unit review — 自家用自動車一時輸入特例法 art.12（五万円以下の罰金）

Normative unit id: `NORM|ae8b530680be9ae5d40132a633d74e5344942744ac431625de51d3ac6196dbd1`

Law: 339AC0000000101 (自家用自動車の一時輸入に関する通関条約の実施に伴う関税法等の特例に関する法律), Act, revision
`339AC0000000101_20010106_411AC0000000160`, snapshot
`data/raw/339AC0000000101_20010106_411AC0000000160.law.json`, sha256
`dd2cb1411a27157f3e8d2fa8bb639a742839672b31d61f9d99916092ee7013b7`.

Verbatim source text: 「第九条第一項の規定による報告をせず、若しくは虚偽の報告をし、又は同項の規定による検査を拒み、妨げ、若しくは忌避した者は、五万円以下の罰金に処する。」 (verbatim-unique).
Kind: **REFERENCE** — the fine ceiling for the stated offence is 50,000 yen.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | Non-reporting, false reporting, or obstruction of inspection under art.9(1) is punishable by a fine of at most 50,000 yen. |
| T (reproduction) | Durable pin `data/TRANSCRIPTION_PINS/CustomsReportPenaltyCeiling50k.json`: law 339AC0000000101, article 第十二条, verbatim needle unique. Generator checks pass; `spec_literals = {50000}` verified against 原文 (五万 = 50000). |
| D (decision) | PASS — needle located uniquely in scoped Article 第十二条; the 以下 ceiling is inclusive. |
| C (competing interpretation) | Reading 以下 as strict `<` would reject exactly 50,000 yen; `fifty_thousand_inclusive` rejects that. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. 第九条第一項's duty, offence elements, alternative sanctions and other paragraphs require human legal review (`LEGAL_REVIEW_PENDING`). |

## Model and proof scope

- Impl: `fineYenCap=50000`, `withinFineCeiling y := decide (y <= 50000)`.
- Independent spec: own constant and `specWithinFine` predicate using only spec-local names; universal `agree_fine_ceiling` by definitional rfl, axiom-free.
- Boundary examples: 50000 inclusive, 50001 rejected, 1 and 0 included.
- Tests: 10 kernel-decided examples; 5 boundary categories.

## Not modelled

第九条第一項's duty, offence elements, alternative sanctions, other paragraphs
and enforcement rules. This is a computable slice of one numeric ceiling.

## Adversarial review

See `docs/adversarial/reviews-customs-report-penalty-50k.md` (H/T/D/C/U per check).
No legal correctness claimed; human legal review pending.
