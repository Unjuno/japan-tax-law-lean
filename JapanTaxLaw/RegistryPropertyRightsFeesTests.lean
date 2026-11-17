import JapanTaxLaw.RegistryPropertyRightsFees
import JapanTaxLaw.RegistryPropertyRightsFeesSpec

/-!
# RegistryPropertyRightsFeesTests — 別表第一（二）四〜四の四の smoke checks

Decidable kernel smoke tests, pinned to

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01

Each `example` is closed by kernel `decide`; no theorem names are added.
The 課税標準 (`base`) and the case counts are caller-established; no Bool enters
any formula. Rounding is floor (切り捨て) via TaxRate.applyFloor.
This module re-checks every rate literal, every flat amount and several base
amounts (incl. floor boundaries) independently of the main module's own smoke,
and re-checks the independent integer formulas and their agreement flag.
Scope: 四 ダム使用権 / 四の二 公共施設等運営権 / 四の三 樹木採取権 /
四の四 漁港水面施設運営権 only (五 工場財団等 and 六 are out of scope).
-/

namespace JapanTaxLaw.RegistryPropertyRightsFees

open JapanTaxLaw.TaxFinance

-- 率定数: 分子・分母・well-definedness（4 権利 × 4 率）
example : damThousandthRate.num = 1 := by decide
example : damThousandthRate.den = 1000 := by decide
example : 0 < damThousandthRate.den := by decide
example : damFiveThousandthsRate.num = 5 := by decide
example : damFiveThousandthsRate.den = 1000 := by decide
example : 0 < damFiveThousandthsRate.den := by decide
example : damFourThousandthsRate.num = 4 := by decide
example : damFourThousandthsRate.den = 1000 := by decide
example : 0 < damFourThousandthsRate.den := by decide
example : damTwoThousandthsRate.num = 2 := by decide
example : damTwoThousandthsRate.den = 1000 := by decide
example : 0 < damTwoThousandthsRate.den := by decide

example : pfcThousandthRate.num = 1 := by decide
example : pfcThousandthRate.den = 1000 := by decide
example : 0 < pfcThousandthRate.den := by decide
example : pfcFiveThousandthsRate.num = 5 := by decide
example : pfcFiveThousandthsRate.den = 1000 := by decide
example : 0 < pfcFiveThousandthsRate.den := by decide
example : pfcFourThousandthsRate.num = 4 := by decide
example : pfcFourThousandthsRate.den = 1000 := by decide
example : 0 < pfcFourThousandthsRate.den := by decide
example : pfcTwoThousandthsRate.num = 2 := by decide
example : pfcTwoThousandthsRate.den = 1000 := by decide
example : 0 < pfcTwoThousandthsRate.den := by decide

example : treeThousandthRate.num = 1 := by decide
example : treeThousandthRate.den = 1000 := by decide
example : 0 < treeThousandthRate.den := by decide
example : treeFiveThousandthsRate.num = 5 := by decide
example : treeFiveThousandthsRate.den = 1000 := by decide
example : 0 < treeFiveThousandthsRate.den := by decide
example : treeFourThousandthsRate.num = 4 := by decide
example : treeFourThousandthsRate.den = 1000 := by decide
example : 0 < treeFourThousandthsRate.den := by decide
example : treeTwoThousandthsRate.num = 2 := by decide
example : treeTwoThousandthsRate.den = 1000 := by decide
example : 0 < treeTwoThousandthsRate.den := by decide

example : portThousandthRate.num = 1 := by decide
example : portThousandthRate.den = 1000 := by decide
example : 0 < portThousandthRate.den := by decide
example : portFiveThousandthsRate.num = 5 := by decide
example : portFiveThousandthsRate.den = 1000 := by decide
example : 0 < portFiveThousandthsRate.den := by decide
example : portFourThousandthsRate.num = 4 := by decide
example : portFourThousandthsRate.den = 1000 := by decide
example : 0 < portFourThousandthsRate.den := by decide
example : portTwoThousandthsRate.num = 2 := by decide
example : portTwoThousandthsRate.den = 1000 := by decide
example : 0 < portTwoThousandthsRate.den := by decide

-- 定額（一件につき千円）
example : damPerCaseFee = 1_000 := by decide
example : pfcPerCaseFee = 1_000 := by decide
example : treePerCaseFee = 1_000 := by decide
example : portPerCaseFee = 1_000 := by decide
example : damPerCaseFee > 0 := by decide
example : pfcPerCaseFee > 0 := by decide
example : treePerCaseFee > 0 := by decide
example : portPerCaseFee > 0 := by decide

-- 1/1000: 0→0, 249→0, 250→0, 999→0, 1000→1, 1001→1, 12345→12, 1000000→1000
example : damThousandthFee 0 = 0 := by decide
example : damThousandthFee 249 = 0 := by decide
example : damThousandthFee 999 = 0 := by decide
example : damThousandthFee 1000 = 1 := by decide
example : damThousandthFee 1001 = 1 := by decide
example : damThousandthFee 12_345 = 12 := by decide
example : damThousandthFee 1_000_000 = 1_000 := by decide
example : pfcThousandthFee 0 = 0 := by decide
example : pfcThousandthFee 1000 = 1 := by decide
example : pfcThousandthFee 12_345 = 12 := by decide
example : treeThousandthFee 1000 = 1 := by decide
example : portThousandthFee 1000 = 1 := by decide

-- 5/1000: 199→0, 200→1, 999→4, 1000→5, 1001→5, 12345→61, 1000000→5000
example : damFiveThousandthsFee 0 = 0 := by decide
example : damFiveThousandthsFee 199 = 0 := by decide
example : damFiveThousandthsFee 200 = 1 := by decide
example : damFiveThousandthsFee 999 = 4 := by decide
example : damFiveThousandthsFee 1000 = 5 := by decide
example : damFiveThousandthsFee 1001 = 5 := by decide
example : damFiveThousandthsFee 12_345 = 61 := by decide
example : damFiveThousandthsFee 1_000_000 = 5_000 := by decide
example : pfcFiveThousandthsFee 0 = 0 := by decide
example : pfcFiveThousandthsFee 1000 = 5 := by decide
example : pfcFiveThousandthsFee 12_345 = 61 := by decide
example : treeFiveThousandthsFee 1000 = 5 := by decide
example : portFiveThousandthsFee 1000 = 5 := by decide

-- 4/1000: 249→0, 250→1, 999→3, 1000→4, 1001→4, 12345→49, 1000000→4000
example : damFourThousandthsFee 0 = 0 := by decide
example : damFourThousandthsFee 249 = 0 := by decide
example : damFourThousandthsFee 250 = 1 := by decide
example : damFourThousandthsFee 999 = 3 := by decide
example : damFourThousandthsFee 1000 = 4 := by decide
example : damFourThousandthsFee 1001 = 4 := by decide
example : damFourThousandthsFee 12_345 = 49 := by decide
example : damFourThousandthsFee 1_000_000 = 4_000 := by decide
example : pfcFourThousandthsFee 0 = 0 := by decide
example : pfcFourThousandthsFee 1000 = 4 := by decide
example : pfcFourThousandthsFee 12_345 = 49 := by decide
example : treeFourThousandthsFee 1000 = 4 := by decide
example : portFourThousandthsFee 1000 = 4 := by decide

-- 2/1000: 499→0, 500→1, 999→1, 1000→2, 1001→2, 12345→24, 1000000→2000
example : damTwoThousandthsFee 0 = 0 := by decide
example : damTwoThousandthsFee 499 = 0 := by decide
example : damTwoThousandthsFee 500 = 1 := by decide
example : damTwoThousandthsFee 999 = 1 := by decide
example : damTwoThousandthsFee 1000 = 2 := by decide
example : damTwoThousandthsFee 1001 = 2 := by decide
example : damTwoThousandthsFee 12_345 = 24 := by decide
example : damTwoThousandthsFee 1_000_000 = 2_000 := by decide
example : pfcTwoThousandthsFee 0 = 0 := by decide
example : pfcTwoThousandthsFee 1000 = 2 := by decide
example : pfcTwoThousandthsFee 12_345 = 24 := by decide
example : treeTwoThousandthsFee 1000 = 2 := by decide
example : portTwoThousandthsFee 1000 = 2 := by decide

-- 独立定式（Spec）の再確認と agree フラグ
example : specDamFiveThousandthsFee 12_345 = 61 := by decide
example : specPfcFourThousandthsFee 999 = 3 := by decide
example : specTreeTwoThousandthsFee 1000 = 2 := by decide
example : specPortThousandthFee 12_345 = 12 := by decide
example : agreeRegistryPropertyRightsFees = true := by decide

end JapanTaxLaw.RegistryPropertyRightsFees
