# Unit review — 関税定率法 第九条(4) 第一号 CONDITION

Normative unit id: `NORM|7cfb458918c95cb9c89dfc9e3f230612412a98de1f8426918de7269131260be4`

Law: 143AC0000000054 (関税定率法), Act. SHA-256 924a01d3…86ae9c.

Verbatim source text (injected from the queue, not hand-typed): 「当該貨物につき、別表の税率による関税のほか、当該輸入される貨物の課税価格と同額以下の関税を課すること。」

Exact source position: `LawBody[1]/MainProvision/MainProvision[19]/Article:9/Article#9/Paragraph#4/Item#1/ItemSentence/Sentence#1`.

Norm kind: **CONDITION** (with EFFECT aspect) — additional customs duty on the goods is not to exceed the taxable value of the imported goods, and is imposed in addition to the table-rate duty. Computable slice: the cap relation over Nat amounts and the additive-total boundary. CJK in the quote is byte-verbatim from the pinned source; English prose is descriptive.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | Additional duty <= taxable value; total duty includes both table and additional components. |
| T | `scripts/ci/transcription_audit.py` article-kind check for CustomsTariffArt9AdditionalDutyCap.lean. |
| D | PASS — transcription audit 615/615. |
| C | Only the cap relation and additive boundary are modeled. Rate table, valuation rules, and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt9AdditionalDutyCap.lean` — `withinCap` (<=), `totalDuty` (table + additional), five boundary theorems.
- Independent spec: `SpecWithinCap` (no reverse strict inequality) proved equivalent to implementation; `SpecTotal` (each component bounded by total) as a boundary consequence of "in addition to" (full arithmetic equality not claimed). All seven unit theorems axiom-free via Nat-specific core lemmas; no propext/simp/decide in proofs.
- Build: full lake build success (2017 jobs); no `sorryAx`/`Classical.choice`.

## Not modelled
Rate table, valuation rules, legal correctness — all NOT MODELLED. The full arithmetic equality for total duty is deliberately not claimed; only the component-boundary consequence is verified.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART9_ADDITIONAL_DUTY_CAP.md`.
