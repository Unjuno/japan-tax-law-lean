# Unit review — 石油ガス譲与税法 art. 4 (千円未満端数控除)

Normative unit id: `NORM|7ba796706788559d098393e282a1800729a2fc825e2bf8d2282f864f7d90d8e7`
Law: `340AC0000000157` (石油ガス譲与税法), revision `340AC0000000157_20090401_421AC0000000009`.
Source: `data/raw/340AC0000000157_20090401_421AC0000000009.law.json`
Provision path: `LawBody[1]/MainProvision/MainProvision[3]/Article#4/Paragraph#1`

Verbatim: 「…計算した金額に千円未満の端数金額があるときは、その端数金額を控除した金額をもつて、当該各譲与時期ごとに譲与すべき石油ガス譲与税の額とする。」

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | The amount is reduced by its sub-1,000-yen remainder; unit = 1,000 yen, domain = non-negative money (Nat). |
| T | `transcription_audit.py` needle 「千円未満の端数金額があるときは、その端数金額を控除した金額」, scoped to Article Num 4; independent kanji literal `千` located in the scoped 原文. |
| D | PASS — needle found in the scoped main provision; boundary grid 0/999/1000/1001/1999/2000 agrees. |
| C | 国税通則法 art.118 also truncates 千円未満, but for 課税標準 of national taxes; it is not the source of this unit. Art.1 (`OilGasGrantTax.lean`) models the 1/2 grant amount, not the end-of-period rounding. |
| U | Whether the same rounding applies inside the preceding-articles computation is not stated here and is retained as unhandled scope. |

## Model and proof

- Implementation: `JapanTaxLaw/OilGasGrantRounding.lean` — `roundingUnitYen = 1000`, `floorThousandYen x = x / 1000 * 1000`.
- Independent spec: `JapanTaxLaw/OilGasGrantRoundingSpec.lean` — own constant `specUnit`, alternative formula `x - x % specUnit`.
- Universal kernel proof: `agreeRound (yen : Money) : specFloor yen = floorThousandYen yen` for every amount (not a finite enumeration).
- Tests: `JapanTaxLaw/OilGasGrantRoundingTests.lean` — 11 kernel-decided examples/boundaries.

## Not modelled

前二条による譲与額本体の算定、譲与時期、指定市の認定、附則・経過措置、国税通則法 art.118 との関係。This is one computable slice, not an article-level or law-level completion claim. Human legal review remains `LEGAL_REVIEW_PENDING`.
