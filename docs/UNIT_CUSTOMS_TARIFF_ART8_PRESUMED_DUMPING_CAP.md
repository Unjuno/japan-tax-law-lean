# Unit review — 関税定率法 第八条(9)（不当廉売関税）PRESUMPTION

Normative unit id: `NORM|5cdae38077e32d914408ab1b404758a66e06527b3356598d85111dc8f185a9a5`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号,
law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`,
sha256 `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`.

Verbatim source text: 「当該貨物の正常価格と推定される価格と不当廉売価格と推定される価格との差額に相当する額と同額以下の暫定的な関税を課すること。」 — a provisional duty (暫定的な関税) capped at
同額以下 the 差額に相当する額 between 正常価格と推定される価格 and
不当廉売価格と推定される価格.

Exact source position:
`LawBody[1]/MainProvision/MainProvision[17]/Article:8/Article#8/Paragraph#9/Item#1/ItemSentence/Sentence#1` — MainProvision Article 第八条, caption （不当廉売関税）. `find_article_text(...,"第八条")` returns that article (len 6919) containing the needle → article-kind locator used.

Norm kind: **PRESUMPTION** — the statute PRESUMES two prices (推定される価格):
the presumed normal price and presumed unfair-sale price. 「不当廉売」(dumping)
is selling below 正常価格. The computable slice models the two presumed prices,
their difference (dumping margin = normal − unfair, Nat saturating subtraction),
and the cap on the provisional duty (duty ≤ margin). How the presumed prices are
determined (investigation method), the 正常価格 definition, other items and
articles are NOT MODELLED. All statutory CJK injected structurally from the
needle/caption — no hand-typed statutory labels.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | For this Act: provisional duty ≤ (presumed normal − presumed unfair); additive form duty + unfair ≤ normal under unfair ≤ normal, else duty = 0. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「customs tariff art.8 presumed dumping duty cap…↔ CustomsTariffArt8PresumedDumpingCap.lean」. Full audit: 289/289 checks passed. |
| D (decision) | PASS — audit reports `289/289 checks passed`. |
| C (competing interpretation) | Only the cap relationship is modeled. Investigation method, 正常価格 definition, other items/paragraphs and articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/CustomsTariffArt8PresumedDumpingCap.lean` — `PresumedPrices` (normal/unfair Money=Nat, 円), `dumpingMargin = normal − unfair` (saturating), `withinCap p duty := duty ≤ dumpingMargin p`. Units/domain recorded (円, Nat).
- Independent spec: additive form `duty + unfair ≤ normal` under `unfair ≤ normal`, else `duty = 0`; `agree_within_cap` universal & axiom-free (`Nat.le_sub_iff_add_le` + branch), `margin_zero_when_no_dumping`.
- HAND-TYPED DEFECTS CORRECTED: `不当安売価格` (U+5B89 安) → authoritative `不当廉売価格` (U+5EC9 廉, matching caption 不当廉売関税); `一時的な関税` → authoritative `暫定的な関税` (U+66AB). Regenerated with all statutory terms structurally extracted from the needle — byte-fidelity reconfirmed (quote exact, U+5B89 count 0).
- Build: `lake build` → full build success (917 jobs); unit build 5 jobs; 2 theorems with only permitted `[propext]`; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Investigation method for presumed prices, 正常価格 definition, other items/paragraphs and articles. Computable slice of one PRESUMPTION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART8_PRESUMED_DUMPING_CAP.md`.
