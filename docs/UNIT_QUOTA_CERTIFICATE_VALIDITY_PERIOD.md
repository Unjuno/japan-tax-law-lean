# Unit review — 経済連携協定関税割当政令 art.2(8)（有効期間は年度末まで）

Normative unit id: `NORM|36a080d669275921c8cb3c9b8a5d85a2c8f97b10481942b0fdb7c70cc8f32e9d`

Law: 417CO0000000035 (経済連携協定に基づく関税割当制度に関する政令), CabinetOrder, revision
`417CO0000000035_20220401_504CO0000000135`, snapshot
`data/raw/417CO0000000035_20220401_504CO0000000135.law.json`, sha256
`76ee2e11aa8228af4e9245d60ab76236e5a7aaf3949d9b3c720402db64bb5f3a`.

Verbatim source text: 「関税割当証明書の有効期間は、その交付の日からその日の属する年度の末日までとする。」 (verbatim-unique).
Kind: **EFFECT** — certificate validity ends at the fiscal-year end day (inclusive).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The certificate remains valid from issuance through the end of the fiscal year containing the issuance day. |
| T (reproduction) | Durable pin `data/TRANSCRIPTION_PINS/QuotaCertificateValidityPeriod.json`: law 417CO0000000035, article 第二条, verbatim needle unique. Generator checks pass. The source contains no numeral, so `spec_literals` is empty; no statutory numeric literal is claimed. |
| D (decision) | PASS — needle located uniquely in scoped Article 第二条/Paragraph 8; the まで cutoff is modelled as an inclusive upper bound. |
| C (competing interpretation) | Reading まで as exclusive would reject the end day; `end_day_inclusive` example rejects that. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Fiscal-year determination, calendar conversion and renewal require human legal review (`LEGAL_REVIEW_PENDING`). |

## Model and proof scope

- Impl: `withinValidity day endDay := decide (day <= endDay)`.
- Independent spec: successor-shifted `specWithinValidity day endDay := decide (succ day <= succ endDay)`; universal `agree_validity_cutoff` by definitional rfl, axiom-free.
- Boundary examples: end day inclusive; day after end excluded; issuance day included.
- Tests: 8 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

## Not modelled

Fiscal-year determination, calendar conversion, renewal and other paragraphs.

## Adversarial review

See `docs/adversarial/reviews-quota-certificate-validity-period.md` (H/T/D/C/U per check).
No legal correctness claimed; human legal review pending.
