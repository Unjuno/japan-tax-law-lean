/-\!
# InheritanceTaxDebtForgivenessSpec — 独立形式仕様

相続税法第八条の原文（data/raw/325AC0000000073_...law.json）から独立に読み取った
仕様。実装を import しない。変数の意味・単位・定義域は実装 docstring に記録済み。
-/
namespace JapanTaxLaw.InheritanceTaxDebtForgivenessSpec

def deemedGiftAmountSpec (debt consideration : Nat) : Nat := debt - consideration
def provisoAppliesSpec (insolvent e1 e2 : Bool) : Bool := insolvent && (e1 || e2)
def effectiveDeemedGiftSpec (debt consideration : Nat) (proviso : Bool) : Nat :=
  if proviso then 0 else deemedGiftAmountSpec debt consideration

end JapanTaxLaw.InheritanceTaxDebtForgivenessSpec
