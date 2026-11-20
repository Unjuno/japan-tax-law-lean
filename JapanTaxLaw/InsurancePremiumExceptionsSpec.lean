/-!
# InsurancePremiumExceptionsSpec — 独立形式仕様

pinned 原文（325AC0000000226 art.34 / art.314の2 の保険料控除区分四種）
から独立に読み取った仕様。実装を import しない。

四区分（新生命/旧生命/新個人年金/旧個人年金）は相互に異なり、
いずれも「（３）に掲げる場合」の除外に服する。
-/
namespace JapanTaxLaw.InsurancePremiumExceptionsSpec

def categoriesSpec : List Nat := [0, 1, 2, 3]

def appliesSpec (c : Nat) (ex : Bool) : Prop := c < 4 ∧ ex = false

end JapanTaxLaw.InsurancePremiumExceptionsSpec
