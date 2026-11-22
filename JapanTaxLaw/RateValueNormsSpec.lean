/-\!
# RateValueNormsSpec — 独立形式仕様

pinned 原文（百分率・千分率・金額当たり率 926条片）から独立に読み取った仕様。
実装を import しない。

百分率は base*n/100、千分率は base*n/1000、金額当たり率は units*a。
具体的な base/numerator は NOT MODELLED。
-/
namespace JapanTaxLaw.RateValueNormsSpec

def percentSpec (base numerator : Nat) : Nat := base * numerator / 100
def permilleSpec (base numerator : Nat) : Nat := base * numerator / 1000
def perAmountSpec (units amountPerUnit : Nat) : Nat := units * amountPerUnit

end JapanTaxLaw.RateValueNormsSpec
