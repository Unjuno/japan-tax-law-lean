# Adversarial review — 租税特別措置法 art. 40の4(3) 推定

Unit: `NORM|aa4f3f14e89453a655123308fabc4e12a2dc360836eecd7bfb35ff829538c7ce`
Verbatim: 「当該書類その他の資料の提示又は提出がないときは、…当該外国関係会社は
同号イ（１）から（５）までに該当しないものと推定する。」

- **H**: the presumption could be modelled as applying when documents ARE
  submitted, or as an irreversible proof rather than a rebuttable presumption.
- **T**: re-extract art. 40の4(3); confirm verbatim; inspect
  `presumeNotApplicable` (negation of caller-established submission Bool);
  exhaustively check both values; `#print axioms`; phrase-only source audit.
- **D**: verbatim located; `phrase_only_correspondence=true` stated; all three
  theorems axiom-free. The model is one-way (absence → presumed non-
  applicability) and does NOT assert the converse or classify the categories
  (１)–(５). Whether the presumption is rebuttable is a legal question left to
  human review, not silently encoded.
- **C**: a reading that treats the presumption as conclusive is a competing
  interpretation; recorded rather than suppressed.
- **U**: document submission fact and evidentiary weight are caller-established;
  human legal review pending.
