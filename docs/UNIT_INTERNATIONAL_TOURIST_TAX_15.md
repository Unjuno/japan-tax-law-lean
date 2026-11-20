# Unit review — 国際観光旅客税法 art. 15 (¥3,000 per departure from Japan)

Normative unit id: `NORM|4cd756c89d1d4861be56ba03c83c189d8981f13a9d09cd010124885ebe50d245`

Law: 430AC0000000016 (国際観光旅客税法), revision
`430AC0000000016_20260701_508AC0000000012`, enforcement 2026-07-01,
snapshot `data/raw/430AC0000000016_20260701_508AC0000000012.law.json`,
sha256 `486f27e35920bd186dd905d4a2269d01d9a4ecb28a2bb36514d7232276ead5ec`
(inventory records the same digest in upper case; comparison is case-insensitive).

Verbatim source text: 「国際観光旅客税の税率は、本邦からの出国一回につき、三千円とする。」

Exact source position (from the generated queue):
`LawBody[2]/MainProvision/MainProvision[1]/Article:15/Article#15/Paragraph#1/ParagraphSentence/Sentence#1`.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The model constant is ¥3,000 and is charged once per departure (出国一回につき). The computed function `n × 3,000` is claimed linear in the number of **taxable** departures (第五条 proviso and 第六条 非課税 are out of scope), not in every physical departure. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` — new check 「国際観光旅客税法 art. 15（出国一回につき三千円）」 pinned to law 430AC0000000016, article locator 第十五条, needle 「国際観光旅客税の税率は、本邦からの出国一回につき、三千円とする」. Independently re-walked the pinned raw JSON: needle occurs exactly once. |
| D (decision) | PASS — needle found in the pinned article; audit reports `160/160 checks passed`. |
| C (competing interpretation) | 「三千円」 occurs in unrelated registration-fee provisions of other laws (登録免許税法 etc.); within this pinned file it is unique and occurs only in 第十五条. A whole-file numeric match across the repository would still mislocate the constant, so this unit is pinned by law id + revision + 第十五条 + structural path + source digest, not by the number alone. The special-collection case (category defined in 第二条第一項第七号, imposed by 第十六条 / 第十七条) is a distinct norm and is NOT modelled here. |
| U (uncertainty) | This is a transcription-fidelity decision, not legal correctness. The precise determination of 出国, the 第五条 proviso and 第六条 非課税, and the special-collection procedure of 第十六条 / 第十七条 are out of scope. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/InternationalTouristTaxUnit.lean` —
  `ratePerDeparture : Money := 3_000`, `taxForDepartures n = n * ratePerDeparture`.
- Independent spec: `JapanTaxLaw/InternationalTouristTaxUnitSpec.lean` —
  `specSum` is primitive-recursive repeated addition of ¥3,000, a deliberately
  different formulation from the implementation's multiplication.
- Kernel proof: `agree_international_tourist_tax` proves equality for **all**
  `Nat` departure counts by induction (no finite enumeration); plus
  `specSum_zero`, `specSum_pos_of_pos`, `taxForDepartures_mono`, and boundary
  examples decided by the kernel.
- Cross-law: `cross_law_source_collected` evaluates the model's 国税通則法
  art. 2(2) classifier `TaxKind.internationalTourismSpecialCollZei` (the source
  pin for that classification lives in `TaxGeneral.lean`; this theorem does not
  re-derive the legal classification from the pinned 国税通則法 text).
- Tests: `JapanTaxLaw/InternationalTouristTaxUnitTests.lean` — 0, 1, 2, 3,
  1000 departures, all kernel-decided.
- Build: `lake build` — 527 jobs, completed successfully. No `sorry`/`admit`/`axiom`.

## Not modelled (explicitly retained as unhandled scope)

第五条 proviso and 第六条 非課税 (exemptions), the special-collection procedure of
第十六条 / 第十七条 (whose category is defined in 第二条第一項第七号), the precise
definition of 出国, and collection procedure. This is a computable slice of one
norm unit, not an article-level or law-level completion claim. Human legal
review is pending.

## Adversarial review

Independent adversarial findings are recorded in
`docs/ADVERSARIAL_INTERNATIONAL_TOURIST_TAX_15.md` (H/T/D/C/U per finding).
