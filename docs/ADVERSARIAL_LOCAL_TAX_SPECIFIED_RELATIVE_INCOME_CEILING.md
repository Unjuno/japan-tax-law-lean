# Independent adversarial review — 地方税法施行規則 第二条の三の五(3)2（特定親族 合計所得金額 八十五万円以下）

Reviewer: an independent agent session (no shared working context with the
author). Temp scripts written and deleted; no repository file modified by the
reviewer; `lake build` not run by reviewer.

## Verdict: NO CONCRETE FINDINGS. All independent checks pass.

| Check | H (refutable hypothesis) | T (reproduction) | D (decision) |
|---|---|---|---|
| hash | sha256 fabricated | independent `hashlib.sha256(raw.read_bytes())` | **PASS** — `5ffb833b…217e`, 4,187,088 B; matches INVENTORY |
| needle / byte fidelity | not verbatim / not unique | byte compare queue vs Lean quote (`:22`) vs audit `\u` literal (`:1311`) vs raw; structural walk | **PASS** — whole-law count 1; `Article#2_3_5` / ArticleTitle 第二条の三の五 / ArticleCaption （公的年金等受給者の扶養親族等申告書の提出方法） / Paragraph#3 / Item#2 / Column#2 / Sentence#1; **historical kana であつて uses full-size つ (U+3064), modern っ (U+3063) occurs 0 times** — all three artifacts byte-identical; 八十五万円=850,000; 特定親族/合計所得金額/退職手当等/氏名 correct |
| law identity | false law type | INVENTORY + raw `revision_info` | **PASS** — MinisterialOrdinance (省令), NOT an Act; 地方税法施行規則, 昭和二十九年総理府令第二十三号; real current revision |
| locator | article-kind locator false | called `find_article_text("329M50000002023","第二条の三の五")` | **PASS** — len 852, needle present |
| Lean internals | spec circular / unsound / banned tokens | read 3 files + `TaxFinance.lean` (`Money := Nat:29`); code-only token scan | **PASS** — `specWithinIncomeRequirement` successor-strict form distinct from `≤`; `agree_income_requirement` universal & axiom-free via core Nat lemmas; 0 forbidden tokens in code; boundaries 850,000 true / 850,001 false (`by decide`); spec comment `八十五万円 (850,000)` correct (no stale `八十五円` typo) |
| interpretations | lower bound / scope / kind / labels / Nat | read source + files | **PASS** all — upper-bound-only faithful (no lower bound in needle); scope honestly disclosed; kind CONDITION appropriate; labels correct; Nat lemmas sound |

## C / U (non-findings)

- **U-1 (path notation):** source-path bracket indices `LawBody[2]/MainProvision/MainProvision[41]` not reproducible by a naive 0-based child walk (reviewer observed different indices under `law_full_text`). Non-falsifiable path-notation detail; substantive structural locator (Article/Paragraph/Item/Column) independently verified correct. Not a finding.
- **U-2 (prompt prose):** review prompt rendered `であって`; authoritative source uses `であつて` (U+3064). Implementation follows the authoritative source. Not a finding against the files.

## Closing

No concrete findings; no fixes required. No claim of legal correctness; human legal review remains `LEGAL_REVIEW_PENDING`.
