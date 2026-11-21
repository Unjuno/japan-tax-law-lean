# Unit review — 酒税法 附則第八条(3)1（税額 十万円以下 → 二月 保存期間）

Normative unit id: `NORM|bc51dc849add02245a14da178b3e8f3c6bbe070e2bd6da1783e7593c20b8c4cb`

Law: 328AC0000000006 (酒税法), law number 昭和二十八年法律第六号,
law_type Act (法律), revision `328AC0000000006_20260525_506AC0000000052` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/328AC0000000006_20260525_506AC0000000052.law.json`,
sha256 `01d87149a80f64fa70d8b6eafffead6341982d902c4d206630cbc3f91c781e70`.

Verbatim source text: 「その税額が十万円以下のとき。　二月」 (十万円 = ¥100,000 inclusive; 二月 = 2-month retention; full-width space U+3000 preserved).

Exact source position:
`LawBody[16]/SupplProvision/SupplProvision[5]/Article:8/Article#8/Paragraph#3/Item#1/ItemSentence/Sentence#1` — 附則 Article 第八条, caption （手持品課税）. This is a 附則 (supplementary) provision: `find_article_text(...,"第八条")` returns the MainProvision article (without the needle), so the audit uses a FILE-KIND transcription locator (verbatim needle unique in whole law).

Norm kind: **CONDITION** — a 2D norm: tax amount ≤ ¥100,000 (十万円以下, inclusive) maps to a 2-month retention period (二月). Both values derived programmatically from the verbatim needle.

Byte fidelity: all statutory Japanese strings (title, law number, article caption, verbatim quote incl. full-width space, numeric values) injected programmatically from authoritative sources; descriptive prose hand-written but byte-verified. Byte-fidelity confirmed (`quote equal: True`, U+6EDE=0).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | Tax amount ≤ ¥100,000 maps to a 2-month retention period. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` file-kind check 「tax <= 100k yen -> 2 month retention…↔ CustomsTaxRetentionPeriodTier1.lean」. Full audit: 257/257 checks passed. |
| D (decision) | PASS — audit reports `257/257 checks passed`. |
| C (competing interpretation) | Only this tier's numeric ceiling and period are modeled. The other tiers, retention procedure, rest of the 附則 and other articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/CustomsTaxRetentionPeriodTier1.lean` — `taxAmountCeilingYen=100_000`, `retentionMonths=2` (both programmatically derived); `withinTier tax := tax ≤ ceiling`.
- Independent spec: successor-strict `tax < Nat.succ ceiling`; `agree_within_tier` universal & axiom-free.
- Boundary checks: ¥100,000 qualifies; ¥100,001 fails; period decodes to 2.
- Build: `lake build` → full build success (821 jobs); 4 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Other tiers, retention procedure, rest of the 附則 and other articles. Computable slice of one CONDITION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TAX_RETENTION_TIER1.md`.
