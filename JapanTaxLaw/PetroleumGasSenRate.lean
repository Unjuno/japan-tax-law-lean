import JapanTaxLaw.TaxFinance

/-
# PetroleumGasSenRate — 石油ガス税法 art.10（税率十七円五十銭）

Pinned source:
  Law id: 340AC0000000156
  Revision: 340AC0000000156_20260525_506AC0000000052
  Raw snapshot: data/raw/340AC0000000156_20260525_506AC0000000052.law.json
  SHA-256: 537d080b0297f777c2ef10a5b7439b00c09cb6dfe1c28c40fdfeac346f36f153
  Statutory article: 第十条 (art. 10; raw JSON Article attr.Num = "10")

原文逐語（pinned, 一字一句改変なし）:
  「石油ガス税の税率は、課税石油ガス一キログラムにつき、十七円五十銭とする。」

Variable contract:
  `yen : Nat` = 法定税率の円 component（十七円 = 17）。
  `sen : Nat` = 法定税率の銭 component（五十銭 = 50）。
  いずれも課税石油ガス一キログラム（1 kg）あたりの税率の二成分。
  十七円五十銭 = (17, 50)。1銭 = 1/100円 は本文の文脈情報であり、
  数値スケール定数としてモデル化しない（原文の数詞は 十七 / 五十 のみ）。

Scope: 第十条の明示的な二成分税率（十七円五十銭 / kg）のみを扱う。
課税標準、免税・税額控除、申告・納付、他の条文・号は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.PetroleumGasSenRate

/-- 十七円 — the yen component of the statutory rate. -/
def unitYen : Nat := 17

/-- 五十銭 — the sen component of the statutory rate. -/
def unitSen : Nat := 50

/-- 二成分税率が法定の (十七円, 五十銭) と一致するか。 -/
def rateMatches (yen : Nat) (sen : Nat) : Bool :=
  decide (yen == unitYen && sen == unitSen)

/-- 十七円五十銭 = (17, 50) は一致する。 -/
theorem rateMatches_17_50 : rateMatches 17 50 = true := by decide

/-- 十七円零銭は一致しない。 -/
theorem rateMatches_17_0 : rateMatches 17 0 = false := by decide

/-- 十六円五十銭は一致しない。 -/
theorem rateMatches_16_50 : rateMatches 16 50 = false := by decide

/-- 定数値: 十七円 = 17。 -/
theorem unitYen_value : unitYen = 17 := rfl

/-- 定数値: 五十銭 = 50。 -/
theorem unitSen_value : unitSen = 50 := rfl

end JapanTaxLaw.PetroleumGasSenRate
