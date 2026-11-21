# Unit review — 地方税法 第百五十四条(1)（貨物自動車 標準税率 加算公式）

Normative unit id: `NORM|cdd69708e364f7ffe3fc19e940a20601214602b741a034108754d57b296a45d0`

Law: 325AC0000000226 (地方税法), law number 昭和二十五年法律第二百二十六号,
law_type Act (法律), revision `325AC0000000226_20261101_508AC0000000002` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
sha256 `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.

Verbatim source text: 「四万五百円に最大積載量が八トンを超える部分一トンまでごとに六千三百円を加算した額」 — base 四万五百 (¥40,500) plus 六千三百 (¥6,300)
per started ton of the portion of 最大積載量 exceeding 八トン (8 tons).

Exact source position:
`LawBody[2]/MainProvision/MainProvision[1]/Article:154/Article#154/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1` — MainProvision Article 第百五十四条, caption （自動車税の標準税率）. `find_article_text(...,"第百五十四条")` returns that article (len 3565) containing the needle → article-kind locator used.

Norm kind: **CONDITION** — an amount *formula*: base ¥40,500 + ¥6,300 × ceil(excess_kg / 1000). Three constants (base 四万五百=40,500, threshold 八=8 tons, increment 六千三百=6,300) derived programmatically from the verbatim needle. NOTE: the author initially misread 四万五百 as 四万五千 (45,000, U+5343 千 vs U+767E 百); the programmatic kanji parser corrected this to 40,500 — a concrete demonstration of why statutory numerals must be derived from source, not hand-read.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The formula is 40,500 + 6,300 × ceil(max(0, loadKg − 8000)/1000); 「一トンまでごとに」 = round up fractional tons. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「local tax art.154 freight ton surcharge…↔ LocalTaxArt154FreightTonSurcharge.lean」. Full audit: 280/280 checks passed. |
| D (decision) | PASS — audit reports `280/280 checks passed`. |
| C (competing interpretation) | Only this amount formula cell is modeled. Fractional kilograms, 端数 handling outside this cell, other table cells, other paragraphs and articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/LocalTaxArt154FreightTonSurcharge.lean` — `baseFeeYen=40_500`, `thresholdKg=8_000`, `incrementYen=6_300`, `chargeableTons loadKg` (ceiling), `amountYen loadKg`. Units/domain (円, kg, Nat) recorded; 1 トン = 1000 kg is a standard metric unit fact, NOT a statutory constant.
- Independent spec: `specChargeableTons` uses alternative ceiling `(excess−1)/1000+1`, distinct from implementation's `(excess+999)/1000`; `ceil_div_identity` + `agree_chargeable_tons` universal, kernel-proved with only permitted `[propext]` (no `omega`/`Quot.sound`, no `sorryAx`/`Classical.choice`).
- Boundary checks: 8,000 kg → 0 tons → ¥40,500; 8,001 kg → 1 ton → ¥46,800; 9,000 kg → 1 ton → ¥46,800; 9,001 kg → 2 tons → ¥53,100.
- Build: `lake build` → full build success (890 jobs); 2 theorems with only `[propext]`; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Fractional kilograms, 端数 handling outside this cell, other table cells, other paragraphs and articles. Computable slice of one CONDITION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_LOCAL_TAX_ART154_FREIGHT_TON_SURCHARGE.md`.
