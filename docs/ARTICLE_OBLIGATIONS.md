# Article verification obligations (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/article_obligations.py`.

Objective §4: register verification obligations per article. An article is
machine-verification-COMPLETE only if ALL six mechanical obligations below
are satisfied. This does NOT include independent human legal review (tracked
in docs/BLOCKED.md) and does NOT establish legal correctness. Partial
condition coverage never counts as article completion.

Obligations: (1) pinned needle FOUND, (2) impl module, (3) independent Spec,
(4) Tests, (5) no forbidden proof markers, (6) agree* correspondence,
Independent adversarial-review coverage is reported as a SEPARATE axis
(Objective §4 requires separate counts), not folded into the six proof
obligations. Human legal review is a further separate axis in docs/BLOCKED.md.

## Totals

- articles with explicit pin: 52
- machine-verification-complete: 52
- incomplete: 0
- articles with independent adversarial review coverage: 0/52 (separate axis)
- human legal review completed: 0 (out of repo — see docs/BLOCKED.md)

## Per-article status

| law_id | law | article | module | needle | impl | spec | tests | clean | agree | status |
|---|---|---|---|:--:|:--:|:--:|:--:|:--:|:--:|---|
| `340AC0000000034` | 法人税法 | 第六十六条 | CorporateTaxRate | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `325AC0000000073` | 相続税法 | 第二十一条の七 | GiftTax | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `325AC0000000073` | 相続税法 | 第二十一条の五 | GiftTax | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `340AC0000000033` | 所得税法 | 第八十九条 | IndividualIncomeTax | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `332AC0000000026` | 租税特別措置法 | 第三十一条の四 | DeemedCapitalGainsCost | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `332AC0000000026` | 租税特別措置法 | 第六十七条の二 | PhaseECorpRates | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `332AC0000000026` | 租税特別措置法 | 第六十八条 | PhaseECorpRates | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `325AC0000000073` | 相続税法 | 第十九条の二 | SpouseRelief | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `332AC0000000026` | 租税特別措置法 | 第八十七条の二 | LowAlcoholDutySpecialRate | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `332AC0000000026` | 租税特別措置法 | 第九条の三の二 | ListedDividendWithholding | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `332AC0000000026` | 租税特別措置法 | 第三十一条の三 | ResidentialTransferSpecialTax | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `332AC0000000026` | 租税特別措置法 | 第七十条の二の五 | SpecialGiftRate | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `332AC0000000026` | 租税特別措置法 | 第九十一条 | StampDutySpecial91 | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `340AC0000000034` | 法人税法 | 第六十七条 | CorporateSurtax | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `325AC0000000073` | 相続税法 | 第十八条 | InheritanceSurcharge | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `337AC0000000066` | 国税通則法 | 第百十八条 | TaxRounding | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `337AC0000000066` | 国税通則法 | 第百十九条 | TaxRounding | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `325AC0000000073` | 相続税法 | 第十五条 | InheritanceTax | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `325AC0000000073` | 相続税法 | 第十六条 | InheritanceTax | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `325AC0000000073` | 相続税法 | 第十九条 | GiftAddBack | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `325AC0000000073` | 相続税法 | 第二十条 | InheritanceSuccessiveDeduction | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `325AC0000000073` | 相続税法 | 第二十一条の六 | SpousalGiftDeduction | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `342AC0000000023` | 印紙税法 | 第二十条 | StampDuty | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `325AC0000000226` | 地方税法 | 第三十四条 | LocalIncomeTax | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `325AC0000000226` | 地方税法 | 第三百十四条の三 | LocalInhabitantTax | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `340AC0000000034` | 法人税法 | 第六十四条の五 | CorporateGroupLossOffset | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `340AC0000000034` | 法人税法 | 第五十七条 | CorporateLossCarryforward | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `325AC0000000226` | 地方税法 | 第三十四条 | LocalIncomeTax | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `325AC0000000226` | 地方税法 | 第三十四条 | SpouseSpecialDeduction | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `325AC0000000226` | 地方税法 | 第三十四条 | SocialInsuranceMutualAidDeduction | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `325AC0000000226` | 地方税法 | 第三十四条 | DisasterLossDeduction | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `325AC0000000226` | 地方税法 | 第三十四条 | LocalInsuranceDeduction | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `363AC0000000108` | 消費税法 | 第二十九条 | ConsumptionTaxRate | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `363AC0000000108` | 消費税法 | 第二十八条 | ConsumptionTaxableBase | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `363AC0000000108` | 消費税法 | 第二十八条 | ConsumptionTaxImportBase | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `363AC0000000108` | 消費税法 | 第三十条 | ConsumptionTaxInputCredit | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `337AC0000000066` | 国税通則法 | 第六十七条 | NonpaymentSurcharge | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `337AC0000000066` | 国税通則法 | 第六十六条 | UnreportedSurcharge | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `337AC0000000066` | 国税通則法 | 第六十条 | DelinquencyTax | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `337AC0000000066` | 国税通則法 | 第五十八条 | RefundInterest | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `340AC0000000034` | 法人税法 | 第六十四条の七 | GroupLossRatio | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `325AC0000000073` | 相続税法 | 第二十一条の十二 | GiftSpecialDeduction | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `143AC0000000054` | 関税定率法 | 第六条 | CustomsRetaliatoryDuty | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `143AC0000000054` | 関税定率法 | 第十条 | CustomsDamageReduction | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `143AC0000000054` | 関税定率法 | 第四条の七 | CustomsExchangeRate | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `143AC0000000054` | 関税定率法 | 第三条の三 | CustomsSmallConsignment | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `143AC0000000054` | 関税定率法 | 第四条の六 | CustomsAirCargo | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `143AC0000000054` | 関税定率法 | 第四条の三 | CustomsDomesticValue | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `143AC0000000054` | 関税定率法 | 第四条の二 | CustomsSimilarGoods | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `143AC0000000054` | 関税定率法 | 第四条 | CustomsTransactionPrice | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `143AC0000000054` | 関税定率法 | 第四条の五 | CustomsValueAfterDamage | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
| `325AC0000000226` | 地方税法 | 第三十五条 | LocalIncomeTax | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | COMPLETE |
