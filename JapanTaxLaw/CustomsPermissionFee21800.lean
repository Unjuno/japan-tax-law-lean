import JapanTaxLaw.TaxFinance

/-!
# CustomsPermissionFee21800 — 税関関係手数料令 art.2（許可手数料 21,800/21,700円）
Sources (pinned): law `329CO0000000164` / rev `329CO0000000164_20250401_507CO0000000141`.
原文: 「二万千八百円（当該許可を受ける者が指定者である場合にあつては、二万千七百円）」
Computation: 指定者でない場合は 21,800 円、指定者の場合は 21,700 円。
Scope: 指定者の認定・許可手続は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.CustomsPermissionFee21800

def standardFee : Nat := 21_800
def designatedFee : Nat := 21_700

def fee (isDesignated : Bool) : Nat :=
  if isDesignated then designatedFee else standardFee

example : fee false = 21_800 := by decide
example : fee true = 21_700 := by decide

end JapanTaxLaw.CustomsPermissionFee21800
