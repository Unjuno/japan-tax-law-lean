import JapanTaxLaw.TaxFinance

/-
# AviationFuelThousandRoundDown — 航空機燃料譲与税法 第四条（千円未満端数切捨て）

Sources (pinned):
  Law id: 347AC0000000013 (航空機燃料譲与税法)
  Revision: 347AC0000000013_20240401_506AC0000000004
  Raw snapshot: data/raw/347AC0000000013_20240401_506AC0000000004.law.json
  SHA-256: 83ec3090a44c6100c8915c0aaef57c3aeb45ea9067538531b6e7d8e447411288
  Article Num 4 (第四条), scoped leaf text 139 chars (U+3000 count 0).

原文逐語（scoped Article 4）:
  「各空港関係市町村及び空港関係都道府県に対する前条第一項に規定する各譲与時期ごとに譲与すべき航空機燃料譲与税の額として前三条の規定を適用して計算した金額に千円未満の端数金額があるときは、その端数金額を控除した金額をもつて、当該各譲与時期ごとに譲与すべき航空機燃料譲与税の額とする。」

Variable contract:
  yen = 前三条の規定を適用して計算した金額 (Nat, 円);
  roundingUnitYen = 千円 = 1,000 円;
  千円未満の端数 = yen % 1000;
  rounded = yen - (yen % 1000) = yen / 1000 * 1000 (INCLUSIVE/EXACT at multiples of 1000).

Scope: 本スライスは明示的な端数処理（千円未満の端数金額を控除）のみを扱う。
前三条の算定手続・配分・譲与時期そのものは NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.AviationFuelThousandRoundDown

/-- 端数処理の粒度 = 千円。 -/
def roundingUnitYen : Nat := 1000

/-- 千円未満の端数金額を控除した額 = 千円単位への切捨て（INCLUSIVE/EXACT at 1000）。 -/
def roundDownThousand (yen : Nat) : Nat :=
  yen / roundingUnitYen * roundingUnitYen

/-- 各譲与時期ごとに譲与すべき航空機燃料譲与税の額（端数控除後）。 -/
def roundedGrant (yen : Nat) : Nat :=
  roundDownThousand yen

theorem roundingUnitYen_eq : roundingUnitYen = 1000 := by decide

theorem roundDownThousand_zero : roundDownThousand 0 = 0 := by decide

theorem roundDownThousand_999 : roundDownThousand 999 = 0 := by decide

theorem roundDownThousand_1000 : roundDownThousand 1000 = 1000 := by decide

theorem roundDownThousand_1001 : roundDownThousand 1001 = 1000 := by decide

theorem roundDownThousand_1999 : roundDownThousand 1999 = 1000 := by decide

theorem roundDownThousand_2000 : roundDownThousand 2000 = 2000 := by decide

theorem roundedGrant_zero : roundedGrant 0 = 0 := by decide

theorem roundedGrant_999 : roundedGrant 999 = 0 := by decide

theorem roundedGrant_1000 : roundedGrant 1000 = 1000 := by decide

theorem roundedGrant_1001 : roundedGrant 1001 = 1000 := by decide

theorem roundedGrant_1999 : roundedGrant 1999 = 1000 := by decide

theorem roundedGrant_2000 : roundedGrant 2000 = 2000 := by decide

example : roundingUnitYen = 1000 := by decide

example : roundingUnitYen = 1000 := roundingUnitYen_eq

example : roundDownThousand 1001 = 1000 := roundDownThousand_1001

example : roundedGrant 1999 = 1000 := roundedGrant_1999

end JapanTaxLaw.AviationFuelThousandRoundDown
