import JapanTaxLaw.TaxFinance

/-!
# LocalTaxRateTable — 地方税法 税目別税率（11 規範単位）L4 モデル

Sources (pinned, all from 地方税法 law 325AC0000000226):
  第71条の6   利子割 5%             -> 50 per-mille
  第71条の28  配当割 5%             -> 50
  第71条の49  株式等譲渡所得割 5%    -> 50
  第520条     鉱産税 標準 1%         -> 10
  第51条      法人税割 標準 1%       -> 10
  第314条の4  法人税割 標準 6%       -> 60
  第73条の15  不動産取得税 標準 4%   -> 40
  第350条     固定資産税 標準 1.4%   -> 14
  第50条の4   分離課税所得割 4%      -> 40
  第328条の3  分離課税所得割 6%      -> 60
  第623条     特別土地保有税 1.4%    -> 14

Each unit's normative_id and verbatim text is recorded in the per-unit audit.
Rates are encoded as integer per-mille (千分率): 5% = 50, 1.4% = 14.
Domain: an index over the eleven pinned provisions. The tax bases and
eligibility are caller-established and NOT MODELLED. Not legal advice.
-/

namespace JapanTaxLaw.LocalTaxRateTable

/-- 11 の pinned 税率規定を区別する添字。 -/
inductive RateKind where
  | interestSplit | dividendSplit | shareTransferSplit
  | miningTax | corporateShareStandardLow | corporateShareStandardHigh
  | realEstateAcquisition | fixedAsset | separatedIncomeLow | separatedIncomeHigh
  | idleLandHolding

deriving DecidableEq, Repr

/-- 実装: 税目ごとの税率（千分率）。 -/
def ratePerMille : RateKind → Nat
  | RateKind.interestSplit => 50
  | RateKind.dividendSplit => 50
  | RateKind.shareTransferSplit => 50
  | RateKind.miningTax => 10
  | RateKind.corporateShareStandardLow => 10
  | RateKind.corporateShareStandardHigh => 60
  | RateKind.realEstateAcquisition => 40
  | RateKind.fixedAsset => 14
  | RateKind.separatedIncomeLow => 40
  | RateKind.separatedIncomeHigh => 60
  | RateKind.idleLandHolding => 14

end JapanTaxLaw.LocalTaxRateTable
