# Unit review — 酒税法 附則第三十八条(1)（清酒に関する特例: アルコール分 十五度以上十六度未満 → 五十七万六百円）

Normative unit id: `NORM|20df6a4420603ab9709d60a910136e38180bd27752be45e45997a943ffa1f7c2`

Law: 328AC0000000006 (酒税法, Liquor Tax Act), law number 昭和二十八年法律第六号,
law_type Act (法律), revision `328AC0000000006_20260525_506AC0000000052` (from INVENTORY
`current_revision.law_revision_id`, matched raw), snapshot
`data/raw/328AC0000000006_20260525_506AC0000000052.law.json`,
sha256 `01d87149a80f64fa70d8b6eafffead6341982d902c4d206630cbc3f91c781e70`.

Verbatim source text: 「アルコール分が十五度以上十六度未満のもの　五十七万六百円」 (full-width space U+3000 between もの and 五十七万).

Exact source position:
`LawBody[27]/SupplProvision/SupplProvision[3]/Article:38/Article#38/Paragraph#1/ParagraphSentence/Sentence#2/QuoteStruct/List/ListSentence/Column#2/Sentence#1` — **附則** Article 第三十八条, caption （清酒に関する特例）. `find_article_text(...,"第三十八条")` returns None (MainProvision only) → **file-kind transcription locator** used (needle verbatim-unique in whole law).

Norm kind: **CONDITION** — a transitional sake-tax rate-table row: alcohol content [15°, 16°) (十五度以上 = ≥15 inclusive; 十六度未満 = <16 exclusive), paired amount ¥570,600.

Byte fidelity: authoritative CJK strings injected programmatically from INVENTORY/queue; byte-fidelity confirmed (`quote equal: True`, title/lawnum present, U+6EDE=0, U+3000 preserved).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The bracket is 15 ≤ alcohol degrees < 16, with paired amount ¥570,600. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` file-kind check 「酒税法 附則第三十八条(1) sake alcohol bracket 15-16deg 570600円…↔ LiquorTaxSakeAlcoholBracket15_16.lean」. Full audit: 225/225 checks passed. |
| D (decision) | PASS — audit reports `225/225 checks passed`. |
| C (competing interpretation) | Only this bracket + amount are modeled. Transition period, new/old law comparison, 特級/二級 classes, other rate rows and other articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/LiquorTaxSakeAlcoholBracket15_16.lean` — `alcoholLowerInclusiveDegrees=15`, `alcoholUpperExclusiveDegrees=16`, `taxAmountYen=570_600`, `inBracket degrees := 15 ≤ degrees ∧ degrees < 16`.
- Independent spec: `specInBracket degrees := ¬ degrees < 15 ∧ ¬ 16 ≤ degrees` (negation/complement form, distinct); `agree_in_bracket` universal over all degrees, axiom-free.
- Boundary theorems: `at_lower` (15° qualifies), `at_upper` (16° fails), `amount_decoded` (¥570,600).
- Build: `lake build` → full build success (725 jobs); all 4 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Transition period, new/old 酒税法 comparison, other classes (特級/二級), other bracket rows and other articles. Fractional degrees (Nat domain) not representable. Computable slice of one CONDITION norm unit in a 附則 transitional provision, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_LIQUOR_TAX_SAKE_BRACKET_15_16.md`.
