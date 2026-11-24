import JapanTaxLaw.LocalTaxRateTable

/-!
# LocalTaxRateTableSpec — 独立の税率表と全称の照合証明

The spec is an independent association list transcribed from the same pinned
provisions, with a lookup function. The theorem proves, for ALL 11 RateKind
values (exhaustive case analysis), that the implementation's function equals
the table lookup. This is not a finite sample: RateKind has exactly the eleven
pinned constructors and every one is checked.
-/

namespace JapanTaxLaw.LocalTaxRateTable

/-- 独立税率表（原文の数値をそのまま対として列挙）。 -/
def rateTable : List (RateKind × Nat) :=
  [ (RateKind.interestSplit, 50),
    (RateKind.dividendSplit, 50),
    (RateKind.shareTransferSplit, 50),
    (RateKind.miningTax, 10),
    (RateKind.corporateShareStandardLow, 10),
    (RateKind.corporateShareStandardHigh, 60),
    (RateKind.realEstateAcquisition, 40),
    (RateKind.fixedAsset, 14),
    (RateKind.separatedIncomeLow, 40),
    (RateKind.separatedIncomeHigh, 60),
    (RateKind.idleLandHolding, 14) ]

/-- 独立仕様: 表からの検索。 -/
def specRate (k : RateKind) : Nat :=
  match rateTable.find? (fun p => p.1 == k) with
  | some p => p.2
  | none => 0

/-- 実装 ≡ 独立税率表（全 11 税目を網羅する全称証明）。 -/
theorem agreeRateTable (k : RateKind) : ratePerMille k = specRate k := by
  cases k <;> native_decide

end JapanTaxLaw.LocalTaxRateTable
