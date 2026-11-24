# Unit review — 自動車重量譲与税法 art. 4 (千円未満端数控除)

Normative unit id: see `build/task_queue.json` (law `346AC0000000090`, article `4`).
Law: 自動車重量譲与税法, revision `346AC0000000090_20260401_508AC0000000009`-equivalent pinned revision `346AC0000000090_20260401_508AC0000000002`.
Source: `data/raw/346AC0000000090_20260401_508AC0000000002.law.json`
Provision: `LawBody[1]/MainProvision/MainProvision[4]/Article#4/Paragraph#1`

Verbatim: 「…計算した金額に千円未満の端数金額があるときは、その端数金額を控除した金額をもつて、当該各譲与時期に譲与すべき自動車重量譲与税の額とする。」

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | The amount is reduced by its sub-1,000-yen remainder; unit = 1,000 yen, domain = non-negative money (Nat). |
| T | `transcription_audit.py` needle 「千円未満の端数金額があるときは、その端数金額を控除した金額」, scoped to Article Num 4. |
| D | PASS — needle in the scoped main provision; kernel boundary grid agrees. |
| C | The identical rounding clause in 石油ガス譲与税法 art.4 is a different statute; it is not the source here. Preceding-articles amount computation is unmodelled. |
| U | Whether this rounding also applies inside the preceding-articles computation is not stated; retained as unhandled scope. |

## Model and proof

- Impl: `JapanTaxLaw/AutoWeightGrantRounding.lean` — `x / 1000 * 1000`.
- Independent spec: `AutoWeightGrantRoundingSpec.lean` — own constant and `x - x % 1000`.
- Universal kernel proof: `agreeRound (yen : Money)`.
- Tests: `AutoWeightGrantRoundingTests.lean` — 11 kernel-decided boundary examples.

Not modelled: 前三条の譲与額本体、譲与時期、附則・経過措置。Human legal review remains `LEGAL_REVIEW_PENDING`.
