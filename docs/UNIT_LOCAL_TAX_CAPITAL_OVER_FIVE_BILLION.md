# Unit review — 地方税法 第五十二条(1)五（資本金 五十億円超 — STRICT > ¥5B, no upper bound）

Normative unit id: `NORM|7ad4bd2c2491460ddfddc4cf486a3f14e5d327ee265c5435e097fb7417198ff4`

Law: 325AC0000000226 (地方税法), law number 昭和二十五年法律第二百二十六号,
law_type Act (法律), revision `325AC0000000226_20261101_508AC0000000002` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
sha256 `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.

Verbatim source text: 「五　資本金等の額を有する法人で資本金等の額が五十億円を超えるもの」 (leading 五 + full-width space U+3000 preserved).

Exact source position:
`LawBody[2]/MainProvision/MainProvision[1]/Article:52/Article#52/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1` — MainProvision Article 第五十二条, caption （法人の均等割の税率）. `find_article_text(...,"第五十二条")` returns that article (len 1808) containing the needle → article-kind locator used.

Norm kind: **CONDITION** — a **lower-bound-only strict** condition: corporation capital 資本金等の額 strictly exceeds ¥5,000,000,000 (五十億円を超える = strict >, boundary excluded, NO upper bound). The ¥5B threshold derived programmatically from the verbatim needle.

Byte fidelity: all statutory Japanese strings (title, law number, article caption, verbatim quote, numeric threshold) injected programmatically from authoritative sources; descriptive prose hand-written but byte-verified. Byte-fidelity confirmed (`quote equal: True`, U+6EDE=0).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | A corporation qualifies iff its capital strictly exceeds ¥5,000,000,000 (no upper bound). |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「capital strictly over 5 billion yen…↔ LocalTaxCapitalOverFiveBillion.lean」. Full audit: 241/241 checks passed. |
| D (decision) | PASS — audit reports `241/241 checks passed`. |
| C (competing interpretation) | Only the lower-bound strict condition is modeled. Other categories (二/三/四), tax computation, other paragraphs and articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/LocalTaxCapitalOverFiveBillion.lean` — `capitalThresholdYen=5_000_000_000` (programmatically derived); `exceedsCapitalThreshold capital := capitalThresholdYen < capital` (strict).
- Independent spec: `specExceedsCapitalThreshold capital := ¬ capital ≤ capitalThresholdYen` (not-≤ form, distinct); `agree_exceeds_capital` universal & axiom-free (`Nat.not_le.symm`).
- Boundary checks: ¥5,000,000,000 fails (strict), ¥5,000,000,001 qualifies.
- Build: `lake build` → full build success (773 jobs); 3 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Other categories (二/三/四), tax computation, other paragraphs and articles. Computable slice of one CONDITION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_LOCAL_TAX_CAPITAL_OVER_FIVE_BILLION.md`.
