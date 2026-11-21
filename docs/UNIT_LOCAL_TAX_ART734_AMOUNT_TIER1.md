# Unit review — 地方税法 第七百三十四条(3)（条件付き二金額: ¥120,000 / ¥140,000）

Normative unit id: `NORM|41efee8e91f1bcde685ed332b7b7d8e7b2d82fa083062d8f7d0a45e5503c57c7`

Law: 325AC0000000226 (地方税法), law number 昭和二十五年法律第二百二十六号,
law_type Act (法律), revision `325AC0000000226_20261101_508AC0000000002` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
sha256 `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.

Verbatim source text: 「十二万円（事務所等が特別区の区域外にも所在する場合以外の場合には、十四万円）」 (base ¥120,000; alternative ¥140,000 in the 「以外の場合」).

Exact source position:
`LawBody[2]/MainProvision/MainProvision[4]/Article:734/Article#734/Paragraph#3/TableStruct/Table/TableRow/TableColumn/Sentence#1` — MainProvision Article 第七百三十四条, caption （都における普通税の特例）. `find_article_text(...,"第七百三十四条")` returns that article (len 2046) containing the needle → article-kind locator used.

Norm kind: **CONDITION** — a conditional dual amount: base ¥120,000 (十二万円), alternative ¥140,000 (十四万円) in the case other than an office also located outside the special wards. Both amounts derived programmatically from the verbatim needle; the location condition itself is NOT MODELLED.

Byte fidelity: all statutory Japanese strings (title, law number, article caption, verbatim quote, numeric amounts) injected programmatically from authoritative sources. A hand-typed gloss error (事業所等 vs authoritative 事務所等) was found and fixed; descriptive prose otherwise hand-written but byte-verified. Byte-fidelity confirmed (`quote equal: True`, U+6EDE=0).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | Two alternative amounts: base ¥120,000, alternative ¥140,000 (larger). |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「local tax art.734 dual amount 120k/140k yen…↔ LocalTaxArt734AmountTier1.lean」. Full audit: 275/275 checks passed. |
| D (decision) | PASS — audit reports `275/275 checks passed`. |
| C (competing interpretation) | Only the two amounts + alternative relationship are modeled. The office-location condition, tax base, other table rows and other articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/LocalTaxArt734AmountTier1.lean` — `baseAmountYen=120_000`, `alternativeAmountYen=140_000` (both programmatically derived); `alternative_gt_base`.
- Independent spec: `specDifferenceYen=20_000` with `agree_amount_difference` (alternative = base + difference), distinct decomposition claim; axiom-free.
- Build: `lake build` → full build success (875 jobs); 2 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Office-location condition, tax base, other table rows, other paragraphs and other articles. Computable slice of one CONDITION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_LOCAL_TAX_ART734_AMOUNT_TIER1.md`.
