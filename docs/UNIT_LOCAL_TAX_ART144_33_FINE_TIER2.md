# Unit review — 地方税法 第百四十四条の三十三(6)2（罰金 二億円以下 = ¥200,000,000）

Normative unit id: `NORM|64559fa702dfa55d1f28f910d47073c08c936b71fda9e0ef6b3d5695e66e741b`

Law: 325AC0000000226 (地方税法), law number 昭和二十五年法律第二百二十六号,
law_type Act (法律), revision `325AC0000000226_20261101_508AC0000000002` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
sha256 `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.

Verbatim source text: 「二億円以下の罰金刑」 (二億 = 2×10⁸ = ¥200,000,000, NOT 二千万).

Exact source position:
`LawBody[2]/MainProvision/MainProvision[1]/Article:144_33/Article#144_33/Paragraph#6/Item#2/ItemSentence/Column#2/Sentence#1` — MainProvision Article 第百四十四条の三十三, caption （製造等の承認を受ける義務等に関する罪）. `find_article_text(...,"第百四十四条の三十三")` returns that article (len 928) containing the needle → article-kind locator used. This is the ITEM 2 fine tier (sibling to item 1 三億円 = a separate unit).

Norm kind: **CONDITION** — fine ceiling ≤ ¥200,000,000 (二億円以下, inclusive), derived programmatically from the verbatim kanji numeral.

Byte fidelity: all statutory Japanese strings (title, law number, article caption, verbatim quote, numeric ceiling) injected programmatically from authoritative sources; descriptive prose hand-written but byte-verified. Byte-fidelity confirmed (`quote equal: True`, U+6EDE=0).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The fine ceiling is ¥200,000,000 (二億円以下, inclusive). |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「fine ceiling 200M yen…↔ LocalTaxArt144_33FineTier2.lean」. Full audit: 245/245 checks passed. |
| D (decision) | PASS — audit reports `245/245 checks passed`. |
| C (competing interpretation) | Only this fine ceiling is modeled. The offense conditions, other fine tiers (items 1/3), other paragraphs and articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/LocalTaxArt144_33FineTier2.lean` — `maxFineYen=200_000_000` (programmatically derived); `withinFineLimit fine := fine ≤ maxFineYen`.
- Independent spec: successor-strict `fine < Nat.succ maxFineYen`; `agree_fine_limit` universal & axiom-free.
- Boundary checks: ¥200,000,000 qualifies; ¥200,000,001 fails.
- Build: `lake build` → full build success (785 jobs); 3 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Offense conditions, other fine tiers, other paragraphs and articles. Computable slice of one CONDITION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_LOCAL_TAX_ART144_33_FINE_TIER2.md`.
