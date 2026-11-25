import JapanTaxLaw.TaxFinance

/-!
# DeletionExtension30Days — 関税法 art. 123（消去求請期間の延長 三十日以内）

Sources (pinned):

  Law id: 329AC0000000061
  Revision: 329AC0000000061_20260601_508AC0000000005
  Raw snapshot: data/raw/329AC0000000061_20260601_508AC0000000005.law.json

Pinned 原文: 「前項の規定により消去しないよう求める期間については、特に必要があるときは、三十日を超えない範囲内で延長することができる。」

Scoped claim: only the 消去求請期間の延長 三十日以内 numeric condition; other conditions are caller-established.
-/

namespace JapanTaxLaw.DeletionExtension30Days

def limit : Nat := 30
def allowed (x : Nat) : Bool := decide (x <= limit)

theorem limit_value : limit = 30 := by rfl

end JapanTaxLaw.DeletionExtension30Days
