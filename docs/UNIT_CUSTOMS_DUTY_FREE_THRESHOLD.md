# Unit review — 関税暫定措置法施行令 第二十七条(1)2（課税価格の総額 20万円以下の物品 EXCEPTION）

Normative unit id: `NORM|47db57ba8db05d493e7e01968a4971d23ac9e1b03d347102d9459e0d272b05eb`

Law: 335CO0000000069 (関税暫定措置法施行令), law number 昭和三十五年政令第六十九号,
law_type **CabinetOrder (政令)**, revision `335CO0000000069_20260401_508CO0000000085` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/335CO0000000069_20260401_508CO0000000085.law.json`,
sha256 `b64be40dba650308d9f0ae478e89539b412c4f0a4fac981b6c770d3f1e1f121a`.

Verbatim source text: 「課税価格の総額が二十万円以下の物品（前号に掲げる物品に該当するものを除く。）」

Exact source position:
`LawBody[3]/MainProvision/MainProvision[4]/Article:27/Article#27/Paragraph#1/Item#2/ItemSentence/Sentence#1` — MainProvision Article 第二十七条, caption （原産地の証明）. `find_article_text(...,"第二十七条")` returns that article (len 780) containing the needle → article-kind locator used.

Norm kind: **EXCEPTION** — goods with total taxable price ≤ ¥200,000 (二十万円以下, inclusive), excluding goods of the preceding item (前号). The ¥200,000 ceiling was derived programmatically from the verbatim needle's kanji numeral.

Byte fidelity: all statutory Japanese strings (title, law number, article caption, verbatim quote, numeric constant) injected programmatically from authoritative sources; descriptive prose in the model is hand-written but byte-verified against authoritative sources. Byte-fidelity confirmed (`quote equal: True`, U+6EDE=0).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The duty-free threshold is ¥200,000 (二十万円以下, inclusive), for goods not in the preceding item. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「duty-free price ceiling 200k yen…↔ CustomsTemporaryMeasureDutyFreeThreshold.lean」. Full audit: 231/231 checks passed. |
| D (decision) | PASS — audit reports `231/231 checks passed`. |
| C (competing interpretation) | Only the ¥200,000 ceiling is modeled. The preceding-item exclusion, tax procedure, other items/paragraphs and other articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/CustomsTemporaryMeasureDutyFreeThreshold.lean` — `dutyFreePriceCeilingYen=200_000` (programmatically derived); `withinDutyFreeThreshold price := price ≤ ceiling`.
- Independent spec: `specWithinDutyFreeThreshold price := price < Nat.succ ceiling` (successor-strict, distinct); `agree_duty_free_threshold` universal & axiom-free.
- Boundary theorems: `at_ceiling` (¥200,000 qualifies), `above_ceiling` (¥200,001 fails).
- Build: `lake build` → full build success (743 jobs); 3 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Preceding-item exclusion, tax procedure, other items, other paragraphs and other articles. Computable slice of one EXCEPTION norm unit in a CabinetOrder, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_DUTY_FREE_THRESHOLD.md`.
