import JapanTaxLaw.TaxFinance

/-!
# InternationalTouristTaxUnit — 国際観光旅客税法 art. 15 (¥3,000 / departure)

Pinned source:
  law 430AC0000000016 (国際観光旅客税法), revision
  430AC0000000016_20260701_508AC0000000012, enforcement 2026-07-01,
  snapshot sha256 486f27e35920bd186dd905d4a2269d01d9a4ecb28a2bb36514d7232276ead5ec.

Normative unit:
  NORM|4cd756c89d1d4861be56ba03c83c189d8981f13a9d09cd010124885ebe50d245
Verbatim:
  国際観光旅客税の税率は、本邦からの出国一回につき、三千円とする。

Variable contract
  `departures : Money` = 出国回数 (number of departures from Japan),
  unit 回 (times), domain Nat (non-negative integers).
  `taxForDepartures` has unit 円 (yen, Money = Nat).

Scope (one normative unit only): the ¥3,000-per-departure rate and its linear
application to a departure count.

NOT modelled (retained as unhandled scope, not silently dropped):
  the 第五条 proviso and 第六条 非課税 (exemptions), the special-collection
  procedure imposed by 第十六条 / 第十七条 (the 特別徴収 category itself is
  defined in 第二条第一項第七号), the precise definition of 出国, and collection
  procedure. This is a computable slice of one norm unit, not an article-level
  or law-level completion claim.

Independent original-text audit:
  scripts/ci/transcription_audit.py check 「国際観光旅客税法 art. 15」 pinned to
  第十五条; docs/UNIT_INTERNATIONAL_TOURIST_TAX_15.md records H/T/D/C/U and the
  exact source span. A text match alone is not an article locator: the unit is
  pinned by law id, revision, structural path and source digest.
-/

namespace JapanTaxLaw.InternationalTouristTaxUnit

open JapanTaxLaw.TaxFinance

/-- 三千円. Unit: 円 (Money = Nat); domain: non-negative integers. -/
def ratePerDeparture : Money := 3_000

/-- 国際観光旅客税額 = 出国回数 × 3,000円/回. -/
def taxForDepartures (departures : Money) : Money :=
  departures * ratePerDeparture

end JapanTaxLaw.InternationalTouristTaxUnit
