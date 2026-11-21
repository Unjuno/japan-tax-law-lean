# Unit review — 地方税法 第百四十四条の三十三(6)1（罰金 三億円以下 = ¥300,000,000）

Normative unit id: `NORM|042d10f4f42521d77cc2888f4ef79647deb304ffc5dbcb5e0f0a2440c4d35ce1`

Law: 325AC0000000226 (地方税法), law number 昭和二十五年法律第二百二十六号,
law_type Act (法律), revision `325AC0000000226_20261101_508AC0000000002` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
sha256 `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.

Verbatim source text: 「三億円以下の罰金刑」 (三億 = 3×10⁸ = ¥300,000,000, NOT 三百万).

Exact source position:
`LawBody[2]/MainProvision/MainProvision[1]/Article:144_33/Article#144_33/Paragraph#6/Item#1/ItemSentence/Column#2/Sentence#1` — MainProvision Article 第百四十四条の三十三, caption （製造等の承認を受ける義務等に関する罪）. `find_article_text(...,"第百四十四条の三十三")` returns that article (len 928) containing the needle → article-kind locator used.

Norm kind: **CONDITION** — fine ceiling ≤ ¥300,000,000 (三億円以下, inclusive), derived programmatically from the verbatim kanji numeral.

Byte fidelity: all statutory Japanese strings (title, law number, article caption, verbatim quote, numeric ceiling) injected programmatically from authoritative sources; descriptive prose hand-written but byte-verified. Byte-fidelity confirmed (`quote equal: True`, U+6EDE=0).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The fine ceiling is ¥300,000,000 (三億円以下, inclusive). |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「fine ceiling 300M yen…↔ LocalTaxArt144_33FineTier1.lean」. Full audit: 244/244 checks passed. |
| D (decision) | PASS — audit reports `244/244 checks passed`. |
| C (competing interpretation) | Only this fine ceiling is modeled. The offense conditions, other fine tiers (items 2/3), other paragraphs and articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/LocalTaxArt144_33FineTier1.lean` — `maxFineYen=300_000_000` (programmatically derived); `withinFineLimit fine := fine ≤ maxFineYen`.
- Independent spec: successor-strict `fine < Nat.succ maxFineYen`; `agree_fine_limit` universal & axiom-free.
- Boundary checks: ¥300,000,000 qualifies; ¥300,000,001 fails.
- Build: `lake build` → full build success (782 jobs); 3 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Offense conditions, other fine tiers, other paragraphs and articles. Computable slice of one CONDITION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_LOCAL_TAX_ART144_33_FINE_TIER1.md`.
